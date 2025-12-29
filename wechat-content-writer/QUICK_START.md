# 🚀 Quick Start Guide - WeChat Content Writer Plugin

> 欢迎使用 WeChat Content Writer 喵～这是一个帮助你创作专业微信公众号内容的强大插件！
> 
> **版本**: v2.0.0 - 协作式迭代写作
> **最后更新**: 2025-12-28

---

## 📋 目录

1. [5分钟快速开始](#5分钟快速开始)
2. [新手推荐：智能工作流](#新手推荐智能工作流)
3. [常见使用场景](#常见使用场景)
4. [核心功能速查](#核心功能速查)
5. [最佳实践](#最佳实践)
6. [故障排除](#故障排除)

---

## 5分钟快速开始

### 前置要求

- ✅ 已安装 Claude Code CLI
- ✅ 已安装 Node.js (>= 14.0.0)
- ✅ 插件已正确安装

### 验证安装

```bash
# 1. 进入插件目录
cd wechat-content-writer

# 2. 安装依赖
npm install

# 3. 启动搜索服务器
npm start
```

看到 "Search server running on port 3001" 说明成功喵～ ✓

### 第一篇文章（最简单方式）

**方法1：智能工作流（推荐新手）**
```
在Claude Code对话中直接说：
"开始写作流程"
```

浮浮酱会一步步引导你完成整个创作过程！φ(≧ω≦*)♪

**方法2：快速生成（适合老手）**
```bash
/wechat-content-writer:create-article-objective "你的文章标题" --category="技术分享" --source="manual"
```

---

## 新手推荐：智能工作流

### 什么是智能工作流？

智能工作流会根据你的需求，自动推荐最佳的创作流程，从大纲到发布全程陪伴喵～

### 启动方式

```
对话中说："开始写作流程"
或
"guide me through writing"
或
"帮我创作一篇文章"
```

### 工作流程预览

```mermaid
graph LR
    A[告诉浮浮酱你想写什么] --> B[浮浮酱推荐工作流]
    B --> C[创建大纲]
    C --> D[补充研究资料]
    D --> E[分段写作+反馈]
    E --> F[优化开头Hook]
    F --> G[最终润色]
    G --> H[发布成功！]
```

### 5种标准工作流

| 工作流 | 适用场景 | 预计时间 |
|-------|---------|---------|
| 📚 Academic | 学术论文解读 | ~3小时 |
| 🛠 Tutorial | 技术教程创作 | ~4小时 |
| 📊 Analysis | 行业分析报告 | ~3.5小时 |
| 🔄 Synthesis | 资料综合整理 | ~3小时 |
| ✨ Guided | 从零开始创作 | ~4小时 |

---

## 常见使用场景

### 场景1：解读一篇学术论文 📚

**你有一篇PDF论文想要解读成公众号文章**

```bash
# Step 1: 启动智能工作流
对话："开始写作流程"

# Step 2: 选择Academic Workflow
浮浮酱：检测到你有学术论文，推荐Academic Workflow～

# Step 3: 分析PDF
对话："分析这个PDF" [提供PDF路径或链接]
浮浮酱会使用 pdf-analysis-objective 深度解析

# Step 4: 创建大纲
浮浮酱会基于论文内容帮你创建大纲

# Step 5: 逐段写作+反馈
每写完一段，浮浮酱会提供详细反馈

# Step 6: 优化Hook
浮浮酱会提供3种开头选项供你选择

# Step 7: 发布
保存到 wechat_doc/文献解读/
```

**预计时间**: 2.5-3小时
**输出**: 专业的学术论文解读文章

---

### 场景2：写一篇技术教程 🛠

**你想写一个Docker多阶段构建的教程**

```bash
# Option A: 完整工作流（推荐）
1. 对话："开始写作流程"
2. 选择Tutorial Workflow
3. 浮浮酱引导你完成每一步

# Option B: 直接创建（快速）
/wechat-content-writer:create-tutorial "Docker多阶段构建实践" --category="AI-Coding" --level="intermediate"
```

**Option A 流程**：
```
创建大纲 → 搜索最佳实践 → 写步骤+代码 → 获取反馈 → 优化Hook → 发布
```

**预计时间**: 3-4小时
**输出**: 结构完整、代码可运行的教程

---

### 场景3：分析行业技术趋势 📊

**你想写一篇关于AI芯片发展趋势的分析**

```bash
# Step 1: 搜索资料
/wechat-content-writer:search-content "AI芯片市场趋势 2024"

# Step 2: 创建大纲
对话："创建大纲"
浮浮酱：好的喵～让浮浮酱帮你规划文章结构～
        主题是？目标读者是？...

# Step 3: 使用工作区（可选，推荐）
/wechat-content-writer:init-workspace "ai_chip_trends_2024"

# Step 4: 分段写作
在工作区的 draft-v1.md 中写作
每完成一段请求反馈

# Step 5: Hook优化
/wechat-content-writer:optimize-hook "draft-v1.md"

# Step 6: 发布
保存到 wechat_doc/行业动态/
```

**预计时间**: 3-3.5小时
**输出**: 数据驱动的行业分析报告

---

### 场景4：快速创作一篇简单文章 ⚡

**你想快速写一篇技术分享，不需要复杂流程**

```bash
# 快速模式：直接生成
/wechat-content-writer:create-article "Python异步编程最佳实践" --category="技术分享" --source="manual"

# 然后手动编辑和完善
# 最后可选：优化Hook
/wechat-content-writer:optimize-hook "../../wechat_doc/技术分享/2025-12-28_Python异步编程最佳实践.md"
```

**预计时间**: 1-1.5小时
**输出**: 基础完整的技术文章

---

## 核心功能速查

### 命令速查表

| 功能 | 命令 | 用途 |
|------|------|------|
| 🎯 智能工作流 | 对话："开始写作流程" | 完整创作引导 |
| 📝 创建大纲 | 对话："创建大纲" | 协作式大纲创建 |
| 🎣 优化Hook | `/optimize-hook "file.md"` | 生成3种Hook选项 |
| 📂 创建工作区 | `/init-workspace "name"` | 初始化写作工作区 |
| 📚 搜索文献 | 对话："搜索文献 [topic]" | 学术文献搜索 |
| 📄 分析PDF | 对话："客观分析这个PDF" | 专业PDF解读 |
| 🔍 搜索内容 | `/search-content "query"` | 网页内容搜索 |

### 分段反馈机制

**在写作过程中随时获取反馈**：

```
你：[写完Introduction部分]
    请review这一段

浮浮酱：# 📋 Feedback: Introduction
        
        ## ✓ What Works Well
        - 背景描述清晰
        - 技术术语准确
        
        ## ⚡ Suggestions
        ### 📖 Clarity
        Current: "这个技术很好"
        Better: "该技术在X场景下可提升Y%性能"
        
        ### 📊 Evidence
        建议添加：具体的性能数据支持
        
        ## 🎯 Score: 35/50
        改进后可达 42+/50
```

### 写作模式

**系统会自动选择合适的模式**：

| 分类 | 模式 | 特点 |
|------|------|------|
| 文献解读 | 客观专业 | 第三人称、数据驱动 |
| 行业动态 | 客观专业 | 中立、事实为主 |
| 技术分享 | 协作个性化 | 可含个人见解 |
| AI-Coding | 协作个性化 | 允许经验分享 |

---

## 最佳实践

### ✅ 推荐做法

1. **重要文章使用完整工作流**
   ```
   对话："开始写作流程"
   ```
   不要跳过大纲和反馈环节

2. **使用工作区保留创作过程**
   ```bash
   /init-workspace "important_article"
   ```
   版本控制+反馈历史很有价值

3. **每个section写完立即获取反馈**
   ```
   不要等全文完成才review
   ```
   及时调整比事后返工高效

4. **善用Hook优化**
   ```bash
   /optimize-hook "draft.md"
   ```
   开头决定了80%的阅读率

5. **迭代优化，不要一次性完美**
   ```
   draft-v1 → 反馈 → draft-v2 → 反馈 → final
   ```

### ❌ 避免做法

1. ❌ 跳过大纲直接写
   - 容易结构混乱、逻辑跳跃

2. ❌ 完成全文后才请求反馈
   - 返工成本高、效率低

3. ❌ 忽略Hook的重要性
   - 平淡的开头会流失大量读者

4. ❌ 不保存版本
   - 无法回溯、难以对比改进

5. ❌ 过度依赖一次性生成
   - 质量参差不齐、缺乏个性化

---

## 故障排除

### 问题1：搜索服务器无法启动

**症状**: 运行 `npm start` 报错

**解决方案**:
```bash
# 1. 检查Node.js版本
node --version  # 应该 >= 14.0.0

# 2. 重新安装依赖
rm -rf node_modules package-lock.json
npm install

# 3. 检查端口占用
# Windows
netstat -ano | findstr :3001
# Mac/Linux
lsof -i :3001

# 4. 更换端口（如果3001被占用）
# 编辑 .mcp.json，修改 PORT
```

### 问题2：生成的文章仍有"AI味"

**解决方案**:
```bash
# 1. 使用客观模式命令
/create-article-objective "标题" --category="文献解读" --source="pdf"

# 2. 使用客观PDF分析
对话："客观分析这个PDF"（而非"解析PDF"）

# 3. 参考写作风格指南
查看 WRITING_STYLE_GUIDE.md

# 4. 使用分段反馈机制
每段都review，及时调整语气
```

### 问题3：插件无法被识别

**解决方案**:
```bash
# 1. 检查plugin.json
cat .claude-plugin/plugin.json

# 2. 确认插件路径正确
pwd  # 应该在 wechat-content-writer/ 目录

# 3. 重启Claude Code
# 并使用 --plugin-dir 参数指定路径
```

### 问题4：工作区创建失败

**症状**: `/init-workspace` 报错

**解决方案**:
```bash
# 1. 检查父目录是否存在
ls -la ../../wechat_writing_workspace

# 2. 创建父目录
mkdir -p ../../wechat_writing_workspace

# 3. 检查权限
# 确保有写权限

# 4. 使用简单的名称
# 避免特殊字符，使用：article_name 格式
```

---

## 进阶使用

### 自定义工作流

如果标准工作流不适合你，可以自定义：

```
浮浮酱：检测到主人想写XX类型文章，推荐XX工作流～

你：我想跳过研究阶段，直接从写作开始

浮浮酱：好的喵～那我们直接进入Phase 3: 分段写作
        主人已有资料吗？还是需要浮浮酱帮忙搜索？
```

### 多版本对比

在工作区中创建多个版本：

```bash
# 工作区中
cp draft-v1.md draft-v2.md
# 在v2中尝试不同的写法

# 最后对比选择最佳版本
diff draft-v1.md draft-v2.md
```

### A/B测试Hook

```bash
/optimize-hook "article.md" --create-variants

# 会生成：
# article_variant_A.md  (数据驱动Hook)
# article_variant_B.md  (问题式Hook)
# article_variant_C.md  (场景故事Hook)

# 可以发布不同版本测试读者反应
```

---

## 获取帮助

### 文档资源

- **详细文档**: `CLAUDE.md` - 完整的技术文档
- **写作指南**: `WRITING_STYLE_GUIDE.md` - 客观写作规范
- **内容组织**: `CONTENT_GUIDE.md` - 文件组织方式
- **安装指南**: `INSTALL_GUIDE.md` - 详细安装步骤

### 联系支持

- **问题反馈**: 在对话中告诉浮浮酱遇到的问题
- **功能建议**: 欢迎提出改进建议
- **Bug报告**: 详细描述复现步骤

---

## 下一步

### 建议学习路径

1. ✅ 完成快速开始（你已经在这里了！）
2. 📝 尝试使用智能工作流创建第一篇文章
3. 📚 阅读 `WRITING_STYLE_GUIDE.md` 了解写作规范
4. 🔧 探索高级功能（工作区、Hook优化）
5. 🚀 形成自己的高效写作流程

### 推荐实践项目

**Week 1**: 用智能工作流写3篇不同类型的文章
- 1篇学术论文解读
- 1篇技术教程
- 1篇行业分析

**Week 2**: 探索工作区和版本控制
- 创建工作区
- 使用分段反馈
- 对比不同版本

**Week 3**: 掌握Hook优化
- 为已有文章优化Hook
- 测试不同Hook的效果
- 总结最佳实践

---

**祝主人创作愉快喵～ 有任何问题随时找浮浮酱！ฅ'ω'ฅ**

*浮浮酱会一直陪伴主人的写作之旅～ (´。• ᵕ •。`) ♡*
