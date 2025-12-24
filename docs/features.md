# 功能特性

WeChat Content Writer 插件提供全方位的内容创作能力。

## 核心功能

### 🔍 学术文献搜索

集成多个学术数据源，一键获取最新研究资料：

- **arXiv** - 预印本论文库
- **Google Scholar** - 学术文献搜索
- **智能筛选** - 按相关性、时间过滤
- **引用格式** - 自动生成标准引用

### 📄 PDF 智能分析

自动解析 PDF 文档，提取关键信息：

- **结构提取** - 识别章节、图表、公式
- **关键信息** - 作者、摘要、结论
- **通俗易懂** - 生成可理解的解读
- **客观专业** - 保持技术严谨性

### ✍️ 多模板文章生成

支持多种文章类型，满足不同创作需求：

| 模板 | 适用场景 |
|------|----------|
| **学术论文解读** | 论文综述、研究报告 |
| **行业新闻分析** | 新闻解读、行业动态 |
| **技术教程** | 入门指南、操作教程 |
| **行业报告** | 市场分析、趋势报告 |
| **技术深度解析** | 架构分析、性能评测 |
| **通用文章** | 自由创作 |

### 🎯 客观专业写作

坚持高质量写作标准：

- ✅ 第三人称视角
- ✅ 数据驱动表述
- ✅ 技术术语准确
- ✅ 包含局限性说明
- ❌ 避免标题党
- ❌ 避免 AI 味语言

### 📁 自动文件组织

智能管理生成内容：

- **日期命名** - `{category}/{YYYY-MM-DD}_{title}.md`
- **分类管理** - 5 个预定义分类
- **自动创建** - 目录不存在时自动创建
- **灵活配置** - 支持自定义命名模式

### 🤖 AI 驱动工作流

智能代理协调复杂任务：

- **自动触发** - 关键词自动识别
- **任务编排** - 多步骤自动执行
- **深度优化** - 结果质量检查
- **上下文保持** - 会话连贯性

---

## 命令功能

### 内容创作命令

| 命令 | 功能 | 输入 | 输出 |
|------|------|------|------|
| `/create-paper` | 学术论文解读 | 标题、分类 | Markdown 文章 |
| `/create-article-objective` | 客观文章 | 标题、分类、来源 | Markdown 文章 |
| `/create-news` | 新闻分析 | 标题、来源 | Markdown 文章 |
| `/create-tutorial` | 教程创作 | 标题、难度 | Markdown 文章 |
| `/create-report` | 行业报告 | 标题、关注点 | Markdown 文章 |
| `/create-tech` | 技术解析 | 标题、分析维度 | Markdown 文章 |
| `/create-article` | 通用文章 | 标题、模板 | Markdown 文章 |

### 管理命令

| 命令 | 功能 |
|------|------|
| `/search-content` | 搜索已生成内容 |
| `/manage-categories` | 管理文章分类 |

---

## 技能功能

### 自动触发技能

技能根据关键词自动触发，无需手动调用：

| 技能 | 触发词 | 功能 |
|------|--------|------|
| **literature-research** | "搜索文献"、"literature search" | 文献搜索与汇总 |
| **pdf-analysis** | "解析PDF"、"analyze PDF" | PDF 通俗解读 |
| **pdf-analysis-objective** | "客观分析"、"专业解读" | PDF 技术分析 |

---

## 代理功能

### content-writer 代理

综合内容创作代理，处理复杂任务：

**能力范围**：
- 文献调研与筛选
- 多源信息整合
- 深度内容生成
- 质量检查与优化

**可用工具**：
- Read/Write/Edit - 文件操作
- Grep/Glob - 代码搜索
- WebSearch - 网页搜索
- MCP 工具 - 搜索服务

---

## 搜索服务功能

### REST API 端点

| 端点 | 功能 | 方法 |
|------|------|------|
| `/health` | 健康检查 | GET |
| `/search/academic` | 学术文献搜索 | POST |
| `/search/web` | 网页搜索 | POST |
| `/analyze/content` | 内容分析 | POST |

### 数据源集成

- **arXiv API** - 免费访问，无需密钥
- **Google Scholar** - 需要配置 API 密钥
- **通用网页搜索** - 支持多种搜索引擎

---

## 配置功能

### 灵活配置

所有插件行为可通过配置文件自定义：

```json
{
  "content_directories": {
    "base_path": "../../wechat_doc",
    "categories": { /* 自定义分类 */ }
  },
  "file_naming": {
    "pattern": "{category}/{date}_{title}.md",
    "date_format": "YYYY-MM-DD"
  }
}
```

### 环境变量支持

- `PORT` - 服务端口配置
- `SEARCH_API_KEY` - 外部 API 密钥
- `LOG_LEVEL` - 日志级别控制

---

## 内容分类

### 预定义分类

| 分类 | 目录 | 说明 |
|------|------|------|
| AI工业应用 | `AI工业应用/` | 工业 AI 应用案例 |
| 文献解读 | `文献解读/` | 学术论文解读 |
| AI-Coding | `AI-Coding/` | AI 编程技术 |
| 技术分享 | `技术分享/` | 通用技术分享 |
| 行业动态 | `行业动态/` | 行业新闻趋势 |

### 自定义分类

支持添加自定义分类，详见 [配置说明](./development/configuration.md)。

---

## 文章元数据

所有生成的文章包含结构化元数据：

```yaml
---
title: "文章标题"
category: "分类名称"
date: "2024-12-24"
source: "search|pdf|research|manual"
template: "模板类型"
tags: ["标签1", "标签2"]
estimated_read_time: "5分钟"
references: ["来源1", "来源2"]
---
```

---

## 使用场景

### 场景一：学术研究者

```
搜索文献：深度学习在NLP中的应用
→ 获得 10+ 篇相关论文
→ 选择论文进行客观分析
→ 生成学术综述文章
```

### 场景二：技术博主

```
/create-tech "Kubernetes架构详解"
  --category 技术分享
  --aspect architecture
→ 自动搜索相关资料
→ 生成深度技术文章
```

### 场景三：行业分析师

```
/create-report "2024年AI产业发展报告"
  --category 行业动态
  --focus 市场规模,技术趋势
→ 整合多方信息
→ 生成专业报告
```

### 场景四：教程作者

```
/create-tutorial "Rust语言入门"
  --category 技术分享
  --level beginner
→ 生成结构化教程
→ 包含代码示例
```

---

## 下一步

- [快速开始](./guide/getting-started.md) - 立即开始使用
- [命令参考](./guide/commands.md) - 了解所有命令
- [技能使用](./guide/skills.md) - 了解自动技能
- [开发文档](./development/architecture.md) - 了解技术实现
