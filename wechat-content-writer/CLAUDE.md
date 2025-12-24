# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**WeChat Content Writer** is a Claude Code plugin for creating professional WeChat official account articles. It provides intelligent literature search, PDF analysis, and automated article generation capabilities with a focus on objective, technical writing styles.

**Tech Stack:** TypeScript/JavaScript (Node.js), Express.js, MCP (Model Context Protocol) servers

**Key Design Philosophy:**
- **Objective & Professional**: Avoid sensationalist "AI-flavor" language; maintain neutral, technical accuracy
- **Content-Plugin Separation**: Plugin code in `wechat-content-writer/`, content output in `../../wechat_doc/`
- **Date-Based Organization**: All articles follow `{category}/YYYY-MM-DD_{title}.md` naming convention

---

## Directory Architecture

```
WechatDoucment/                # Repository root
├── wechat-content-writer/     # Plugin source code (THIS directory)
│   ├── agents/                # AI agent definitions
│   │   └── content-writer.md  # Main content creation agent
│   ├── commands/              # Slash commands
│   │   ├── create-article.md
│   │   ├── create-article-objective.md  # Objective-style article creation
│   │   ├── search-content.md
│   │   └── manage-categories.md
│   ├── skills/                # Auto-triggered skills
│   │   ├── literature-research/
│   │   ├── pdf-analysis/      # Standard PDF analysis
│   │   └── pdf-analysis-objective/  # Objective PDF analysis
│   ├── scripts/               # Server implementations
│   │   ├── search-server.js   # Main search API server
│   │   └── simple-search-server.js
│   ├── hooks/                 # Plugin lifecycle hooks
│   ├── config.json            # Plugin configuration
│   └── .mcp.json              # MCP server definitions
│
└── ../../wechat_doc/          # Content output (outside plugin dir!)
    ├── AI工业应用/
    ├── 文献解读/
    ├── AI-Coding/
    ├── 技术分享/
    └── 行业动态/
```

**Critical Path Separation:**
- Plugin root: `D:\Documents\WechatDoucment\wechat-content-writer\`
- Content base path: `../../wechat_doc/` (relative to plugin root)
- Content full path: `D:\Documents\WechatDoucment\wechat_doc\`

---

## Development Commands

### Running the Search Server
```bash
# Production mode
npm start

# Development mode with auto-reload
npm run dev

# Test server functionality
npm test
```

The search server (`search-server.js`) runs on port 3001 and provides:
- `POST /search/academic` - Academic literature search (arXiv, Google Scholar)
- `POST /search/web` - General web content search
- `POST /analyze/content` - Content analysis from URLs
- `GET /health` - Health check endpoint

### Plugin Installation
```bash
# Windows PowerShell
.\install.ps1

# Linux/macOS
./install.sh
```

Installation scripts automatically:
1. Create `wechat_doc/` directory structure with all category folders
2. Configure proper relative paths in `config.json`
3. Set up MCP server integration

---

## Content Creation Workflow

### 1. Literature Research (Skill: `literature-research`)
**Triggers:** "搜索文献", "查找学术资料", "literature search", "latest research"

**Workflow:**
- Search arXiv for recent papers in specific fields
- Extract abstracts, key findings, methodologies
- Assess relevance to target audience
- Prepare for WeChat article transformation

**Output:** Research findings summary with paper metadata

### 2. PDF Analysis (Skill: `pdf-analysis` or `pdf-analysis-objective`)
**Triggers:** "解析PDF", "解读文档", "analyze PDF", "parse academic paper"

**Two Modes:**
- **Standard (`pdf-analysis`)**: More conversational, engagement-focused
- **Objective (`pdf-analysis-objective`)**: Neutral, technical, third-person only

**Workflow:**
- Extract metadata (title, authors, publication)
- Parse abstract, methodology, results, conclusion
- Identify technical contributions and limitations
- Transform into WeChat-friendly format

**Output:** Structured analysis with key insights

### 3. Article Creation (Command: `create-article` or `create-article-objective`)
**Usage:**
```bash
/wechat-content-writer:create-article "标题" --category="文献解读" --source="pdf" --template="literature-review"
```

**Arguments:**
- `article_title` (required): Article title
- `--category` (required): One of "AI工业应用", "文献解读", "AI-Coding", "技术分享", "行业动态"
- `--source` (required): "search", "pdf", "research", "manual"
- `--template` (optional): "literature-review", "technical-deep-dive", "news-analysis", "tutorial"

**File Creation:**
- Path: `../../wechat_doc/{category}/{YYYY-MM-DD}_{title}.md`
- Includes YAML frontmatter with metadata
- Markdown formatted for WeChat platform

---

## Content Writing Style (Critical)

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

**Reference:** `WRITING_STYLE_GUIDE.md` for comprehensive style guidelines

### Title Examples

❌ Bad: "AI看火焰就能预测钢铁质量？中国研究团队黑科技突破！"
✅ Good: "基于多模态融合的FeO浓度实时预测技术应用研究"

---

## MCP Server Integration

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

**Available MCP Tools:**
- Web search capabilities via custom Express server
- arXiv API integration for academic papers
- Content analysis and extraction
- Optional Google Scholar integration (requires `SEARCH_API_KEY` env variable)

---

## Agent Architecture

### Content Writer Agent (`agents/content-writer.md`)

**Purpose:** Comprehensive WeChat content creation with research synthesis and technical writing

**Tools Available:**
- File operations: Read, Write, Edit
- Search: Grep, Glob, WebSearch
- MCP tools: Exa web search, Context7 docs, Playwright browser automation
- Model: Inherits from parent model configuration

**Responsibilities:**
1. Content strategy & planning
2. Research synthesis from multiple sources
3. Technical communication (simplify complexity, maintain accuracy)
4. Storytelling & engagement optimization
5. Platform optimization for WeChat mobile experience
6. Quality assurance (accuracy, attribution, editorial standards)

**Article Structure Template:**
```markdown
# [Compelling Title]

