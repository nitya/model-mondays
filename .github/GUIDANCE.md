# Model Mondays Maintainer Guidance

**Last Updated:** February 11, 2026  
**Repository:** microsoft/model-mondays  
**Branch:** 2026/s3-schedule-refresh

> **Quick Start:** This guide helps maintainers use the custom GitHub Copilot agent, automated skills, and validation tools to maintain the Model Mondays repository efficiently.

---

## 📚 Table of Contents

1. [Overview](#overview)
2. [Repository Structure](#repository-structure)
3. [Using the Custom Agent](#using-the-custom-agent)
4. [Automated Skills](#automated-skills)
5. [Validation Tools](#validation-tools)
6. [Common Maintenance Tasks](#common-maintenance-tasks)
7. [Naming Conventions](#naming-conventions)
8. [Troubleshooting](#troubleshooting)
9. [Best Practices](#best-practices)

---

## Overview

This repository includes a comprehensive maintenance system:

- **Custom GitHub Copilot Agent** - Specialized AI assistant for repo maintenance
- **Automated Skills** - Two workflow skills for creating and updating content
- **Validation Script** - Ensures consistency and catches errors
- **AGENTS.md** - Complete reference guide for agent behavior

### Key Files

| File | Purpose |
|:-----|:--------|
| [AGENTS.md](../AGENTS.md) | Comprehensive agent guidelines and repository documentation |
| [.github/copilot-agent.json](.github/copilot-agent.json) | Custom agent configuration |
| [.github/skills/create-content-skill.json](.github/skills/create-content-skill.json) | Automated content creation workflow |
| [.github/skills/update-content-skill.json](.github/skills/update-content-skill.json) | Automated content update workflow |
| [.github/scripts/validate-repo.sh](.github/scripts/validate-repo.sh) | Repository validation script |
| [GUIDANCE.md](GUIDANCE.md) | This file - maintainer guidance |

---

## Repository Structure

```
model-mondays/
├── data/                           # JSON metadata files (source of truth)
│   ├── amas.json                   # AMA session metadata
│   ├── livestreams.json            # Episode metadata
│   ├── seasons.json                # Season information
│   ├── speakers.json               # Speaker profiles
│   ├── topics.json                 # Topic taxonomy
│   └── resources.json              # Learning resources
│
├── docs/                           # All markdown content
│   ├── model-mondays/              # Episode posts (24 files)
│   │   └── yyyy-mm-dd-sXX-eYY.md  # Simplified naming format
│   ├── foundry-fridays/            # AMA posts (34 files)
│   │   ├── yyyy-mm-dd-sXX-eYY.md  # Simplified naming format
│   │   └── README.md               # AMA index
│   ├── customer-stories/           # Customer implementations
│   │   └── README.md
│   └── assets/                     # All images organized by type
│       ├── model-mondays/          # Episode banners (SX-EY.png)
│       ├── foundry-fridays/        # AMA banners (SX-EY-AMA.png)
│       ├── customer-stories/       # Customer story banners (SX-EY.png)
│       ├── people/                 # Speaker headshots
│       └── misc/                   # General assets
│
├── .github/                        # Agent configuration and tools
│   ├── copilot-agent.json          # Custom agent definition
│   ├── skills/                     # Automated workflows
│   │   ├── create-content-skill.json
│   │   └── update-content-skill.json
│   └── scripts/
│       └── validate-repo.sh        # Validation script
│
├── README.md                       # Main landing page
└── AGENTS.md                       # Agent reference documentation
```

---

## Using the Custom Agent

### What is the Model Mondays Maintainer Agent?

A specialized GitHub Copilot agent configured with deep knowledge of this repository's structure, naming conventions, and content standards.

### How to Invoke

Use the `@model-mondays-maintainer` mention in any Copilot conversation:

```
@model-mondays-maintainer create a new episode for Season 3 Episode 5
```

### Agent Capabilities

The agent understands:
- ✅ File naming conventions (yyyy-mm-dd-sXX-eYY.md)
- ✅ Banner naming standards (SX-EY.png, SX-EY-AMA.png)
- ✅ Content templates for episodes and AMAs
- ✅ Cross-referencing between episodes and AMAs
- ✅ Image path requirements (always relative)
- ✅ JSON metadata structure
- ✅ Validation requirements

### Example Conversations

**Creating Content:**
```
@model-mondays-maintainer create episode S3-E7 airing on Jan 27, 2026 
about "Reasoning Models" with host Lee Stott
```

**Updating Content:**
```
@model-mondays-maintainer add recap link to S3-E1 AMA: 
https://discord.com/channels/.../recap
```

**Checking Status:**
```
@model-mondays-maintainer what episodes are missing banners?
```

**Validation:**
```
@model-mondays-maintainer run validation and report any issues
```

---

## Automated Skills

Skills are predefined workflows that automate complex multi-step tasks.

### Skill 1: create-content

**Purpose:** Create new episode or AMA posts with all required metadata.

**Syntax:**
```bash
@agent create-content --type=episode \
  --season=3 --episode=7 \
  --date=2026-01-27 \
  --title="Reasoning Models" \
  --host="Lee Stott" \
  --bannerExists=true
```

**Parameters:**

| Parameter | Required | Description | Example |
|:----------|:---------|:------------|:--------|
| `type` | Yes | Content type: `episode` or `ama` | `episode` |
| `season` | Yes | Season number (1-3) | `3` |
| `episode` | Yes | Episode number (1-16) | `7` |
| `date` | Yes | Air/record date (YYYY-MM-DD) | `2026-01-27` |
| `title` | Yes | Episode/AMA title | `"Reasoning Models"` |
| `host` | Yes | Host name(s) | `"Lee Stott"` |
| `speakers` | No | Guest speakers (for AMAs) | `"John Doe (Microsoft)"` |
| `description` | No | Brief description | `"Deep dive into..."` |
| `bannerExists` | No | Banner file ready? | `true` or `false` |

**What It Does:**
1. ✅ Validates all inputs
2. ✅ Checks banner exists (warns if missing)
3. ✅ Creates markdown file with proper naming
4. ✅ Uses appropriate template
5. ✅ Updates README.md tables
6. ✅ Updates JSON metadata files
7. ✅ Creates cross-references (episode ↔ AMA)
8. ✅ Updates AGENTS.md statistics
9. ✅ Runs validation

**Example Output:**
```markdown
Created: /docs/model-mondays/2026-01-27-s03-e07.md
Updated: /README.md (added to Season 3 table)
Updated: /data/livestreams.json
Validated: ✅ All checks passed
```

### Skill 2: update-content

**Purpose:** Update existing episode or AMA posts with new information.

**Syntax:**
```bash
@agent update-content --type=ama \
  --season=3 --episode=1 \
  --updateType=add-recap \
  --content='{"recap":"https://discord.com/..."}'
```

**Parameters:**

| Parameter | Required | Description |
|:----------|:---------|:------------|
| `type` | Yes | Content type: `episode` or `ama` |
| `season` | Yes | Season number |
| `episode` | Yes | Episode number |
| `updateType` | Yes | Update operation (see types below) |
| `content` | Yes | JSON with update data |

**Update Types:**

| Type | Purpose | Content Format |
|:-----|:--------|:---------------|
| `add-recap` | Add recap link | `{"recap": "url"}` |
| `add-resources` | Add learning resources | `{"resources": [{"title": "...", "url": "..."}]}` |
| `add-news-highlights` | Add news items | `{"highlights": [{"title": "...", "url": "...", "description": "..."}]}` |
| `update-description` | Update description | `{"description": "..."}` |
| `add-customer-story` | Add customer story | `{"company": "...", "description": "...", "link": "..."}` |
| `add-topics` | Add discussion topics | `{"topics": ["topic1", "topic2"]}` |
| `add-speaker` | Add speaker info | `{"name": "...", "role": "...", "bio": "..."}` |
| `fix-links` | Fix broken links | `{"old": "...", "new": "..."}` |
| `update-banner` | Update banner reference | `{"banner": "SX-EY.png"}` |
| `custom` | Custom edit | `{"section": "...", "content": "..."}` |

**Example - Add Recap:**
```bash
@agent update-content --type=ama --season=3 --episode=1 \
  --updateType=add-recap \
  --content='{"recap":"https://discord.com/channels/1234/5678/recap"}'
```

**Example - Add Resources:**
```bash
@agent update-content --type=episode --season=3 --episode=5 \
  --updateType=add-resources \
  --content='{"resources":[
    {"title":"Azure AI Foundry Docs","url":"https://aka.ms/foundry"},
    {"title":"Sample Code","url":"https://github.com/..."}
  ]}'
```

**What It Does:**
1. ✅ Validates inputs
2. ✅ Locates target file
3. ✅ Verifies content structure
4. ✅ Applies update maintaining format
5. ✅ Updates related files if needed
6. ✅ Updates JSON metadata
7. ✅ Validates changes
8. ✅ Confirms success

---

## Validation Tools

### Repository Validation Script

**Location:** `.github/scripts/validate-repo.sh`

**Purpose:** Comprehensive validation of repository structure, naming, images, and metadata.

### Running Validation

**Command:**
```bash
bash .github/scripts/validate-repo.sh
```

**Or from repository root:**
```bash
.github/scripts/validate-repo.sh
```

### What It Checks

1. **Directory Structure** (9 required directories)
   - `data/`
   - `docs/model-mondays/`
   - `docs/foundry-fridays/`
   - `docs/customer-stories/`
   - `docs/assets/model-mondays/`
   - `docs/assets/foundry-fridays/`
   - `docs/assets/customer-stories/`
   - `docs/assets/people/`
   - `docs/assets/misc/`

2. **File Naming Conventions**
   - Episode files: `yyyy-mm-dd-sXX-eYY.md`
   - AMA files: `yyyy-mm-dd-sXX-eYY.md`
   - Leading zeros required in dates (02 not 2)
   - Lowercase `s` and `e` prefixes

3. **Banner Images**
   - Every episode post → banner at `docs/assets/model-mondays/SX-EY.png`
   - Every AMA post → banner at `docs/assets/foundry-fridays/SX-EY-AMA.png`
   - Customer stories → banner at `docs/assets/customer-stories/SX-EY.png`
   - Every AMA post → banner at `docs/assets/foundry-fridays/SX-EY-AMA.png`
   - No leading zeros in banner names (S1-E1, not S01-E01)

4. **Image References**
   - All image links point to existing files
   - All paths are relative (../assets/...)
   - No broken image links

5. **JSON Metadata**
   - All JSON files are valid
   - Proper structure maintained

6. **Statistics**
   - Episode count
   - AMA count
   - Banner counts

### Understanding Output

**Success:**
```
🔍 Model Mondays Repository Validation
=======================================

📁 Checking directory structure...
✅ Directory exists: data
✅ Directory exists: docs/model-mondays
...

📝 Checking file naming conventions...
✅ All files follow naming convention

🖼️  Checking banner images...
✅ All banner images exist

🔗 Checking image references...
✅ All image references are valid

📋 Validating JSON metadata...
✅ Valid JSON: amas.json
...

📊 Repository Statistics
------------------------
ℹ️  Episodes: 24
ℹ️  AMAs: 34

=======================================
✅ Repository is valid! No issues found.
```

**With Warnings:**
```
⚠️  WARNING: Missing episode banner: S3-E10.png
```
**Action:** Create or verify the banner exists.

**With Errors:**
```
❌ ERROR: Broken image reference in docs/model-mondays/2026-01-20-s03-e05.md:
../assets/model-mondays/S3-E5-old.png
```
**Action:** Fix the image path in the file.

### Validation Before Commits

**Recommended Workflow:**
```bash
# Make changes
git add .

# Run validation
.github/scripts/validate-repo.sh

# If successful (exit code 0), commit
git commit -m "Add S3-E7 episode and AMA"
git push
```

### CI/CD Integration

Add to `.github/workflows/validate.yml`:
```yaml
name: Validate Repository
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run validation
        run: bash .github/scripts/validate-repo.sh
```

---

## Common Maintenance Tasks

### 1. Adding a New Episode

**Using the Agent:**
```
@model-mondays-maintainer create episode for S3-E8 on Feb 3, 2026 
titled "Vision Models" hosted by Sarah Chen, 
banner is ready
```

**Manual Steps:**
1. Create banner: `docs/assets/model-mondays/S3-E8.png`
2. Create markdown: `docs/model-mondays/2026-02-03-s03-e08.md`
3. Use episode template from AGENTS.md
4. Update `README.md` Season 3 table
5. Update `data/livestreams.json`
6. Link to corresponding AMA
7. Run validation: `.github/scripts/validate-repo.sh`
8. Update AGENTS.md statistics

### 2. Adding a New AMA

**Using the Agent:**
```
@model-mondays-maintainer create AMA for S3-E8 on Feb 5, 2026 
with speakers "Alice Johnson (OpenAI), Bob Smith (Host)" 
about Vision Models
```

**Manual Steps:**
1. Create banner: `docs/assets/foundry-fridays/S3-E8-AMA.png`
2. Create markdown: `docs/foundry-fridays/2026-02-05-s03-e08.md`
3. Use AMA template from AGENTS.md
4. Update `docs/foundry-fridays/README.md`
5. Update `README.md` if linking from season table
6. Update `data/amas.json`
7. Link to corresponding episode
8. Run validation
9. Update AGENTS.md statistics

### 3. Adding Recap Links After AMA

**Using the Agent:**
```
@model-mondays-maintainer add recap link to S3-E5 AMA at 
https://discord.com/channels/123456789/987654321/recap
```

**Using the Skill:**
```bash
@agent update-content --type=ama --season=3 --episode=5 \
  --updateType=add-recap \
  --content='{"recap":"https://discord.com/channels/.../recap"}'
```

**Manual Edit:**
```markdown
**Related:**
- [Model Mondays Episode](../model-mondays/2026-01-20-s03-e05.md)
- [Discord AMA Recap](https://discord.com/channels/.../recap)  ← Add this
```

### 4. Fixing Broken Image Links

**Identify Issues:**
```bash
.github/scripts/validate-repo.sh
# Look for: ❌ ERROR: Broken image reference...
```

**Fix with Agent:**
```
@model-mondays-maintainer fix broken image link in S3-E5 
from S3-E5-old.png to S3-E5.png
```

**Manual Fix:**
1. Locate the file mentioned in error
2. Update image path to point to existing file
3. Ensure path is relative: `../assets/model-mondays/S3-E5.png`
4. Run validation again

### 5. Renaming Files in Bulk

**Important:** Always maintain the naming convention!

**Example - Removing title suffixes:**
```bash
cd docs/model-mondays
for file in *.md; do
  newname=$(echo "$file" | sed -E 's/^([0-9]{4}-[0-9]{2}-[0-9]{2}-s[0-9]{2}-e[0-9]{2})-.+\.md$/\1.md/')
  if [[ "$file" != "$newname" ]]; then
    mv "$file" "$newname"
    echo "Renamed: $file → $newname"
  fi
done
```

**After bulk rename:**
1. Update all cross-references in files
2. Update README.md links
3. Run validation
4. Update AGENTS.md if patterns changed

### 6. Adding Customer Stories

**Update the customer stories README:**

```markdown
![Banner](../assets/model-mondays/S3-E7.png)

### Jan 27th 2026: Company Name

_Brief description of the customer story and implementation_.

**Speakers:**

_Name_ is the role/title at Company...

**Resources:**
- [Case Study](https://...)
- [Documentation](https://...) 
```

**Update episode post to reference it:**
```markdown
### Customer Story: Company Name

Brief description...

[View full story](../customer-stories/README.md#jan-27th-2026-company-name)
```

### 7. Updating Speaker Information

**Using the Agent:**
```
@model-mondays-maintainer add speaker bio for Sarah Chen to S3-E8 AMA
```

**Manual Process:**
1. Update `data/speakers.json` with speaker info
2. Add to AMA markdown file:
```markdown
**Speakers:**
- Sarah Chen (Microsoft) - Brief bio about Sarah focusing on her expertise...
- Lee Stott (Host)
```

### 8. Archiving Old Seasons

When starting a new season:

1. Create archive directory: `.2026/season-03/`
2. Move old content but keep structure
3. Update README.md to link to archive
4. Keep banner assets in place (don't move)
5. Update AGENTS.md with new structure

---

## Naming Conventions

### File Names

**Episodes:**
```
yyyy-mm-dd-sXX-eYY.md
```
- 4-digit year
- 2-digit month (01-12)
- 2-digit day (01-31)
- Lowercase 's' + 2-digit season (01-99)
- Lowercase 'e' + 2-digit episode (01-99)

**Examples:**
- ✅ `2026-01-20-s03-e05.md`
- ✅ `2025-12-01-s03-e01.md`
- ❌ `2026-1-20-s3-e5.md` (missing leading zeros)
- ❌ `2026-01-20-s03-e05-reasoning-models.md` (no title suffix)

**AMAs:** Same format as episodes
```
yyyy-mm-dd-sXX-eYY.md
```

### Banner Names

**Episode Banners:**
```
SX-EY.png
```
- Uppercase 'S' + season number (NO leading zeros)
- Dash separator
- Uppercase 'E' + episode number (NO leading zeros)

**Examples:**
- ✅ `S3-E5.png`
- ✅ `S3-E10.png`
- ❌ `S03-E05.png` (has leading zeros)
- ❌ `s3-e5.png` (lowercase)
- ❌ `S3E5.png` (missing dash)

**AMA Banners:**
```
SX-EY-AMA.png
```
**Examples:**
- ✅ `S3-E5-AMA.png`
- ✅ `S3-E10-AMA.png`
- ❌ `S03-E05-AMA.png` (has leading zeros)

**Customer Story Banners:**
```
SX-EY.png
```
Same format as episode banners, stored in `docs/assets/customer-stories/`

**Examples:**
- ✅ `S2-E6.png`
- ✅ `S3-E1.png`
- ❌ `S02-E06.png` (has leading zeros)
- ❌ `S2-E6-CustomerStories.png` (no suffix needed)

### Image Paths

**Always use relative paths:**
```markdown
![Banner](../assets/model-mondays/S3-E5.png)
```

**From episode posts:** `../assets/model-mondays/`  
**From AMA posts:** `../assets/foundry-fridays/`  
**From customer stories:** `../assets/customer-stories/`

**Never use:**
- ❌ Absolute paths: `/docs/assets/...`
- ❌ Full URLs: `https://github.com/microsoft/model-mondays/docs/assets/...`
- ❌ Different directory: `../../data/assets/...`

---

## Troubleshooting

### Issue: Agent doesn't recognize my request

**Symptoms:** Agent responds with generic advice or doesn't execute the task.

**Solutions:**
1. Be explicit: `@model-mondays-maintainer create episode...` (not just "add episode")
2. Include specific details: season, episode, date, title
3. Reference the AGENTS.md file: "following the patterns in AGENTS.md..."
4. Try a conversation starter from [.github/README.md](.github/README.md)

### Issue: Validation script reports missing banners

**Symptoms:**
```
⚠️  WARNING: Missing episode banner: S3-E7.png
```

**Solutions:**
1. Check if banner exists with different name:
   ```bash
   ls docs/assets/model-mondays/ | grep -i "s3.*e7"
   ```
2. Verify naming matches convention (S3-E7.png, not s3-e07.png)
3. If banner truly missing:
   - Create banner file
   - Or update episode post to reference correct banner
   - Or temporarily remove banner reference until available

### Issue: Broken image links after reorganization

**Symptoms:**
```
❌ ERROR: Broken image reference in file.md: ../assets/old-path/image.png
```

**Solutions:**
1. Find all occurrences:
   ```bash
   grep -r "old-path" docs/
   ```
2. Batch update:
   ```bash
   find docs/ -name "*.md" -exec sed -i 's|../assets/old-path/|../assets/new-path/|g' {} +
   ```
3. Run validation to confirm
4. Update AGENTS.md if structure changed

### Issue: Skills fail with parameter errors

**Symptoms:** Skill returns error about invalid parameters.

**Solutions:**
1. Check parameter format in [.github/skills/](skills/)
2. Ensure JSON content is properly escaped:
   ```bash
   --content='{"key":"value"}'  # Note single quotes wrapping JSON
   ```
3. Verify all required parameters included
4. Check parameter values match expected format (dates, numbers, etc.)

### Issue: JSON metadata validation fails

**Symptoms:**
```
❌ ERROR: Invalid JSON: amas.json
```

**Solutions:**
1. Validate JSON syntax:
   ```bash
   python3 -m json.tool data/amas.json
   ```
2. Common issues:
   - Missing comma between objects
   - Trailing comma after last item
   - Unescaped quotes in strings
   - Mismatched brackets
3. Use editor with JSON validation (VS Code)
4. Compare against working JSON files

### Issue: Cross-references between episodes and AMAs broken

**Symptoms:** Links between episode and AMA don't work.

**Solutions:**
1. Verify both files exist:
   ```bash
   ls docs/model-mondays/2026-01-20-s03-e05.md
   ls docs/foundry-fridays/2026-01-22-s03-e05.md
   ```
2. Check link format in episode:
   ```markdown
   **Related AMA:** [View AMA Discussion](../foundry-fridays/2026-01-22-s03-e05.md)
   ```
3. Check link format in AMA:
   ```markdown
   **Related:**
   - [Model Mondays Episode](../model-mondays/2026-01-20-s03-e05.md)
   ```
4. Ensure dates match actual filenames (use tab completion)

---

## Best Practices

### 1. Always Run Validation

Before committing changes:
```bash
.github/scripts/validate-repo.sh
```

After making changes:
- Episode/AMA creation → validate
- Banner updates → validate
- Bulk renames → validate
- Image path changes → validate

### 2. Create Banners First

**Ideal workflow:**
1. Design and create banner image
2. Save with correct naming: `S3-E7.png`
3. Place in correct directory
4. Then create markdown file referencing it

**Not recommended:**
- Creating markdown first, adding banner later (causes validation warnings)
- Creating banner with wrong name, then renaming (easy to miss references)

### 3. Use the Agent for Complex Tasks

**Good use cases:**
- Creating new episodes/AMAs (lots of steps)
- Updating multiple files at once
- Finding broken references
- Batch operations

**Not necessary for:**
- Simple typo fixes
- Adding a single line of content
- Changing one image path

### 4. Update AGENTS.md When Structure Changes

**Always update AGENTS.md after:**
- Adding new directories
- Changing naming conventions
- Creating new file types
- Updating workflows
- Adding new patterns

This keeps future agents working correctly!

### 5. Keep JSON Metadata in Sync

**When creating episode:**
1. Update `data/livestreams.json`
2. Update markdown file
3. Both should reflect same data

**When creating AMA:**
1. Update `data/amas.json`
2. Update markdown file
3. Both should reflect same data

### 6. Use Consistent Formatting

**Episode structure:**
1. Banner image (first line)
2. News highlights
3. Tech spotlight
4. Customer story (if applicable)
5. Summary
6. Related AMA link

**AMA structure:**
1. Banner image (first line)
2. Title/description
3. Speakers
4. Topics covered
5. Resources
6. Related links

### 7. Maintain Bidirectional Links

Episodes ↔ AMAs should always link to each other:

**Episode links to AMA:**
```markdown
**Related AMA:** [View AMA Discussion](../foundry-fridays/2026-01-22-s03-e05.md)
```

**AMA links to Episode:**
```markdown
**Related:**
- [Model Mondays Episode](../model-mondays/2026-01-20-s03-e05.md)
```

### 8. Version Control Best practices

**Commit messages:**
```bash
# Good
git commit -m "Add S3-E7 episode: Reasoning Models"
git commit -m "Update S3-E5 AMA with recap link"
git commit -m "Fix broken image references in customer stories"

# Not as helpful
git commit -m "Update files"
git commit -m "Changes"
```

**Branch naming:**
```bash
# For new seasons
git checkout -b 2026/s4-schedule

# For fixes
git checkout -b fix/broken-image-links

# For features
git checkout -b feature/add-speaker-bios
```

### 9. Testing Changes

**Before pushing:**
1. Run validation script
2. Check a few files manually
3. Verify images load (if possible)
4. Test cross-references (click links)
5. Validate JSON files

**After pushing:**
1. Check GitHub renders markdown correctly
2. Verify images appear
3. Test links in GitHub UI

### 10. Documentation

**Always document:**
- New patterns or conventions
- Exceptions to rules
- Special cases
- Temporary workarounds

**Update this GUIDANCE.md when:**
- Adding new skills
- Changing workflows
- Learning new patterns
- Discovering gotchas

---

## Quick Reference

### Essential Commands

```bash
# Run validation
.github/scripts/validate-repo.sh

# Count episodes
ls -1 docs/model-mondays/*.md | wc -l

# Count AMAs
ls -1 docs/foundry-fridays/*.md | grep -v README | wc -l

# Find broken image links
grep -r "!\[.*\](.*\.png)" docs/ --include="*.md"

# Validate JSON
python3 -m json.tool data/amas.json

# Search for text in markdown
grep -r "search term" docs/ --include="*.md"

# List all banners
ls -1 docs/assets/model-mondays/*.png
ls -1 docs/assets/foundry-fridays/*.png
```

### File Templates

**Quick Episode Template:**
```markdown
![Banner](../assets/model-mondays/S3-E7.png)

## News Highlights

1. [Title](url) - Description
2. [Title](url) - Description
3. [Title](url) - Description

### Tech Spotlight: Topic Name

Description...

**Resources:**
- [Docs](url)
- [Tutorial](url)

### Summary

Summary text...

**Related AMA:** [View AMA Discussion](../foundry-fridays/2026-01-22-s03-e07.md)
```

**Quick AMA Template:**
```markdown
![Banner](../assets/foundry-fridays/S3-E7-AMA.png)

**Title:** Topic Discussion

**Speakers:**
- Name (Role/Company)
- Host (Host)

**Description:** Description text...

**Topics Covered:**
- Topic 1
- Topic 2
- Topic 3

**Resources:**
- [Docs](url)

**Related:**
- [Model Mondays Episode](../model-mondays/2026-01-20-s03-e07.md)
- [Discord AMA Discussion](https://aka.ms/model-mondays/discord)
```

---

## Support

### Getting Help

1. **Check AGENTS.md** - Comprehensive reference
2. **Check this GUIDANCE.md** - Maintainer-specific guidance
3. **Run validation** - Often reveals the issue
4. **Ask the agent** - `@model-mondays-maintainer help with...`
5. **Check recent commits** - See how similar tasks were done
6. **Review skills** - `.github/skills/*.json` for workflow details

### Reporting Issues

If you find bugs or have suggestions:

1. Document the issue clearly
2. Include validation output if relevant
3. Note which files are affected
4. Suggest a fix if possible
5. Update AGENTS.md and GUIDANCE.md with solution

### Contributing Improvements

**To improve this maintainer system:**

1. Update the relevant files:
   - AGENTS.md - agent behavior and patterns
   - GUIDANCE.md - maintainer instructions
   - Skills - automated workflows
   - Validation script - checks and rules

2. Test thoroughly
3. Document changes
4. Update "Last Updated" dates
5. Commit with clear message

---

## Changelog

### February 11, 2026
- Initial creation of GUIDANCE.md
- Documented custom agent usage
- Documented automated skills
- Added validation guidance
- Complete troubleshooting section
- Best practices defined

---

**Remember:** This system is designed to make your life easier. Use the agent, use the skills, run validation frequently, and keep documentation updated. Happy maintaining! 🚀
