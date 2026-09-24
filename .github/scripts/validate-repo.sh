#!/usr/bin/env bash

set -u

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export REPO_ROOT

python3 - <<'PY'
import json
import os
import re
import sys
from pathlib import Path

root = Path(os.environ["REPO_ROOT"])
errors = []
warnings = []


def error(message):
    errors.append(message)


def warning(message):
    warnings.append(message)


required_dirs = [
    "data",
    "docs/model-mondays",
    "docs/foundry-fridays",
    "docs/assets/model-mondays",
    "docs/assets/foundry-fridays",
]
for value in required_dirs:
    if not (root / value).is_dir():
        error(f"Missing directory: {value}")

json_data = {}
for path in sorted((root / "data").glob("*.json")):
    try:
        json_data[path.name] = json.loads(path.read_text())
    except (OSError, json.JSONDecodeError) as exc:
        error(f"Invalid JSON in {path.relative_to(root)}: {exc}")

episode_pattern = re.compile(r"^\d{4}-\d{2}-\d{2}-s\d{2}-e\d{2}\.md$")
for path in (root / "docs/model-mondays").glob("*.md"):
    if path.name != "README.md" and not episode_pattern.match(path.name):
        error(f"Invalid episode filename: {path.relative_to(root)}")

ama_pattern = re.compile(r"^\d{4}-\d{2}-\d{2}-ama-\d{3}\.md$")
ama_pages = {}
for path in (root / "docs/foundry-fridays").glob("*.md"):
    if path.name == "README.md":
        continue
    if not ama_pattern.match(path.name):
        error(f"Invalid AMA filename: {path.relative_to(root)}")
        continue
    number = int(path.stem.rsplit("-", 1)[1])
    if number in ama_pages:
        error(f"Duplicate AMA page number: {number:03d}")
    ama_pages[number] = path

amas = json_data.get("amas.json", [])
ama_ids = [item.get("id") for item in amas]
ama_numbers = [item.get("number") for item in amas]
if len(ama_ids) != len(set(ama_ids)):
    error("Duplicate AMA IDs in data/amas.json")
if len(ama_numbers) != len(set(ama_numbers)):
    error("Duplicate AMA numbers in data/amas.json")
if ama_numbers and sorted(ama_numbers) != list(range(1, max(ama_numbers) + 1)):
    error("AMA numbers are not continuous from 1")
if set(ama_numbers) != set(ama_pages):
    error("AMA page numbers and data/amas.json numbers do not match")

ama_index_rows = {}
ama_index = root / "docs/foundry-fridays/README.md"
if ama_index.is_file():
    for line in ama_index.read_text().splitlines():
        if not line.startswith("| #"):
            continue
        cells = [cell.strip() for cell in line.split("|")[1:-1]]
        if len(cells) != 5:
            continue
        number = int(cells[0].lstrip("#"))
        page_match = re.search(r"\]\(([^)]+)\)", cells[4])
        ama_index_rows[number] = {
            "title": cells[2],
            "speakers": [] if cells[3] == "—" else cells[3].split("<br>"),
            "page": page_match.group(1) if page_match else "",
        }

for item in amas:
    number = item.get("number")
    expected_id = f"ama-{number:03d}" if isinstance(number, int) else None
    if item.get("id") != expected_id:
        error(f"AMA ID mismatch for number {number}: {item.get('id')}")
    for field in ("page", "banner"):
        value = item.get(field)
        if not value or not (root / value).is_file():
            error(f"{item.get('id')} has missing {field}: {value}")
    page = root / item.get("page", "")
    expected_name = f"{item.get('date')}-ama-{number:03d}.md"
    if page.is_file() and page.name != expected_name:
        error(f"{item.get('id')} page filename mismatch: {page.name}")
    if page.is_file():
        text = page.read_text()
        heading = re.search(rf"^# AMA #{number:03d}: (.+)$", text, re.M)
        if not heading or heading.group(1).strip() != item.get("title"):
            error(f"{item.get('id')} title differs between JSON and page")
        page_speakers = []
        multiline = re.search(
            r"\*\*Speakers:\*\*\s*\n(.*?)(?:\n\n|\n\*\*)", text, re.S
        )
        if multiline:
            page_speakers.extend(
                re.sub(r"^-\s*", "", line).strip()
                for line in multiline.group(1).splitlines()
                if line.strip().startswith("-")
            )
        for pattern in (
            r"\*\*Speakers:\*\*[ \t]*([^\n]+)",
            r"\*\*Speaker:\*\*[ \t]*([^\n]+)",
        ):
            match = re.search(pattern, text)
            if match and match.group(1).strip():
                page_speakers.append(match.group(1).strip())
        if page_speakers != item.get("speakers", []):
            error(f"{item.get('id')} speakers differ between JSON and page")
    index_row = ama_index_rows.get(number)
    if not index_row:
        error(f"{item.get('id')} is missing from the AMA index")
    else:
        if index_row["title"] != item.get("title"):
            error(f"{item.get('id')} title differs between JSON and AMA index")
        if index_row["speakers"] != item.get("speakers", []):
            error(f"{item.get('id')} speakers differ between JSON and AMA index")
        if index_row["page"] != expected_name:
            error(f"{item.get('id')} page differs between JSON and AMA index")

