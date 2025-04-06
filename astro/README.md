# Building With Astro in Agent Mode

**Objective**: Create a "Models Cookbook" website on GitHub pages. 
- Landing Page advertises current Season of episodes for awareness
- Documentation pages move into Cookbook mode for actionable use
- Integrated blog provides a _newsletter_ features for continuity

**Assets**: Showcase these content collections from the series.
 - 15-minute spotlight on Monday Livestream / _views_
 - 30-minute AMA on Friday Discord / _attendees_
 - 8+ model cards on GitHub Pagees / _referrals_
 - 1+ model recipes on GitHub Repo / _forks_

<br/>

## 1. Copilot Usage

This is also a sandbox for exploring [GitHub Copilot in Agent Mode with MCP Tools](https://github.blog/news-insights/product-news/github-copilot-agent-mode-activated/). We'll start by activating the GitHub Copilot plugin in our devcontainer - then activating MCP Servers to get access to tools. After that it becomes more about prompt engineering agents to accomplish tasks.

- [X] Install GitHub Copilot in devcontainer
- [X] Authenticate with GitHub to activate
- [X] Switch to Agent Mode - select your model
- [X] Add [GitHub MCP Server](https://github.com/github/github-mcp-serve) - activate it
- [X] Add [Playwright MCP Server](https://github.com/microsoft/playwright-mcp) - activate it
- [X] Add [other MCP Servers](https://github.com/punkpeye/awesome-mcp-servers) - to meet requirements


<br/>

## 2. Astro Website

Astro is a popular web framework for building [content-focused](https://docs.astro.build/en/concepts/why-astro/) websites with [rich features](https://docs.astro.build/en/concepts/why-astro/#features) (including content collections and islands architecture) and clear [design principles](https://docs.astro.build/en/concepts/why-astro/#design-principles). It is known for being simple, fast, component-based, and customizable by default - with support for multiple JS/TS frameworks, integrations, and hooks.

The main reason to explore it is that it is _content focused_ (think website) as opposed to _interaction focused_ (think web application) making it ideal for documentation and blogs.

We'll start by creating a basic blog using [this tutorial](https://docs.astro.build/en/tutorial/0-introduction/). This does three things:

- Validates the vibe coding setup
- Validates the Astro framework setup

**First**: We'll start by doing [this tutorial](https://github.com/withastro/docs/tree/main/src/components/tutorial) to understand how Astro works.

- [X] Create a new "minimal" astro project at `astro/web`
- [X] Configure it to install dependencies but not new git
- [X] Change to `web` directory, run `npm run astro telemetry disable`
- [X] Start preview, run `npm run dev` → https://localhost:4321
- [X] Edit `web/src/pages/index.astro` → change title (see hot reload)
- [ ] Setup GitHub Actions to auto-deploy → TBD (deploy to GitHub Pages)
- [X] Add `web/src/pages/about.astro` → copy index.astro, modify it.
- [X] Add `web/src/pages/blog.astro` → copy index.astro, modify it.
- [X] Visit preview site with `/about` and `/blog` → verify valid routes
- [X] Visit preview site with `/testing` → get 404 page (invalid route)
- [X] Add basic HTML link tags to pages → verify routing works in page
- [ ]
- [ ]


**Next**: We'll experiment with adding Starlight docs to the same project 

-  [ ]

**Next**: We'll see if we can reuse the same docs/ folder of content with mkdocs. 

-  [ ]

**Finally**: We'll validate that our template meets these requirements:

- [ ] Support for [cookie consent](https://github.com/jop-software/astro-cookieconsent?tab=readme-ov-file)
- [ ] Support for [internationalization](https://docs.astro.build/en/guides/internationalization/)
- [ ] Support for [search](https://starlight.astro.build/guides/site-search/)
- [ ] Support for [showcase](https://starlight.astro.build/resources/showcase/) pages - [src](https://github.com/withastro/starlight/blob/main/docs/src/content/docs/resources/showcase.mdx)
- [ ] Support for [analytics](https://hideoo.dev/notes/starlight-custom-html-head) - see [recipes](https://starlight.astro.build/resources/community-content/)
- [ ] Support for [view transitions](https://events-3bg.pages.dev/library/StarlightPlugin/) - see [recipes](https://events-3bg.pages.dev/jotter/starlight/guide/)
- [ ] Support for [llms.txt](https://github.com/delucis/starlight-llms-txt) - see [demo](https://delucis.github.io/starlight-llms-txt/)
- [ ] Support for [automated deployment](https://docs.astro.build/en/guides/deploy/) - see [GitHub Pages](https://docs.astro.build/en/guides/deploy/github/)
- [ ] Select a good  [landing page](https://astro.build/themes/details/astro-landing-page/) - see [themes](https://astro.build/themes/1/?search=&categories%5B%5D=landing-page&price%5B%5D=free) e.g., [Astroplate](https://github.com/zeon-studio/astroplate?tab=readme-ov-file)
- [ ] Replicate the [gallery experience](https://astro.build/themes/1/) with sort/filters - see [blog post](https://digital-expanse.com/tutorials/astro-blog-filters/)

<br/>

## 3. Copilot Setup

Capturing the instructions for future consistency and reproducibility.

1. Update the `devcontainer.json` to install GitHub Copilot plugin 
    - Set to pre-release for now.
1. Click _Open Chat_ to enter Copilot Chat model.
    - Switch dropdown from `Ask` to `Agent`
    - Switch model from `GPT-4o` to `Claude 3.7 Sonnet`
1. Click _Tools_ icon to see default tools available
    - Currently **21 tools** from _GitHub Copilot for Azure_.
1. Follow [instructions](https://github.com/github/github-mcp-server?tab=readme-ov-file#usage-with-vs-code) to set up GitHub MCP server
    - Add `.vscode/mcp.json` as an empty file in repo.
    - Open it in editor. You see an `Add Server` button.
    - Update the file with _this_ code and save it.

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
                "github": {
                    "command": "docker",
                    "args": [
                        "run",
                        "-i",
                        "--rm",
                        "-e",
                        "GITHUB_PERSONAL_ACCESS_TOKEN",
                        "ghcr.io/github/github-mcp-server"
                    ],
                    "env": {
                        "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github_token}"
                    }
                }
            }
        }
        ```

    - You will see a "Start Server" cue show up in the editor over each "servers" entry. Click it.
        - You will be prompted for a GitHub Token input in the editor menu area
        - Enter a Personal Access Token setup with the permissions you want to give to MCP agents
        - Token is saved behind the scenes and not seen in the editor (no secrets leak)
        - Server status line updates to show "Running" and number of tools available 
    - You should now have **50 Tools** to play with
        - 29 from @azure extension
        - 21 from GitHub MCP server

1. Follow [instructions](https://github.com/microsoft/playwright-mcp) to set up Playwright MCP servers.
    - Add the [example config](https://github.com/microsoft/playwright-mcp?tab=readme-ov-file#example-config) to our `mcp.json`
    - We use default "Snapshot" mode - [configure vision mode](https://github.com/microsoft/playwright-mcp?tab=readme-ov-file#tool-modes) if needed
    - Start server - you have **65 Tools** to play with (15 from Playwright)

1. You can now add additional MCP servers from other sources
    - [Official MCP Server repository](https://github.com/modelcontextprotocol/servers)
    - [Awesome MCP Server directory](https://github.com/punkpeye/awesome-mcp-servers)

**You are now ready to start vibe-coding with GitHub Copilot**

<br/>

## 4. Astro Tutorial

<br/>

## 5. Copilot Tutorial

We can now [GitHub Copilot capabilities](https://code.visualstudio.com/docs/copilot/overview) for vibe coding.