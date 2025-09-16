# MCP Server Setup Meta Prompt

You are an expert assistant helping to set up Model Context Protocol (MCP) servers in Visual Studio Code. Your task is to help create and configure a `.vscode/mcp.json` file with the appropriate MCP servers for enhanced GitHub Copilot functionality.

## Getting Started

I need to set up MCP servers in my VS Code workspace. Please help me create a `.vscode/mcp.json` configuration file that includes:

**Required MCP Servers:**
- Microsoft Docs MCP Server (for documentation search and grounding)
- GitHub MCP Server (for repository and GitHub API access)

**Optional MCP Servers** (ask if I want to include):
- Hugging Face MCP Server (for model and dataset information)
- Other relevant MCP servers based on my project needs

## Configuration Requirements

### Security Considerations
- Never hardcode sensitive tokens directly in the configuration
- Use environment variables or input prompts for authentication tokens
- Explain how to set up GitHub Codespaces secrets for token management
- Ensure the `.vscode/mcp.json` file is added to `.gitignore`

### Required Tokens/Authentication
Help me understand what tokens I need to create:
1. **GitHub Personal Access Token (PAT)**: Fine-grained token for GitHub MCP server
2. **Hugging Face Token**: Read-only token for HF MCP server (if included)
3. **Other tokens**: Based on additional servers selected

### Configuration Format
The MCP configuration should include:
- **inputs**: For secure token handling via prompts
- **servers**: Configuration for each MCP server including:
  - Connection details (URL or Docker command)
  - Authentication setup
  - Environment variable handling

## Expected Deliverables

1. **Complete `.vscode/mcp.json` file** with:
   - Microsoft Docs MCP server configuration
   - GitHub MCP server with secure token handling
   - Any additional servers I request

2. **Setup Instructions** including:
   - How to create required tokens
   - How to set up GitHub Codespaces secrets
   - How to ensure `.vscode/mcp.json` is in `.gitignore`
   - How to test the MCP server connections

3. **Security Best Practices**:
   - Token management recommendations
   - Repository security considerations
   - Environment variable setup

## Sample Configuration Reference

Based on the project documentation, the configuration should follow this pattern:

```json
{
    "inputs": [
        {
            "type": "promptString",
            "id": "github_token", 
            "description": "GitHub Personal Access Token",
            "password": true
        }
    ],
    "servers": {
        "microsoft-docs-mcp": {
            "url": "https://learn.microsoft.com/api/mcp"
        },
        "github": {
            "command": "docker",
            "args": [
                "run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN",
                "ghcr.io/github/github-mcp-server"
            ],
            "env": {
                "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github_token}"
            }
        }
    }
}
```

## Questions to Ask Me

Before creating the configuration, please ask me:
1. Do I want to include the Hugging Face MCP server?
2. Are there any other specific MCP servers I need for my project?
3. Am I using GitHub Codespaces or local development?
4. Do I already have the required tokens, or do I need help creating them?

Please provide step-by-step guidance and create the complete configuration file based on my needs.