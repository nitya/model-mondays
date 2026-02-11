# Agent Guidelines for Model Mondays Repository

**Last Updated:** February 11, 2026  
**Repository:** microsoft/model-mondays  
**Branch:** 2026/s3-schedule-refresh

> **Custom Agent Available:** See [.github/copilot-agent.json](.github/copilot-agent.json) for the Model Mondays Maintainer agent configuration and [.github/skills/](.github/skills/) for reusable workflow skills.

> **Maintainer Guide:** See [.github/GUIDANCE.md](.github/GUIDANCE.md) for comprehensive maintainer guidance on using the agent, skills, and validation tools.

---

## 📋 Repository Overview

This repository hosts the **Model Mondays** livestream series and **Foundry Fridays** AMA sessions, providing educational content about AI models, Azure AI Foundry, and related technologies.

### Content Structure

```
model-mondays/
├── data/                           # JSON metadata files
│   ├── amas.json                   # AMA session metadata
│   ├── livestreams.json            # Episode metadata
│   ├── seasons.json                # Season information
│   ├── speakers.json               # Speaker profiles
│   ├── topics.json                 # Topic taxonomy
│   └── resources.json              # Learning resources
├── docs/
│   ├── model-mondays/              # Livestream episode posts (24 files)
│   ├── foundry-fridays/            # AMA session posts (34 files + README)
│   ├── customer-stories/           # Customer implementations
│   └── assets/                     # All images and banners
│       ├── model-mondays/          # Livestream banners (SX-EY.png)
│       ├── foundry-fridays/        # AMA banners (SX-EY-AMA.png)
│       ├── customer-stories/       # Customer story banners (SX-EY.png)
│       ├── people/                 # Speaker headshots
│       └── misc/                   # General assets
├── .2025/                          # Archived historical content
└── README.md                       # Main landing page
```

---

## 🎯 Key Conventions

### File Naming Patterns

1. **Episode Posts:** `yyyy-mm-dd-sXX-eYY.md`
   - Example: `2025-12-01-s03-e01.md` (Season 3, Episode 1, aired Dec 1, 2025)
   
2. **AMA Posts:** `yyyy-mm-dd-sXX-eYY.md`
   - Example: `2025-12-05-s03-e01.md` (Season 3, AMA 1, held Dec 5, 2025)
   
3. **Banners:**
   - Episode banners: `SX-EY.png` (e.g., `S3-E1.png`)
   - AMA banners: `SX-EY-AMA.png` (e.g., `S3-E1-AMA.png`)
   - Customer story banners: `SX-EY.png` (e.g., `S2-E6.png`)

### Content Standards

- **All image paths** use relative references: `../assets/[category]/filename.png`
- **Episode banners** → `docs/assets/model-mondays/`
- **AMA banners** → `docs/assets/foundry-fridays/`
- **Customer story banners** → `docs/assets/customer-stories/`
- **Banner images required** for all episode and AMA posts
- **Dates follow** ISO 8601 format: `YYYY-MM-DD`
- **Links are relative** within the repository (no absolute GitHub URLs for internal content)

### Season Information

| Season | Episodes | AMAs | Timeline | Status |
|:---|:---:|:---:|:---|:---|
| Season 1 | 8 | 8 | Mar 2025 - May 2025 | Completed |
| Season 2 | 13 | 22 | Jun 2025 - Nov 2025 | Completed |
| Season 3 | 16 | 16 | Dec 2025 - Apr 2026 | Active |

---

## 🤖 Agent Responsibilities

### 1. Content Creation

When creating new episodes or AMAs:

1. **Check data files** in `data/` directory first for metadata
2. **Follow naming conventions** exactly (yyyy-mm-dd-sXX-eYY.md)
3. **Create/verify banner image** exists before linking
4. **Use relative paths** for all image references
5. **Update related files:**
   - Main `README.md` season tables
   - `docs/foundry-fridays/README.md` (for AMAs)
   - Relevant JSON metadata files in `data/`

