# 命令参考

WeChat Content Writer 插件提供了 9 个斜杠命令，覆盖各种内容创作场景。

## 命令概览

| 命令 | 用途 | 模板类型 |
|------|------|----------|
| `/create-paper` | 学术论文解读 | Academic Research |
| `/create-article-objective` | 客观专业文章 | Multiple |
| `/create-news` | 行业新闻分析 | News Analysis |
| `/create-tutorial` | 技术教程 | Tutorial |
| `/create-report` | 行业研究报告 | Industry Report |
| `/create-tech` | 技术深度解析 | Technical Deep Dive |
| `/create-article` | 通用文章创建 | Multiple |
| `/search-content` | 内容搜索 | N/A |
| `/manage-categories` | 分类管理 | N/A |

---

## /create-paper

学术论文解读命令，基于文献搜索或 PDF 文件生成专业的学术解读文章。

### 语法

```
/create-paper <title> --category <分类> [--url <PDF链接>]
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `title` | string | ✅ | 文章标题 |
| `--category` | string | ✅ | 目标分类 |
| `--url` | string | ❌ | PDF 文件链接（可选） |

### 示例

```
# 基础用法
/create-paper "多模态大语言模型研究进展" --category 文献解读

# 指定 PDF 来源
/create-paper "Transformer架构详解" --category 文献解读 --url https://arxiv.org/pdf/1706.03762.pdf
```

### 输出

文章将包含：
- 论文基本信息（作者、发表时间）
- 研究背景与动机
- 核心方法与技术
- 实验结果与分析
- 结论与未来方向
- 参考文献

---

## /create-article-objective

创建客观专业风格的文章，避免 AI 味语言。

### 语法

```
/create-article-objective <title> --category <分类> --source <来源> [--template <模板>]
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `title` | string | ✅ | 文章标题 |
| `--category` | string | ✅ | 目标分类 |
| `--source` | string | ✅ | 内容来源（search/pdf/research/manual） |
| `--template` | string | ❌ | 指定模板 |

### 支持的来源

| 来源 | 说明 |
|------|------|
| `search` | 基于网络搜索结果 |
| `pdf` | 基于 PDF 文档分析 |
| `research` | 基于学术文献搜索 |
| `manual` | 手动输入内容 |

### 示例

```
# 基于搜索结果
/create-article-objective "深度学习在医疗影像诊断中的应用" --category AI工业应用 --source search

# 基于 PDF 分析
/create-article-objective "GPT-4技术原理解析" --category AI-Coding --source pdf

# 基于学术研究
/create-article-objective "强化学习最新研究进展" --category 文献解读 --source research
```

---

## /create-news

创建行业新闻分析文章。

### 语法

```
/create-news <title> --category <分类> [--source <来源>]
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `title` | string | ✅ | 新闻标题/主题 |
| `--category` | string | ✅ | 目标分类（推荐：行业动态） |
| `--source` | string | ❌ | 新闻来源链接 |

### 示例

```
/create-news "OpenAI发布最新模型" --category 行业动态 --source https://openai.com/blog
```

### 输出结构

- 事件概述
- 背景分析
- 行业影响
- 专家观点
- 未来展望

---

## /create-tutorial

创建技术教程或操作指南。

### 语法

```
/create-tutorial <title> --category <分类> --level <难度级别>
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `title` | string | ✅ | 教程标题 |
| `--category` | string | ✅ | 目标分类 |
| `--level` | string | ✅ | 难度级别（beginner/intermediate/advanced） |

### 示例

```
# 初级教程
/create-tutorial "Python入门：变量与数据类型" --category 技术分享 --level beginner

# 中级教程
/create-tutorial "React Hooks深入理解" --category 技术分享 --level intermediate

# 高级教程
/create-tutorial "分布式系统一致性算法" --category 技术分享 --level advanced
```

---

## /create-report

创建行业研究报告或市场分析。

