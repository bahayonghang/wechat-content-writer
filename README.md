# WeChat Content Writer

> A professional Claude Code plugin for WeChat official account content creation with intelligent literature search, PDF analysis, and automated article generation.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Node Version](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)](https://nodejs.org)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Plugin-purple)](https://claude.ai/code)

---

## Overview

**WeChat Content Writer** is a sophisticated content creation plugin designed for professional WeChat official account publishers. It combines AI-powered research capabilities with objective, technical writing standards to help you create high-quality articles efficiently.

### Key Features

| Feature | Description |
|---------|-------------|
| 🔍 **Literature Search** | Search arXiv and Google Scholar for academic papers |
| 📄 **PDF Analysis** | Deep parsing of academic papers and technical docs |
| ✍️ **Article Generation** | Create WeChat-formatted articles automatically |
| 📁 **Smart Organization** | Date-based file naming with category management |
| 🎯 **Professional Style** | Built-in guidelines to avoid "AI-flavor" language |

---

## 🚀 Installation

### Option 1: Install via Marketplace (Recommended)

> **The easiest way to install the plugin!**

```bash
# Step 1: Add the marketplace
/plugin marketplace add bahayonghang/wechat-content-writer

# Step 2: Install the plugin
/plugin install wechat-content-writer@wechat-content-writer-marketplace
```

That's it! The plugin will be automatically downloaded and configured.

---

### Option 2: Manual Installation

```bash
# Clone the repository
git clone https://github.com/bahayonghang/wechat-content-writer.git

# Navigate to plugin directory
cd wechat-content-writer

# Run installation script
# Windows PowerShell
.\install.ps1

# Linux/macOS
./install.sh
```

---

## Quick Start

```bash
# Navigate to plugin directory
cd wechat-content-writer

# Run installation script
# Windows PowerShell
.\install.ps1

# Linux/macOS
./install.sh
```

---

## Project Structure

```
WechatDoucment/
├── wechat-content-writer/    # Plugin source code
│   ├── agents/              # AI agent definitions
│   ├── commands/            # Slash commands
│   ├── skills/              # Auto-triggered skills
│   ├── scripts/             # Server implementations
│   └── config.json          # Plugin configuration
│
└── wechat_doc/              # Generated content (created on install)
    ├── AI工业应用/
    ├── 文献解读/
    ├── AI-Coding/
    ├── 技术分享/
    └── 行业动态/
```

---

## Usage Example

```bash
# Create an article from PDF analysis
/wechat-content-writer:create-article-objective \
  "Title" \
  --category="文献解读" \
  --source="pdf"

# Search for literature
/wechat-content-writer:search-content "AI in manufacturing"

# Manage categories
/wechat-content-writer:manage-categories
```

---

## Skills (Auto-triggered)

| Skill | Triggers | Description |
|-------|----------|-------------|
| `literature-research` | "搜索文献", "查找学术资料", "literature search" | Search arXiv for recent papers |
| `pdf-analysis` | "解析PDF", "解读文档", "analyze PDF" | Standard PDF analysis |
| `pdf-analysis-objective` | "客观分析", "专业解读" | Neutral, professional PDF analysis |

---

## Documentation

| Document | Description |
|----------|-------------|
| [Plugin README](wechat-content-writer/README.md) | Complete plugin documentation |
| [CLAUDE.md](wechat-content-writer/CLAUDE.md) | Development guide for Claude Code |
| [CONTENT_GUIDE.md](wechat-content-writer/CONTENT_GUIDE.md) | Directory structure and file conventions |
| [WRITING_STYLE_GUIDE.md](wechat-content-writer/WRITING_STYLE_GUIDE.md) | Professional writing style guidelines |
| [INSTALL_GUIDE.md](wechat-content-writer/INSTALL_GUIDE.md) | Detailed installation instructions |

[中文文档](README_CN.md)

---

## Requirements

- **Node.js** >= 14.0.0
- **Claude Code** CLI installed
- Windows PowerShell or Linux/macOS terminal

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

*Made with ❤️ for professional WeChat content creators*
