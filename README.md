# WeChat Content Writer

> ⚠️ **Note**: This skill is currently in the self-use testing phase. If you have any questions, please report them in the issues in a timely manner.

> A professional Claude Code plugin for WeChat official account content creation with intelligent literature search, PDF analysis, and automated article generation.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Node Version](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)](https://nodejs.org)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Plugin-purple)](https://claude.ai/code)
[![Docs](https://img.shields.io/badge/docs-VitePress-42b883?logo=vitepress)](https://bahayonghang.github.io/WechatDoucment/)

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

> 📖 **[在线文档](https://bahayonghang.github.io/WechatDoucment/)** - 访问 VitePress 文档站点

### 用户指南
| 文档 | 说明 |
|------|------|
| [快速开始](https://bahayonghang.github.io/WechatDoucment/guide/getting-started) | 5分钟上手指南 |
| [安装配置](https://bahayonghang.github.io/WechatDoucment/guide/installation) | 详细安装步骤 |
| [命令参考](https://bahayonghang.github.io/WechatDoucment/guide/commands) | 9个命令完整说明 |
| [技能使用](https://bahayonghang.github.io/WechatDoucment/guide/skills) | 3个自动技能介绍 |
| [���作风格](https://bahayonghang.github.io/WechatDoucment/guide/writing-style) | 客观写作规范指南 |
| [常见问题](https://bahayonghang.github.io/WechatDoucment/guide/faq) | FAQ 和故障排查 |

### 开发文档
| 文档 | 说明 |
|------|------|
| [架构设计](https://bahayonghang.github.io/WechatDoucment/development/architecture) | 系统架构和数据流 |
| [API 参考](https://bahayonghang.github.io/WechatDoucment/development/api) | 搜索服务完整 API |
| [配置说明](https://bahayonghang.github.io/WechatDoucment/development/configuration) | 所有配置选项 |
| [插件开发](https://bahayonghang.github.io/WechatDoucment/development/plugin-development) | 开发者指南 |
| [贡献指南](https://bahayonghang.github.io/WechatDoucment/development/contributing) | 如何贡献代码 |

### 项目文档
| 文档 | 说明 |
|------|------|
| [Plugin README](wechat-content-writer/README.md) | 插件完整文档 |
| [CLAUDE.md](CLAUDE.md) | 项目架构文档 |
| [Plugin CLAUDE.md](wechat-content-writer/CLAUDE.md) | Claude Code 开发指南 |
| [CONTENT_GUIDE.md](wechat-content-writer/CONTENT_GUIDE.md) | 目录结构和文件规范 |
| [WRITING_STYLE_GUIDE.md](wechat-content-writer/WRITING_STYLE_GUIDE.md) | 专业写作风格指南 |
| [INSTALL_GUIDE.md](wechat-content-writer/INSTALL_GUIDE.md) | 详细安装说明 |

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