### 2. Content Updates

When modifying existing content:

1. **Preserve file naming** - never change established filenames
2. **Update all cross-references** - episode posts link to AMAs and vice versa
3. **Verify image paths** remain valid after changes
4. **Check for broken links** in related content
5. **Update metadata files** in `data/` directory

### 3. Asset Management

When handling images and banners:

1. **Place in correct directory:**
   - Livestream banners → `docs/assets/model-mondays/`
   - AMA banners → `docs/assets/foundry-fridays/`
   - Customer story banners → `docs/assets/customer-stories/`
   - Speaker photos → `docs/assets/people/`
   - General assets → `docs/assets/misc/`

2. **Follow naming convention:**
   - Season/Episode format: `SX-EY.png` or `SX-EY-AMA.png`
   - Consistent capitalization (S and E uppercase)
   - Customer stories use same format as episodes: `SX-EY.png`

3. **Reference correctly:**
   - From episode posts: `../assets/model-mondays/S3-E1.png`
   - From AMA posts: `../assets/foundry-fridays/S3-E1-AMA.png`
   - From customer stories: `../assets/customer-stories/S2-E6.png`

### 4. Documentation Maintenance

**CRITICAL:** After making ANY changes to the repository:

1. **Update this AGENTS.md file** with:
   - New patterns or conventions introduced
   - Changes to directory structure
   - Updated statistics (episode counts, file counts, etc.)
   - New workflows or processes

2. **Run validation checks:**
   ```bash
   # Check for broken image links
   grep -r '!\[.*\](.*\.png)' docs/ | while read line; do
     file=$(echo "$line" | grep -oP '\(.*?\)' | tr -d '()')
     # Verify file exists
   done
   
   # Verify all episodes have banners
   ls docs/model-mondays/*.md | while read ep; do
     # Check banner reference exists
   done
   ```

3. **Update README.md** if:
   - New episodes or AMAs added
   - Season status changes
   - New resources or links added

---

## 📝 Content Templates

### Episode Post Template

```markdown
![SX-EY](../assets/model-mondays/SX-EY.png)

## Episode Title

**Date:** Month DD, YYYY  
**Season:** X | **Episode:** Y  
**Host:** Name

### News Highlights

1. [Headline 1](url) - Brief description
2. [Headline 2](url) - Brief description
3. [Headline 3](url) - Brief description
4. [Headline 4](url) - Brief description
5. [Headline 5](url) - Brief description

### Tech Spotlight: Topic Name

Description of the main technology or model featured.

**Key Features:**
- Feature 1
- Feature 2
- Feature 3

**Resources:**
- [Documentation](url)
- [Tutorial](url)
- [Sample Code](url)

### Customer Story: Company Name (Optional)

Brief description of customer implementation.

[View full story](../customer-stories/README.md#anchor)

### Summary

Brief summary of the episode content and key takeaways.

**Related AMA:** [View AMA Discussion](../foundry-fridays/yyyy-mm-dd-sXX-eYY.md)
```

### AMA Post Template

```markdown
![SX-EY-AMA](../assets/foundry-fridays/SX-EY-AMA.png)

**Title:** Topic AMA

**Speakers:**
- Name (Role/Company)
- Host Name (Host)

**Description:** Brief description of the AMA session and topics covered.

**Topics Covered:**
- Topic 1
- Topic 2
- Topic 3
- Topic 4
- Topic 5

**Resources:**
- [Documentation](url)
- [Tutorial](url)
- [Sample Code](url)

**Related:**
- [Model Mondays Episode](../model-mondays/yyyy-mm-dd-sXX-eYY.md)
- [Discord AMA Discussion](https://aka.ms/model-mondays/discord)
```

---

## 🔍 Validation Checklist

Before completing any task, verify:

