# 微信公众号内容创作插件

> ⚠️ **注意**：这个skill目前还在自用测试阶段，如果有问题请在issue中及时反馈。

> 专业的 Claude Code 插件，用于微信公众号内容创作，支持文献搜索、PDF解读和自动文章生成。

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Node Version](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)](https://nodejs.org)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Plugin-purple)](https://claude.ai/code)
[![Docs](https://img.shields.io/badge/docs-VitePress-42b883?logo=vitepress)](https://bahayonghang.github.io/WechatDoucment/)

---

## 项目简介

**微信公众号内容创作插件**是为专业公众号运营者设计的智能内容创作工具。结合 AI 驱动的文献检索能力与客观专业的写作标准，帮助您高效创作高质量文章。

### 核心功能

| 功能 | 说明 |
|------|------|
| 🔍 **文献搜索** | 从 arXiv 和 Google Scholar 搜索学术论文 |
| 📄 **PDF 解读** | 深度解析学术论文和技术文档 |
| ✍️ **文章生成** | 自动生成微信公众号格式的文章 |
| 📁 **智能管理** | 基于日期的文件命名和分类管理 |
| 🎯 **专业风格** | 内置写作规范，避免"AI味"语言 |

---

## 🚀 安装方法

### 方式一：通过 Marketplace 安装（推荐）

> **最简单的安装方式！**

```bash
# 步骤 1：添加 marketplace
/plugin marketplace add bahayonghang/wechat-content-writer

# 步骤 2：安装插件
/plugin install wechat-content-writer@wechat-content-writer-marketplace
```

就这样！插件会自动下载并配置完成。

---

### 方式二：手动安装

```bash
# 克隆仓库
git clone https://github.com/bahayonghang/wechat-content-writer.git

# 进入插件目录
cd wechat-content-writer

# 运行安装脚本
# Windows PowerShell
.\install.ps1

# Linux/macOS
./install.sh
```

---

## 快速开始

```bash
# 进入插件目录
cd wechat-content-writer

# 运行安装脚本
# Windows PowerShell
.\install.ps1

# Linux/macOS
./install.sh
```

---

## 项目结构

```
WechatDoucment/
├── wechat-content-writer/    # 插件源代码
│   ├── agents/              # AI 代理定义
│   ├── commands/            # 自定义命令
│   ├── skills/              # 自动触发技能
│   ├── scripts/             # 服务器实现
│   └── config.json          # 插件配置
│
└── wechat_doc/              # 生成的内容（安装时创建）
    ├── AI工业应用/
    ├── 文献解读/
    ├── AI-Coding/
    ├── 技术分享/
    └── 行业动态/
```

---

## 使用示例

```bash
# 基于 PDF 分析创建文章
/wechat-content-writer:create-article-objective \
  "文章标题" \
  --category="文献解读" \
  --source="pdf"

# 搜索文献资料
/wechat-content-writer:search-content "AI 制造业应用"

# 管理文章分类
/wechat-content-writer:manage-categories
```

---

## 技能（自动触发）

| 技能 | 触发词 | 说明 |
|------|--------|------|
| `literature-research` | "搜索文献"、"查找学术资料" | 搜索 arXiv 最新论文 |
| `pdf-analysis` | "解析PDF"、"解读文档" | 标准 PDF 分析 |
| `pdf-analysis-objective` | "客观分析"、"专业解读" | 中立专业的 PDF 分析 |

---

## 文档导航

> 📖 **[在线文档](https://bahayonghang.github.io/WechatDoucment/)** - 访问 VitePress 文档站点

### 用户指南
| 文档 | 说明 |
|------|------|
| [快速开始](https://bahayonghang.github.io/WechatDoucment/guide/getting-started) | 5分钟上手指南 |
| [安装配置](https://bahayonghang.github.io/WechatDoucment/guide/installation) | 详细安装步骤 |
| [命令参考](https://bahayonghang.github.io/WechatDoucment/guide/commands) | 9个命令完整说明 |
| [技能使用](https://bahayonghang.github.io/WechatDoucment/guide/skills) | 3个自动技能介绍 |
| [写作风格](https://bahayonghang.github.io/WechatDoucment/guide/writing-style) | 客观写作规范指南 |
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
| [插件文档](wechat-content-writer/README.md) | 完整的插件英文文档 |
| [CLAUDE.md](CLAUDE.md) | 项目架构文档 |
| [插件 CLAUDE.md](wechat-content-writer/CLAUDE.md) | Claude Code 开发指南 |
| [CONTENT_GUIDE.md](wechat-content-writer/CONTENT_GUIDE.md) | 目录结构和文件规范 |
| [WRITING_STYLE_GUIDE.md](wechat-content-writer/WRITING_STYLE_GUIDE.md) | 专业写作风格指南 |
| [INSTALL_GUIDE.md](wechat-content-writer/INSTALL_GUIDE.md) | 详细安装说明 |

[English Documentation](README.md)

---

## 系统要求

- **Node.js** >= 14.0.0
- 已安装 **Claude Code** CLI
- Windows PowerShell 或 Linux/macOS 终端

---

## 许可证

MIT License - 详见 [LICENSE](LICENSE)。

---

## 贡献指南

欢迎贡献代码！请随时提交 Pull Request。

---

*为专业微信内容创作者打造*