### 语法

```
/create-report <title> --category <分类> --focus <关注重点>
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `title` | string | ✅ | 报告标题 |
| `--category` | string | ✅ | 目标分类 |
| `--focus` | string | ✅ | 报告关注重点 |

### 示例

```
/create-report "2024年中国AI产业发展报告" --category 行业动态 --focus 市场规模技术趋势

/create-report "自动驾驶技术商业化进展" --category AI工业应用 --focus 量产落地成本分析
```

---

## /create-tech

创建技术深度解析文章。

### 语法

```
/create-tech <title> --category <分类> --aspect <分析维度>
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `title` | string | ✅ | 技术主题 |
| `--category` | string | ✅ | 目标分类 |
| `--aspect` | string | ✅ | 分析维度（architecture/performance/application） |

### 支持的分析维度

| 维度 | 说明 |
|------|------|
| `architecture` | 架构设计分析 |
| `performance` | 性能分析 |
| `application` | 应用场景分析 |

### 示例

```
# 架构分析
/create-tech "Kubernetes架构深度解析" --category 技术分享 --aspect architecture

# 性能分析
/create-tech "Redis性能优化策略" --category 技术分享 --aspect performance

# 应用分析
/create-tech "大模型在智能客服中的应用" --category AI工业应用 --aspect application
```

---

## /create-article

通用文章创建命令，支持多种模板。

### 语法

```
/create-article <title> --category <分类> --source <来源> [--template <模板>]
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `title` | string | ✅ | 文章标题 |
| `--category` | string | ✅ | 目标分类 |
| `--source` | string | ✅ | 内容来源 |
| `--template` | string | ❌ | 指定模板 |

### 支持的模板

- `academic` - 学术研究风格
- `news` - 新闻分析风格
- `tutorial` - 教程风格
- `report` - 报告风格
- `technical` - 技术解析风格
- `general` - 通用文章风格

### 示例

```
/create-article "Rust语言入门指南" --category 技术分享 --source manual --template tutorial

/create-article "量子计算前沿研究" --category 文献解读 --source research --template academic
```

---

## /search-content

在已生成的内容中搜索文章。

### 语法

```
/search-content <query>
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `query` | string | ✅ | 搜索关键词 |

### 示例

```
/search-content 深度学习
/search_content GPT
```

---

## /manage-categories

管理文章分类目录。

### 语法

```
/manage-categories <操作> [参数]
```

### 支持的操作

| 操作 | 说明 | 示例 |
|------|------|------|
| `list` | 列出所有分类 | `/manage-categories list` |
| `add` | 添加新分类 | `/manage-categories add "新产品"` |
| `remove` | 删除分类 | `/manage-categories remove "旧分类"` |

### 示例

```
# 列出所有分类
/manage-categories list

# 添加新分类
/manage-categories add "产品评测"

# 删除分类
/manage-categories remove "旧分类"
```

---

## 文章元数据

所有生成的文章都包含 YAML frontmatter 元数据：

```yaml
---
title: "文章标题"
category: "分类名称"
date: "2024-12-24"
source: "search|pdf|research|manual"
template: "模板类型"
tags: ["标签1", "标签2"]
estimated_read_time: "阅读时间（分钟）"
references: ["引用来源"]
---
```

## 输出位置

文章自动保存到 `wechat_doc/{category}/` 目录，文件命名格式：

```
{category}/{YYYY-MM-DD}_{sanitized_title}.md
```

示例：
```
文献解读/2024-12-24_多模态大语言模型研究进展.md
技术分享/2024-12-24_Python入门变量与数据类型.md
AI工业应用/2024-12-24_深度学习在医疗影像诊断中的应用.md
```

## 下一步

- [技能使用](./skills.md) - 了解自动技能
- [写作风格指南](./writing-style.md) - 掌握客观写作规范
- [常见问题](./faq.md) - 解决使用问题
