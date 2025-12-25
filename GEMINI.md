# WeChat Content Writer Project Context

## Project Overview

**WeChat Content Writer** is a specialized Claude Code plugin designed to automate and enhance the creation of professional content for WeChat Official Accounts. It integrates intelligent literature search (arXiv, Google Scholar), PDF analysis, and structured article generation.

The project consists of two main components:
1.  **Plugin Core (`wechat-content-writer/`)**: The actual Claude Code plugin containing commands, skills, agents, and a backend search server.
2.  **Documentation (`docs/`)**: A VitePress-based documentation site for users and developers.

## Directory Structure

*   `wechat-content-writer/`: **Plugin Source Code**
    *   `scripts/`: Backend server scripts (Search API).
    *   `commands/`: Slash command definitions (e.g., `/create-article`).
    *   `skills/`: Auto-triggered skills (e.g., `literature-research`).
    *   `agents/`: AI agent definitions.
    *   `.mcp.json`: Model Context Protocol configuration.
    *   `config.json`: Plugin configuration.
*   `docs/`: **Documentation Site** (VitePress)
    *   `.vitepress/`: VitePress config and theme.
    *   `guide/`: User guides.
    *   `development/`: Developer docs.
*   `wechat_doc/`: **Content Output Directory** (Generated articles are saved here).

## Development & Usage

### 1. Plugin Core (`wechat-content-writer`)

**Prerequisites:** Node.js >= 14.0.0

**Setup:**
```bash
cd wechat-content-writer
npm install
```

**Running the Search Server:**
The plugin relies on a local Express server for search capabilities.
```bash
# Start server (Production)
npm start

# Start server (Development with auto-reload)
npm run dev
```
*Server runs on port 3001 by default.*

**Installation Scripts:**
*   Windows: `.\install.ps1`
*   Unix: `./install.sh`
*(These scripts set up the directory structure and install dependencies.)*

**Key Commands:**
*   `/create-paper`: Generate academic paper reviews.
*   `/create-article-objective`: Create objective, professional articles.
*   `/search-content`: Search generated content.

### 2. Documentation (`docs`)

**Prerequisites:** Node.js >= 18.0.0 (Recommended for VitePress)

**Setup:**
```bash
cd docs
npm install
```

**Running the Docs Site:**
```bash
# Start local development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```
*Docs are typically served at `http://localhost:5173`.*

## Conventions & Standards

*   **Objective Writing Style:** The project strictly enforces an "Objective Writing Style" to avoid "AI-flavored" language.
    *   **Avoid:** Sensationalism ("Shocking!", "Magic"), First-person ("I", "We"), Excessive emojis.
    *   **Prefer:** Third-person neutral, data-driven statements, professional terminology.
*   **File Naming:** Generated articles follow the pattern: `{category}/{YYYY-MM-DD}_{title}.md`.
*   **Content Separation:** Plugin code stays in `wechat-content-writer/`, while generated user content goes to `wechat_doc/` (sibling directory) to facilitate independent versioning.
*   **MCP Integration:** The project uses the Model Context Protocol (MCP) to integrate the local search server with Claude.

## Key Configuration Files

*   `wechat-content-writer/config.json`: Controls content directories, file naming patterns, and category mappings.
*   `wechat-content-writer/.mcp.json`: Configures the MCP server connection to the local search API.
*   `docs/.vitepress/config.mjs`: Configuration for the documentation site.