- [ ] All new files follow naming conventions
- [ ] All image paths are relative and valid
- [ ] Banner images exist for all episodes/AMAs
- [ ] Cross-references between episodes and AMAs are correct
- [ ] README.md tables updated if needed
- [ ] JSON metadata files updated in `data/` directory
- [ ] No broken links in modified content
- [ ] AGENTS.md updated with any new patterns or changes
- [ ] Season information accurate and up-to-date

---

## 🛠️ Common Operations

### Adding a New Episode

1. Create markdown file: `docs/model-mondays/yyyy-mm-dd-sXX-eYY.md`
2. Add banner image: `docs/assets/model-mondays/SX-EY.png`
3. Update `README.md` season table
4. Update `data/livestreams.json`
5. Link to corresponding AMA in the episode post
6. Update this AGENTS.md if new patterns introduced

### Adding a New AMA

1. Create markdown file: `docs/foundry-fridays/yyyy-mm-dd-sXX-eYY.md`
2. Add banner image: `docs/assets/foundry-fridays/SX-EY-AMA.png`
3. Update `docs/foundry-fridays/README.md` table
4. Update `README.md` if linking from season table
5. Update `data/amas.json`
6. Link to corresponding episode in the AMA post
7. Update this AGENTS.md if new patterns introduced

### Renaming Files in Bulk

```bash
# Example: Removing title suffixes from filenames
cd docs/model-mondays
for file in *.md; do
  newname=$(echo "$file" | sed -E 's/^([0-9]{4}-[0-9]{2}-[0-9]{2}-s[0-9]{2}-e[0-9]{2})-.+\.md$/\1.md/')
  if [[ "$file" != "$newname" ]]; then
    mv "$file" "$newname"
  fi
done
```

### Updating Image Links

```bash
# Update image paths after directory reorganization
find docs/ -name "*.md" -type f -exec sed -i 's|../data/assets/|../assets/|g' {} +
```

---

## � Using the Model Mondays Maintainer Agent

A custom GitHub Copilot agent is available to help with repository maintenance. This agent has specialized knowledge of the repository structure, naming conventions, and content standards.

### Quick Start

Invoke the agent in any conversation:
```
@model-mondays-maintainer create a new episode for Season 3 Episode 5
```

### Available Skills

Two custom skills provide automated workflows:

1. **create-content** - Create new episodes or AMAs
   ```
   @agent create-content --type=episode --season=3 --episode=5 \
     --date=2026-01-20 --title="Edge AI" --host="Lee Stott"
   ```

2. **update-content** - Update existing content with new information
   ```
   @agent update-content --type=ama --season=3 --episode=1 \
     --updateType=add-recap --content='{"recap":"https://..."}'
   ```

See [.github/README.md](.github/README.md) for complete documentation on using the agent and skills.

---

## �📊 Current Statistics

- **Total Episodes:** 24 (S1: 8, S2: 13, S3: 3)
- **Total AMAs:** 34 (S1: 8, S2: 10, S3: 16)
- **Total Banners:** 46 AMA banners, 24 episode banners
- **Active Season:** Season 3 (Dec 2025 - Apr 2026)
- **Repository Status:** Clean structure, all assets organized

---

## 🔗 Important Links

- **Main Repository:** https://github.com/microsoft/model-mondays
- **Discord Community:** https://aka.ms/model-mondays/discord
- **Livestream RSVP:** https://aka.ms/model-mondays/rsvp
- **Documentation:** https://aka.ms/model-mondays

---

## ⚠️ Critical Reminders for Agents

1. **ALWAYS update this AGENTS.md file** when making structural changes
2. **NEVER use absolute GitHub URLs** for internal file references
3. **ALWAYS verify image paths** are relative and valid
4. **ALWAYS maintain the naming convention** (yyyy-mm-dd-sXX-eYY.md)
5. **ALWAYS check both episode and AMA cross-references** are bidirectional
6. **ALWAYS update season tables** in README files when adding content
7. **ALWAYS validate JSON metadata** files are updated alongside markdown content

---

**Agent Maintainer Note:** This file should be the first reference when working with this repository. Keep it updated with every significant change to maintain consistency and enable future agents to work effectively.
