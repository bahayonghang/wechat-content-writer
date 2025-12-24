---
layout: home

hero:
  name: "WeChat Content Writer"
  text: "专业的微信公众号内容创作插件"
  tagline: "文献搜索 · PDF分析 · 自动化文章生成 · 客观专业写作"
  image:
    src: /logo.svg
    alt: WeChat Content Writer
  actions:
    - theme: brand
      text: 快速开始
      link: /guide/getting-started
    - theme: alt
      text: 功能特性
      link: /features
    - theme: alt
      text: GitHub
      link: https://github.com/bahayonghang/wechat-content-writer

features:
  - icon: 🔍
    title: 学术文献搜索
    details: 集成 arXiv、Google Scholar 等学术资源，一键搜索相关论文和研究成果。
  - icon: 📄
    title: PDF 智能分析
    details: 自动解析 PDF 文档，提取关键信息，生成专业客观的技术解读。
  - icon: ✍️
    title: 多模板文章生成
    features:
      - 学术论文解读
      - 行业新闻分析
      - 技术教程创作
      - 行业研究报告
      - 技术深度解析
  - icon: 🎯
    title: 客观专业写作
    details: 坚持第三人称视角，数据驱动表述，避免标题党和 AI 味语言。
  - icon: 📁
    title: 自动文件组织
    details: 按日期和分类自动命名管理，支持自定义分类和目录结构。
  - icon: 🤖
    title: AI 驱动工作流
    details: 基于 Claude Code 的智能代理，支持复杂任务编排和深度优化。
---

## 使用场景

### 学术研究者
快速检索最新论文，自动生成学术解读文章

### 技术博主
基于论文和技术文档，创作深度技术分析内容

### 行业分析师
整合行业资讯，生成专业的行业研究报告

### 内容创作者
提高创作效率，保证内容的专业性和客观性

## 技术架构

```mermaid
graph TB
    subgraph "用户交互层"
        A[Claude Code CLI]
        B[Slash Commands]
        C[Auto-Skills]
        D[AI Agents]
    end

    subgraph "插件核心层"
        E[Command Handlers]
        F[Skill Triggers]
        G[Agent Logic]
    end

    subgraph "服务层"
        H[Search Server]
        I[MCP Web Search]
    end

    subgraph "数据层"
        J[arXiv API]
        K[Google Scholar]
        L[Web Content]
    end

    A --> E
    A --> F
    A --> G
    E --> H
    F --> H
    G --> H
    H --> I
    I --> J
    I --> K
    I --> L
```

## 快速体验

<div class="language-bash vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">bash</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;"># 1. 安装依赖</span></span>
<span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#6F42C1;">cd</span><span style="--shiki-light:#032F62;--shiki-dark:#C9D1D9;"> wechat-content-writer</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> &&</span><span style="--shiki-light:#032F62;--shiki-dark:#C9D1D9;"> npm install</span></span>
<span class="line"></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;"># 2. 启动搜索服务</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#C9D1D9;">npm start</span></span>
<span class="line"></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;"># 3. 在 Claude Code 中使用</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#C9D1D9;">/create-paper "多模态大语言模型研究" --category 文献解读</span></span></code></pre></div>

## 统计数据

| 项目 | 数量 |
|------|------|
| 命令 | 9 个 |
| 技能 | 3 个 |
| AI 代理 | 1 个 |
| 文章模板 | 6 种 |
| 内容分类 | 5 类 |

## 许可证

[MIT License](https://opensource.org/licenses/MIT)
