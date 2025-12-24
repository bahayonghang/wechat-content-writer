# WeChat Content Writer Plugin - 模块文档

[根目录](../CLAUDE.md) > **wechat-content-writer**

---

> **最后更新**: 2025-12-24
> **模块类型**: Claude Code Plugin
> **技术栈**: JavaScript/Node.js, Express.js, MCP

---

## 变更记录 (Changelog)

| 日期 | 版本 | 变更内容 |
|------|------|----------|
| 2025-12-24 | 1.0.0 | 初始化模块架构文档，添加面包屑导航 |

---

## 模块职责

**wechat-content-writer** 是核心插件模块，负责：

1. **命令处理**: 提供 9 个斜杠命令，覆盖不同类型的内容创作需求
2. **技能触发**: 3 个自动技能，根据用户意图智能触发
3. **AI 代理**: 内容创作代理，支持复杂任务的编排和优化
4. **搜索服务**: 基于 Express 的搜索服务器，提供学术文献和网页搜索能力
5. **配置管理**: 插件配置、MCP 服务器配置、内容目录管理

---

## 入口与启动

### 插件入口

| 入口文件 | 类型 | 说明 |
|----------|------|------|
| `.claude-plugin/plugin.json` | Plugin Metadata | Claude Code 插件定义 |
| `.mcp.json` | MCP Config | MCP 服务器配置 |
| `package.json` | NPM Package | Node.js 包定义 |

### 服务启动

```bash
# 生产模式
npm start          # 启动 search-server.js (端口 3001)

# 开发模式
npm run dev        # 使用 nodemon 自动重载

# 测试
npm test           # 运行测试脚本
```

### 服务端点

| 端点 | 方法 | 功能 |
|------|------|------|
| `/health` | GET | 健康检查 |
| `/search/academic` | POST | 学术文献搜索 (arXiv + Google Scholar) |
| `/search/web` | POST | 通用网页搜索 |
| `/analyze/content` | POST | 内容分析 |

---

## 对外接口

### 命令接口

| 命令 | 用途 | 参数 | 模板 |
|------|------|------|------|
| `create-paper` | 学术论文解读 | `title, --category, [--url]` | Academic Research |
| `create-article-objective` | 客观专业文章 | `title, --category, --source, [--template]` | Multiple |
| `create-news` | 行业新闻分析 | `title, --category, [--source]` | News Analysis |
| `create-tutorial` | 技术教程 | `title, --category, --level` | Tutorial |
| `create-report` | 行业研究报告 | `title, --category, --focus` | Industry Report |
| `create-tech` | 技术深度解析 | `title, --category, --aspect` | Technical Deep Dive |
| `create-article` | 通用文章创建 | `title, --category, --source, [--template]` | Multiple |
| `search-content` | 内容搜索 | `query` | - |
| `manage-categories` | 分类管理 | `list/add/remove` | - |

### 技能接口

| 技能 | 触发关键词 | 输出 |
|------|-----------|------|
| `literature-research` | "搜索文献", "literature search" | 研究文献汇总 |
| `pdf-analysis` | "解析PDF", "analyze PDF" | 通俗解读内容 |
| `pdf-analysis-objective` | "客观分析", "专业解读" | 专业技术分析 |

### 代理接口

| 代理 | 用途 | 工具集 |
|------|------|--------|
| `content-writer` | 综合内容创作 | Read, Write, Edit, Grep, Glob, WebSearch, MCP tools |

---

## 关键依赖与配置

### 运行时依赖

```json
{
  "express": "^4.18.2",    // Web 服务器框架
  "cors": "^2.8.5",        // 跨域支持
  "axios": "^1.6.2",       // HTTP 客户端
  "jsdom": "^23.0.1"       // DOM 解析
}
```

### 开发依赖

```json
{
  "nodemon": "^3.0.2"      // 开发时自动重载
}
```

### 配置文件结构

