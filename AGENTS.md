# Model Mondays Agent Guide

## Repository purpose

This repository publishes Model Mondays livestream episodes and Foundry Friday on-demand AMAs about AI models, Microsoft Foundry, and agent development.

## Canonical structure

- `data/seasons.json`: season metadata.
- `data/livestreams.json`: Model Mondays episode metadata.
- `data/amas.json`: independently numbered Foundry Friday AMA metadata.
- `data/speakers.json`, `data/topics.json`, `data/resources.json`: shared metadata.
- `docs/model-mondays/`: episode pages.
- `docs/foundry-fridays/`: AMA pages and the canonical AMA index.
- `docs/assets/model-mondays/`: episode banners.
- `docs/assets/foundry-fridays/`: AMA banners.
- `.2025/`: historical source archive; do not add current content here.

Checked-in JSON and published Markdown must agree. `docs/assets/` is the canonical public asset tree.

## Naming conventions

### Model Mondays

- Page: `YYYY-MM-DD-sNN-eNN.md`
- Banner: `S<season>-E<episode>.png`
- Example: `2026-09-28-s04-e07.md` and `S4-E7.png`

### Foundry Friday AMAs

Foundry Fridays is an on-demand initiative, not a season-driven weekly series.

- ID: `ama-NNN`
- Display number: `AMA #NNN`
- Page: `YYYY-MM-DD-ama-NNN.md`
- Banner: `AMA-NNN.png`
- Example: `2026-09-25-ama-048.md` and `AMA-048.png`

AMA numbers are global, unique, and sequential. An AMA may optionally link to a related episode, but no relationship is required.

## Current program state

- Season 1: 8 episodes, completed.
- Season 2: 13 episodes, completed.
- Season 3: 16 episodes, completed.
- Season 4: 12 episodes, August 10-November 2, 2026, active.
- Foundry Fridays: 48 numbered entries through AMA #048.

Season 4 is titled **Model Spotlights for Agent Builders**.

## Content rules

1. Use supplied, approved source material only. Never invent dates, speakers, biographies, links, resources, or event details.
2. Omit unavailable optional sections instead of publishing `TBA`, placeholder links, or template prose.
3. For Season 4, final banners are authoritative for date, title, host, and displayed guests.
4. Use relative links for repository content and images.
5. Use “Microsoft Foundry” in prose. Existing URL paths containing `azure/ai-foundry` remain valid.
6. Keep episode and AMA pages concise when only core metadata is available.
7. Update the corresponding JSON record, public index, and statistics whenever content is added or renamed.
8. Preserve historical content unless a migration explicitly calls for a clean break.

## Required update surfaces

For a new episode:

1. Add the approved banner to `docs/assets/model-mondays/`.
2. Add the page to `docs/model-mondays/`.
3. Update `data/livestreams.json` and `data/seasons.json` when counts/status change.
4. Update the Season 4 tables in `README.md` and `docs/index.md`.

For a new AMA:

1. Allocate the next global AMA number.
2. Add `docs/assets/foundry-fridays/AMA-NNN.png`.
3. Add `docs/foundry-fridays/YYYY-MM-DD-ama-NNN.md`.
4. Update `data/amas.json`.
5. Update `docs/foundry-fridays/README.md`.
6. Update the root README spotlight only when the featured AMA changes.

For a speaker:

1. Add or update the record in `data/speakers.json`.
2. Add a profile image only when an approved standalone image is supplied.
3. Never extract a profile image from a composed banner.

## Validation

Run from the repository root:

```bash
bash .github/scripts/validate-repo.sh
mkdocs build --strict
git diff --check
```

Validation must confirm:

- JSON parses and IDs/numbers are unique.
- Every page and banner follows its naming convention.
- Every local image and Markdown link resolves.
- Episode/AMA metadata points to existing pages and banners.
- AMA numbers are continuous.
- No old season-based AMA filenames or links remain.
- Current pages contain no `TBA`, `MMM DD`, or template placeholder URLs.

## Safety

- The worktree may contain unrelated changes. Do not revert or overwrite them.
- Do not duplicate current assets into `data/assets/`.
- Do not edit `.2025/` merely to match current conventions.
- Do not fetch or publish personal information that was not explicitly supplied and approved.