## 引言：为什么这个话题值得关注
[Engaging opening with hook]

## 核心概念解析
[Clear explanation with analogies]

## 深度分析：关键发现和洞察
[Main content with data and insights]

## 实际应用：这对我们意味着什么？
[Practical implications]

## 行动指南：如何应用这些洞察
[Concrete advice]

## 总结与展望
[Key takeaways and future developments]

---
*来源：[Citations and references]*
```

---

## Configuration Files

### `config.json` Structure
```json
{
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
  }
}
```

### Environment Variables (Optional)
- `PORT`: Search server port (default: 3001)
- `SEARCH_API_KEY`: Google Scholar/SerpAPI key for enhanced search

---

## Common Development Tasks

### Adding a New Article Category

1. Update `config.json`:
```json
"categories": {
  "新分类": "新分类"
}
```

2. Create directory manually or let installation script handle it:
```bash
mkdir -p ../../wechat_doc/新分类
```

3. Update `CONTENT_GUIDE.md` to document the new category

### Modifying Search Server

The main search logic is in `scripts/search-server.js`:
- `searchArxiv()`: arXiv API integration
- `searchGoogleScholar()`: Google Scholar via SerpAPI
- `analyzeContent()`: Web content extraction and analysis

**Key endpoints:**
- Academic search: Combines arXiv + optional Google Scholar results
- Web search: Falls back to free methods if no API key
- Content analysis: Extracts title, description, keywords, readability metrics

### Testing Article Generation

Use the create-article command with different templates:
```bash
# Literature review from PDF
/wechat-content-writer:create-article "论文标题解析" --category="文献解读" --source="pdf"

# Technical deep dive from search
/wechat-content-writer:create-article "技术实践" --category="技术分享" --source="search" --template="technical-deep-dive"

# Manual creation
/wechat-content-writer:create-article "行业趋势分析" --category="行业动态" --source="manual"
```

---

## Important Constraints & Best Practices

### Content Location
- **NEVER** store generated articles in the plugin directory
- **ALWAYS** use `../../wechat_doc/` relative path for content storage
- Plugin directory is for code/config only; `wechat_doc/` is for content only

### Path Resolution
All file operations in commands/skills must use:
```javascript
const contentBase = '../../wechat_doc';
const categoryPath = `${contentBase}/${category}`;
const filePath = `${categoryPath}/${date}_${title}.md`;
```

### Objectivity in Content
- Prefer `pdf-analysis-objective` skill for academic/technical content
- Use `create-article-objective` command for professional articles
- Follow `WRITING_STYLE_GUIDE.md` for tone and style
- Always include limitations and balanced perspectives

### Error Handling
- Validate category exists before file creation
- Check if `wechat_doc/` base directory exists
- Provide helpful error messages for path issues
- Auto-create directories if `auto_create_directories: true` in config

---

## Dependencies

### Runtime
- `express`: Web server framework
- `cors`: Cross-origin resource sharing
- `axios`: HTTP client for API requests
- `jsdom`: DOM parsing for web content extraction

### Development
- `nodemon`: Auto-reload during development

### Node.js Version
- Requires `>=14.0.0`

---

## Troubleshooting

### Issue: "File not found" errors
**Solution:** Verify `base_path` in `config.json` points to correct `wechat_doc` location relative to plugin root

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
3. Review `WRITING_STYLE_GUIDE.md` for style guidelines
4. Ensure third-person perspective and neutral language

---

## Plugin Extension Points

### Adding New Skills
1. Create directory: `skills/your-skill-name/`
2. Add `SKILL.md` with frontmatter (name, description, version)
3. Define triggers, workflow, and output format
4. Add examples in `skills/your-skill-name/examples/`

### Adding New Commands
1. Create markdown file: `commands/your-command.md`
2. Add frontmatter (name, description, argument-hint, allowed-tools)
3. Document usage, arguments, execution process
4. Include examples and error handling

### Modifying Search Server
- Add new endpoints in `scripts/search-server.js`
- Update API integration functions
- Modify request/response handling
- Update health check endpoint documentation

---

## Documentation References

- **README.md**: Project overview and features
- **CONTENT_GUIDE.md**: Directory structure and file path conventions
- **WRITING_STYLE_GUIDE.md**: Objective writing style guidelines
- **INSTALL_GUIDE.md**: Detailed installation instructions
- **PLUGIN_OPTIMIZATION_SUMMARY.md**: Performance and optimization notes

---

## Key Design Decisions

### Why Separate Plugin and Content Directories?
- Plugin code can be version-controlled independently
- Content can be managed/backed up separately
- Clear separation of concerns (code vs. data)
- Easier plugin updates without affecting user content

### Why Objective Writing Style?
- WeChat official accounts require professional credibility
- Technical audiences prefer factual, data-driven content
- Avoids "clickbait" reputation damage
- Better long-term audience engagement and trust

### Why Date-Based File Naming?
- Natural chronological organization
- Easy to identify content recency
- Supports content archival and cleanup
- Aligns with content management best practices

---

*This CLAUDE.md is maintained alongside the plugin. Update when adding new commands, skills, or modifying core architecture.*