#### `config.json`
```json
{
  "version": "1.0.0",
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

#### `.mcp.json`
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

### 环境变量

| 变量 | 说明 | 默认值 |
|------|------|--------|
| `PORT` | 搜索服务器端口 | `3001` |
| `SEARCH_API_KEY` | Google Scholar/SerpAPI 密钥 | - |

---

## 数据模型

### 文章元数据模型

```yaml
---
title: "文章标题"
category: "分类名称"
date: "YYYY-MM-DD"
source: "search|pdf|research|manual"
template: "模板类型"
tags: ["标签1", "标签2"]
estimated_read_time: "阅读时间（分钟）"
references: ["引用来源"]
---
```

### 内容分类模型

```
wechat_doc/
├── AI工业应用/          # 工业AI应用案例
├── 文献解读/            # 学术论文解读
├── AI-Coding/           # AI编程技术
├── 技术分享/            # 通用技术分享
└── 行业动态/            # 行业新闻趋势
```

### 文件命名模型

```
{category}/{YYYY-MM-DD}_{sanitized_title}.md
```

**示例**:
```
文献解读/2025-12-24_基于多模态融合的FeO浓度实时预测技术研究.md
```

---

## 测试与质量

### 当前测试状态

| 类型 | 状态 | 说明 |
|------|------|------|
| 单元测试 | 未实现 | 建议为搜索服务器添加测试 |
| 集成测试 | 未实现 | 建议为命令/技能添加 E2E 测试 |
| 手动测试 | 部分 | 通过 Claude Code 交互验证 |

### 质量保证清单

#### 内容质量
- [ ] 使用客观、中立的第三人称表达
- [ ] 基于可靠来源的数据和事实
- [ ] 包含必要的局限性说明
- [ ] 遵循 `WRITING_STYLE_GUIDE.md` 规范

#### 技术质量
- [ ] 搜索服务器响应正常
- [ ] MCP 工具可正常调用
- [ ] 文件路径正确解析
- [ ] 错误处理和提示清晰

#### 文档质量
- [ ] 命令文档包含参数说明
- [ ] 技能文档包含触发条件
- [ ] 示例代码可执行
- [ ] 变更记录更新

---

## 常见问题 (FAQ)

### Q1: 插件无法被 Claude Code 识别
**A**: 检查以下项：
1. `.claude-plugin/plugin.json` 文件存在且格式正确
2. 插件目录路径正确
3. 使用 `--plugin-dir` 参数指定路径

### Q2: 搜索服务无法启动
**A**:
1. 检查 Node.js 版本 >= 14.0.0
2. 确认端口 3001 未被占用
3. 运行 `npm install` 安装依赖
4. 查看错误日志

### Q3: 生成的文章仍有"AI味"
**A**:
1. 使用 `pdf-analysis-objective` 替代 `pdf-analysis`
2. 使用 `create-article-objective` 替代 `create-article`
3. 参考 `WRITING_STYLE_GUIDE.md` 检查用词
4. 确保使用第三人称视角

### Q4: 内容目录路径错误
**A**:
1. 检查 `config.json` 中 `base_path` 配置
2. 确认使用相对路径 `../../wechat_doc`
3. 验证目录是否存在

### Q5: 如何添加新的文章分类？
**A**:
1. 编辑 `config.json` 添加新分类
2. 创建目录: `mkdir -p ../../wechat_doc/新分类`
3. 更新 `CONTENT_GUIDE.md` 文档

---

## 相关文件清单

### 核心文件
```
wechat-content-writer/
├── .claude-plugin/plugin.json     # 插件元数据
├── .mcp.json                      # MCP 服务器配置
├── config.json                    # 插件配置
├── package.json                   # NPM 包配置
├── CLAUDE.md                      # 本文档
├── README.md                      # 项目概述
├── CONTENT_GUIDE.md               # 内容组织指南
├── WRITING_STYLE_GUIDE.md         # 写作风格指南
├── INSTALL_GUIDE.md               # 安装指南
├── install.sh                     # Unix 安装脚本
├── install.ps1                    # Windows 安装脚本
├── agents/content-writer.md       # 内容创作代理
├── commands/                      # 命令目录 (9个命令)
├── skills/                        # 技能目录 (3个技能)
└── scripts/                       # 服务脚本 (2个脚本)
```

### 命令文件
```
commands/
├── create-paper.md                # 学术论文解读
├── create-article-objective.md    # 客观文章创建
├── create-news.md                 # 新闻分析
├── create-tutorial.md             # 教程创作
├── create-report.md               # 报告生成
├── create-tech.md                 # 技术解析
├── create-article.md              # 通用文章
├── search-content.md              # 内容搜索
└── manage-categories.md           # 分类管理
```

### 技能文件
```
skills/
├── literature-research/
│   └── SKILL.md                   # 文献研究技能
├── pdf-analysis/
│   └── SKILL.md                   # PDF 解读技能
├── pdf-analysis-objective/
│   └── SKILL.md                   # 客观 PDF 分析技能
└── literature-research/
    └── examples/
        └── search-strategy-example.md
```

### 服务脚本
```
scripts/
├── search-server.js               # 主搜索服务器
├── simple-search-server.js        # 简化搜索服务器
└── test-plugin.js                 # 测试脚本
```

---

## 变更记录 (Changelog)

### 2025-12-24 - v1.0.0
- 初始化模块架构文档
- 添加面包屑导航
- 整理命令、技能、接口清单
- 完善数据模型说明
- 添加常见问题解答

---

*本文档由 init-architect 自动生成和维护*
