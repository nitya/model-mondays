# Model Mondays Agent Configuration

This directory contains the custom agent configuration and skills for maintaining the Model Mondays repository.

> **📖 Maintainer Guide:** See [GUIDANCE.md](GUIDANCE.md) for comprehensive usage instructions, troubleshooting, and best practices.

## Contents

- **copilot-agent.json** - Configuration for the Model Mondays Maintainer custom agent
- **skills/** - Reusable workflow skills for common repository operations
- **GUIDANCE.md** - Complete maintainer guide with examples and troubleshooting

## Model Mondays Maintainer Agent

The Model Mondays Maintainer is a specialized GitHub Copilot agent designed to help manage content, validate changes, and maintain consistency across the repository.

### Key Features

- **Content Management**: Create and update episode posts and AMA sessions
- **Validation**: Automatically check file paths, links, and metadata
- **Consistency**: Enforce naming conventions and content standards
- **Documentation**: Keep AGENTS.md and README files synchronized

### How to Use

1. **Invoke the agent** in any GitHub Copilot conversation:
   ```
   @model-mondays-maintainer create a new episode for Season 3 Episode 4
   ```

2. **Use conversation starters** for common tasks:
   - "Create a new episode post for Season 3 Episode 4"
   - "Update the AMA post with recap information"
   - "Validate all image links in the repository"
   - "Show me episodes that don't have corresponding AMAs"

3. **Ask for help**:
   ```
   @model-mondays-maintainer how do I add a new AMA session?
   ```

## Custom Skills

### 1. Create Content Skill

**Purpose:** Create new episodes or AMAs with all required files and metadata

**Usage:**
```
@agent create-content --type=episode --season=3 --episode=5 \
  --date=2026-01-20 --title="Edge AI" --host="Lee Stott"
```

### 2. Update Content Skill

**Purpose:** Update existing content with new information (recaps, resources, etc.)

**Usage:**
```
@agent update-content --type=ama --season=3 --episode=1 \
  --updateType=add-recap --content='{"recap":"https://..."}'
```

### 3. Manage Speaker Skill

**Purpose:** Add or update speaker profiles in speakers.json database with LinkedIn integration

**Usage:**
```
@agent manage-speaker --action=add --id=john-doe \
  --linkedinProfile=johndoe --fetchFromLinkedIn=true
```

**Features:**
- Automatically fetch profile data from LinkedIn
- Update speakers.json with bio, role, expertise
- Add LinkedIn links to episode pages
- Generate speaker bios for episode posts

**Example - Add New Speaker:**
```
@agent manage-speaker --action=add \
  --id=sarah-chen \
  --name="Sarah Chen" \
  --linkedinProfile=sarahchen \
  --role="Senior PM Lead" \
  --affiliation="Microsoft Azure AI" \
  --fetchFromLinkedIn=true
```

**Example - Update Speaker:**
```
@agent manage-speaker --action=update \
  --id=nitya-narasimhan \
  --expertise='["Azure AI", "Gen AI", "Developer Advocacy"]'
```
  --date=2026-01-20 --title="Edge AI Development" \
  --host="Lee Stott" --description="Exploring edge AI..."
```

**What it does:**
- Creates markdown file with proper naming
- Checks for banner image
- Updates README tables
- Updates JSON metadata
- Updates AGENTS.md statistics
- Validates all changes

**Parameters:**
- `type`: episode | ama
- `season`: 1-3
- `episode`: Number
- `date`: YYYY-MM-DD
- `title`: Episode/AMA title
- `host`: Host name
- `speakers`: (AMAs only) Array of speaker names
- `description`: Brief description
- `bannerExists`: true | false (optional)

### 2. Update Content Skill

**Purpose:** Update existing episodes or AMAs with new information

**Usage:**
```
@agent update-content --type=episode --season=3 --episode=1 \
  --updateType=add-recap \
  --content='{"recap":"https://github.com/orgs/azure-ai-foundry/discussions/120"}'
```

**What it does:**
- Locates the target file
- Applies requested updates
- Updates related files if needed
- Validates all changes
- Preserves existing content structure

**Update Types:**
- `add-recap`: Add recap link or section
- `add-resources`: Add new resource links
- `add-news-highlights`: Add news items (episodes only)
- `update-description`: Update description text
- `add-customer-story`: Add customer story (episodes only)
- `add-topics`: Add topics covered (AMAs only)
- `add-speaker`: Add new speaker to list
- `fix-links`: Automatically fix broken links
- `update-banner`: Change banner image
- `custom`: Custom search and replace

**Examples:**

Add resources to an AMA:
```
@agent update-content --type=ama --season=3 --episode=1 \
  --updateType=add-resources \
  --content='{
    "resources": [
      {
        "title": "Model Router Docs",
        "url": "https://learn.microsoft.com/.../model-router",
        "description": "Official documentation"
      }
    ]
  }'
```

Update news highlights:
```
@agent update-content --type=episode --season=3 --episode=2 \
  --updateType=add-news-highlights \
  --content='{
    "newsHighlights": [
      {
        "title": "New Model Release",
        "url": "https://example.com/news",
        "description": "Details about the release"
      }
    ]
  }'
```

Fix broken links:
```
@agent update-content --type=episode --season=3 --episode=1 \
  --updateType=fix-links
```

## Agent Capabilities

### Tools Available

The Model Mondays Maintainer has access to:

- **File Operations**: read_file, create_file, replace_string_in_file, multi_replace_string_in_file
- **Search**: grep_search, file_search, semantic_search
- **Validation**: JSON validation, link checking, path verification
- **Terminal**: run_in_terminal for validation scripts

### MCP Servers

- **Pylance**: Python code analysis and validation
- **GitHub**: Repository operations and PR management

### Validation Rules

The agent enforces:

- ✅ Filename format: `yyyy-mm-dd-sXX-eYY.md`
- ✅ Relative image paths only
- ✅ Banner images must exist
- ✅ Bidirectional episode↔AMA links
- ✅ Valid JSON metadata
- ✅ AGENTS.md updated after changes

## Best Practices

1. **Always check AGENTS.md first** - It contains the latest patterns and conventions
2. **Validate before committing** - Use the agent to check links and paths
3. **Update metadata** - Keep JSON files synchronized with markdown content
4. **Test cross-references** - Ensure episodes link to AMAs and vice versa
5. **Keep banners organized** - Maintain proper naming in assets directories

## Troubleshooting

### Agent not responding

- Ensure you're using the correct agent name: `@model-mondays-maintainer`
- Check that copilot-agent.json is properly formatted
- Try reloading VS Code window

### Changes not being saved

- Verify you have write permissions in the repository
- Check that file paths are correct
- Ensure no file locks or conflicts exist

### Validation failures

- Review AGENTS.md for current conventions
- Check error messages for specific issues
- Use `@agent validate-repository` to see all issues

## Contributing

When adding new skills or modifying the agent:

1. Update this README with new capabilities
2. Document parameters and examples
3. Add validation rules if applicable
4. Update AGENTS.md with any new patterns
5. Test thoroughly before committing

---

**Questions?** Check [../AGENTS.md](../AGENTS.md) for comprehensive repository guidelines.