livestreams = json_data.get("livestreams.json", [])
ids = [item.get("id") for item in livestreams]
if len(ids) != len(set(ids)):
    error("Duplicate livestream IDs in data/livestreams.json")
for item in livestreams:
    if item.get("season") != 4:
        continue
    number = item.get("episode")
    page = root / f"docs/model-mondays/{item.get('date')}-s04-e{number:02d}.md"
    banner = root / item.get("banner", "")
    if not page.is_file():
        error(f"Missing Season 4 page for {item.get('id')}: {page.relative_to(root)}")
    else:
        text = page.read_text()
        title = re.search(r"^# (.+)$", text, re.M)
        host = re.search(r"^\*\*Host:\*\*\s*(.+)$", text, re.M)
        if not title or title.group(1).strip() != item.get("title"):
            error(f"{item.get('id')} title differs between JSON and page")
        if not host or host.group(1).strip() != item.get("host"):
            error(f"{item.get('id')} host differs between JSON and page")
        guests = []
        guest_block = re.search(r"\*\*Guests:\*\*\s*\n(.*?)(?:\n\n|\n##)", text, re.S)
        if guest_block:
            guests = [
                re.sub(r"^-\s*", "", line).split(" — ", 1)[0].strip()
                for line in guest_block.group(1).splitlines()
                if line.strip().startswith("-")
            ]
        if guests != item.get("speakers", []):
            error(f"{item.get('id')} speakers differ between JSON and page")
    if not banner.is_file():
        error(f"Missing Season 4 banner for {item.get('id')}: {item.get('banner')}")

markdown_files = list((root / "docs").rglob("*.md")) + [root / "README.md"]
link_pattern = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")
for path in markdown_files:
    text = path.read_text()
    if (root / "docs/model-mondays") in path.parents and "-s04-" in path.name:
        if re.search(r"\b(TBA|MMM DD|Headline \d|example\.com)\b", text, re.I):
            error(f"Placeholder content in {path.relative_to(root)}")
    if (root / "docs/foundry-fridays") in path.parents and "-ama-" in path.name:
        if re.search(r"\b(TBA|MMM DD|example\.com)\b", text, re.I):
            error(f"Placeholder content in {path.relative_to(root)}")
    for target in link_pattern.findall(text):
        target = target.strip().split("#", 1)[0]
        if not target or re.match(r"^[a-z][a-z0-9+.-]*:", target):
            continue
        resolved = (path.parent / target).resolve()
        if not resolved.exists():
            error(f"Broken local link in {path.relative_to(root)}: {target}")

old_ama_pattern = re.compile(
    r"foundry-fridays/\d{4}-\d{2}-\d{2}-s\d{2}-e\d{2}(?:-[^) ]+)?\.md"
)
for path in list(root.rglob("*.md")) + list(root.rglob("*.json")):
    if ".git" in path.parts:
        continue
    if old_ama_pattern.search(path.read_text()):
        error(f"Stale season-based AMA link in {path.relative_to(root)}")

print("Model Mondays repository validation")
print(f"- JSON files: {len(json_data)}")
print(f"- Model Mondays pages: {len(list((root / 'docs/model-mondays').glob('*.md')))}")
print(f"- AMA pages: {len(ama_pages)}")
print(f"- AMA records: {len(amas)}")
for message in warnings:
    print(f"WARNING: {message}")
for message in errors:
    print(f"ERROR: {message}")
if errors:
    print(f"Validation failed with {len(errors)} error(s).")
    sys.exit(1)
print("Validation passed.")
PY
