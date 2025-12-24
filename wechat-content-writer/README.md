# WeChat Content Writer

> A professional Claude Code plugin for WeChat official account content creation with intelligent literature search, PDF analysis, and automated article generation.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Node Version](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)](https://nodejs.org)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Plugin-purple)](https://claude.ai/code)

---

## Overview

**WeChat Content Writer** is a sophisticated content creation plugin designed for professional WeChat official account publishers. It combines AI-powered research capabilities with objective, technical writing standards to help you create high-quality articles efficiently.

### Key Features

- 🔍 **Intelligent Literature Search** - Automatically search latest academic papers and technical resources from arXiv and Google Scholar
- 📄 **PDF Document Analysis** - Deep parsing of academic papers and technical documentation with structured output
- ✍️ **Automated Article Generation** - Create WeChat-formatted articles based on research findings and analysis
- 📁 **Smart Category Management** - Automatic article organization by topic with date-based naming
- 🎯 **Objective Writing Style** - Built-in style guidelines to avoid sensationalist "AI-flavor" language
- 🔌 **MCP Integration** - Model Context Protocol server for extended search capabilities

---

## Design Philosophy

### Content-Plugin Separation

The plugin maintains a clear separation between **code** and **content**:

```
WechatDoucment/
├── wechat-content-writer/    # Plugin source code
└── wechat_doc/               # Generated content (outside plugin dir)
```

This separation enables:
- Independent version control for plugin and content
- Easy backup and management of articles
- Clean plugin updates without affecting user content

### Objective Writing Standards

The plugin enforces professional writing standards:

| Avoid | Use Instead |
|-------|-------------|
| "AI火眼金睛", "黑科技" | "AI视觉识别系统", "技术方案" |
| "震惊！", "突破！" | "技术进展", "应用实践" |
| First person "我/我们" | Third-person neutral perspective |
| Excessive emojis 🔥✨💡 | Minimal, professional formatting |

---

## Installation

### Prerequisites

- **Node.js** >= 14.0.0
- **Claude Code** CLI installed
- Windows PowerShell or Linux/macOS terminal

### Quick Install

```bash
# Clone the repository
git clone https://github.com/user/wechat-content-writer.git

# Navigate to plugin directory
cd wechat-content-writer

# Run installation script
# Windows PowerShell
.\install.ps1

# Linux/macOS
./install.sh
```

The installation script automatically:
1. Creates `wechat_doc/` directory structure with category folders
2. Configures proper paths in `config.json`
3. Installs npm dependencies
4. Sets up MCP server integration

### Manual Install

```bash
# Install dependencies
npm install

# Create content directories manually
mkdir -p ../../wechat_doc/{AI工业应用,文献解读,AI-Coding,技术分享,行业动态}

# Start the search server
npm start
```

---

## Usage

### Skills (Auto-triggered)

The plugin provides skills that activate automatically based on your conversation:

| Skill | Triggers | Description |
|-------|----------|-------------|
| `literature-research` | "搜索文献", "查找学术资料", "literature search" | Search arXiv for recent papers |
| `pdf-analysis` | "解析PDF", "解读文档", "analyze PDF" | Standard PDF analysis |
| `pdf-analysis-objective` | "客观分析", "专业解读" | Neutral, professional PDF analysis |

### Commands

```bash
# Create an article from search results
/wechat-content-writer:create-article "Title" --category="文献解读" --source="search" --template="literature-review"

# Create an objective-style article
/wechat-content-writer:create-article-objective "Technical Title" --category="AI工业应用" --source="pdf"

# Search for content
/wechat-content-writer:search-content "AI in manufacturing"

# Manage article categories
/wechat-content-writer:manage-categories
```

### Command Arguments

| Argument | Type | Required | Description |
|----------|------|----------|-------------|
| `article_title` | string | Yes | The article title |
| `--category` | string | Yes | One of: AI工业应用, 文献解读, AI-Coding, 技术分享, 行业动态 |
| `--source` | string | Yes | search, pdf, research, manual |
| `--template` | string | No | literature-review, technical-deep-dive, news-analysis, tutorial |

---

## File Organization

### Content Directory Structure

```
wechat_doc/
├── AI工业应用/
│   └── 2025-12-20_AI_Vision_in_Steel_Industry.md
├── 文献解读/
│   └── 2025-12-20_GPT-4_Technical_Analysis.md
├── AI-Coding/
│   └── 2025-12-20_Programming_Tips.md
├── 技术分享/
│   └── 2025-12-21_Technical_Practices.md
└── 行业动态/
    └── 2025-12-21_Industry_Trends.md
```

### File Naming Convention

```
{category}/{YYYY-MM-DD}_{title}.md
```

**Example:** `文献解读/2025-12-20_Deep_Learning_in_NLP.md`

### Article File Format

Each generated article includes YAML frontmatter:

```markdown
---
title: "Article Title"
category: "文献解读"
date: "2025-12-20"
source: "pdf"
template: "literature-review"
tags: ["AI", "Deep Learning", "NLP"]
---

# Article Title

## Summary
...

## Content
...

---
*Source: [Citation]*
```

---

## Development

### Project Structure

```
wechat-content-writer/
├── .claude-plugin/          # Plugin metadata
│   └── plugin.json          # Plugin configuration
├── agents/                  # AI agent definitions
│   └── content-writer.md    # Main content creation agent
├── commands/                # Slash commands
│   ├── create-article.md
│   ├── create-article-objective.md
│   ├── search-content.md
│   └── manage-categories.md
├── skills/                  # Auto-triggered skills
│   ├── literature-research/
│   ├── pdf-analysis/
│   └── pdf-analysis-objective/
├── scripts/                 # Server implementations
│   ├── search-server.js     # Main search API server
│   ├── simple-search-server.js
│   └── test-server.js
├── hooks/                   # Plugin lifecycle hooks
├── config.json              # Plugin configuration
├── .mcp.json                # MCP server definitions
├── package.json
├── install.sh               # Unix installation script
├── install.ps1              # Windows installation script
└── README.md
```

### Running the Search Server

```bash
# Production mode
npm start

# Development mode with auto-reload
npm run dev

# Test server functionality
npm test
```

The search server runs on port 3001 and provides:
- `POST /search/academic` - Academic literature search (arXiv, Google Scholar)
- `POST /search/web` - General web content search
- `POST /analyze/content` - Content analysis from URLs
- `GET /health` - Health check endpoint

### MCP Server Configuration

The plugin integrates an MCP web search server defined in `.mcp.json`:

```json
{
  "mcpServers": {
    "web-search": {
      "command": "node",
      "args": ["${CLAUDE_PLUGIN_ROOT}/scripts/simple-search-server.js"],
      "env": { "PORT": "3001" }
    }
  }
}
```

### Configuration

Edit `config.json` to customize:

```json
{
  "version": "1.0.0",
  "plugin_name": "wechat-content-writer",
  "content_directories": {
    "base_path": "../../wechat_doc",
    "categories": {
      "AI工业应用": "AI工业应用",
      "文献解读": "文献解读",
      "AI-Coding": "AI-Coding",
      "技术分享": "技术分享",
      "行业动态": "行业动态"
    }
  },
  "file_naming": {
    "pattern": "{category}/{date}_{title}.md",
    "date_format": "YYYY-MM-DD"
  },
  "auto_create_directories": true,
  "content_validation": true
}
```

---

## Content Creation Workflow

### 1. Literature Research

Use the `literature-research` skill to find academic papers:

```
You: "搜索最新的AI工业应用论文"
```

The skill will:
- Search arXiv for recent papers
- Extract abstracts and key findings
- Assess relevance to your topic
- Prepare findings for article generation

### 2. PDF Analysis

Use `pdf-analysis` or `pdf-analysis-objective` to analyze documents:

```
You: "客观分析这篇PDF论文"
```

The skill will:
- Extract metadata (title, authors, publication)
- Parse abstract, methodology, results
- Identify technical contributions
- Transform into WeChat-friendly format

### 3. Article Creation

Use the create-article command to generate content:

```bash
/wechat-content-writer:create-article-objective \
  "基于多模态融合的FeO浓度实时预测技术应用研究" \
  --category="AI工业应用" \
  --source="pdf"
```

---

## Writing Style Guidelines

### Objective Writing Requirements

**AVOID (AI-flavor language):**
- ❌ "火眼金睛", "秒变炼丹炉", "黑科技"
- ❌ "震惊！", "突破！", "完美解决"
- ❌ First-person: "我", "我们"
- ❌ Excessive emojis: 🔥✨💡⚡
- ❌ Exaggerated claims: "彻底改变", "完美解决"

**USE (Professional language):**
- ✅ "AI视觉识别系统", "工艺参数优化"
- ✅ "技术进展", "应用实践", "解决方案"
- ✅ Third-person neutral perspective
- ✅ Specific data: "误差为0.02%，达到预期精度要求"
- ✅ Qualified statements: "有效改善", "显著提升"

### Title Examples

❌ Bad: "AI看火焰就能预测钢铁质量？中国研究团队黑科技突破！"

✅ Good: "基于多模态融合的FeO浓度实时预测技术应用研究"

For complete style guidelines, see [WRITING_STYLE_GUIDE.md](WRITING_STYLE_GUIDE.md).

---

## Troubleshooting

### Issue: "File not found" errors

**Solution:** Verify `base_path` in `config.json` points to correct `wechat_doc` location relative to plugin root.

### Issue: MCP server not responding

**Solution:**
1. Check if search server is running: `npm start`
2. Verify PORT environment variable (default 3001)
3. Check `.mcp.json` configuration

### Issue: Category directory missing

**Solution:**
1. Run installation script: `.\install.ps1` or `./install.sh`
2. Manually create: `mkdir -p ../../wechat_doc/{category-name}`
3. Verify `auto_create_directories: true` in config

### Issue: Generated content has "AI flavor"

**Solution:**
1. Use `create-article-objective` command instead of `create-article`
2. Use `pdf-analysis-objective` skill instead of `pdf-analysis`
3. Review [WRITING_STYLE_GUIDE.md](WRITING_STYLE_GUIDE.md) for style guidelines

---

## Dependencies

### Runtime
- `express` ^4.18.2 - Web server framework
- `cors` ^2.8.5 - Cross-origin resource sharing
- `axios` ^1.6.2 - HTTP client for API requests
- `jsdom` ^23.0.1 - DOM parsing for web content extraction

### Development
- `nodemon` ^3.0.2 - Auto-reload during development

---

## Documentation

- **[CLAUDE.md](CLAUDE.md)** - Comprehensive development documentation
- **[CONTENT_GUIDE.md](CONTENT_GUIDE.md)** - Directory structure and file path conventions
- **[WRITING_STYLE_GUIDE.md](WRITING_STYLE_GUIDE.md)** - Objective writing style guidelines
- **[INSTALL_GUIDE.md](INSTALL_GUIDE.md)** - Detailed installation instructions
- **[PLUGIN_OPTIMIZATION_SUMMARY.md](PLUGIN_OPTIMIZATION_SUMMARY.md)** - Performance and optimization notes

---

## Version History

### v1.0.0
- Initial release
- Literature search from arXiv and Google Scholar
- PDF document analysis with two modes (standard/objective)
- Automated article generation with multiple templates
- Smart category management with date-based naming
- MCP server integration for extended search

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## Support

For issues, questions, or suggestions, please:
- Open an issue on [GitHub Issues](https://github.com/user/wechat-content-writer/issues)
- Consult the [documentation](#documentation)
- Review the [troubleshooting section](#troubleshooting)

---

*Made with ❤️ for professional WeChat content creators*
