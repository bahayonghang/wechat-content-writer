---
name: init-workspace
description: Initialize a workspace for iterative article writing with organized file structure
argument-hint: "<article_name>"
allowed-tools: ["Write", "Bash"]
---

# Initialize Writing Workspace Command

## Purpose

为迭代式文章创作初始化专门的工作区，创建标准化的文件组织结构，用于保存大纲、研究资料、草稿版本和反馈记录。

## Usage

```bash
/wechat-content-writer:init-workspace "<article_name>"
```

### Arguments

- **article_name** (required): 工作区名称（建议使用英文和下划线，如 `transformer_optimization`）

### Examples

```bash
# 创建Transformer优化文章的工作区
/wechat-content-writer:init-workspace "transformer_optimization"

# 创建Docker教程的工作区
/wechat-content-writer:init-workspace "docker_multistage_build"

# 创建学术论文解读的工作区
/wechat-content-writer:init-workspace "feo_concentration_prediction"
```

## What It Creates

### Directory Structure

```
../../wechat_writing_workspace/[article_name]/
├── outline.md              # 文章大纲
├── research.md             # 研究资料汇总
├── draft-v1.md             # 第一版草稿
├── feedback.md             # 反馈记录
├── final.md                # 最终版本（待发布）
├── sources/                # 参考资料目录
│   └── .gitkeep
└── README.md               # 工作区说明
```

### File Templates

#### `outline.md`
```markdown
# Article Outline: [填写文章标题]

> Created: [自动填入日期]
> Status: In Progress
> Category: [待定]
> Writing Mode: [待定 - objective_professional / collaborative_personal]

## Hook Strategy
- Type: [Data-driven / Question / Story]
- Opening: [待填写]
- Why reader should care: [待填写]

## Main Sections

### Section 1: [标题]
- [要点]
- [Research needed: 待补充]

[更多sections...]

## Research To-Do
- [ ] [研究任务1]
- [ ] [研究任务2]

---

**Next Steps:**
1. Complete outline with collaborative-outline skill
2. Fill research gaps with literature-research
3. Start drafting section by section
```

#### `research.md`
```markdown
# Research Materials: [Article Name]

> Last Updated: [自动填入日期]

## 📚 Literature Sources

### Source 1: [论文/报告标题]
- **Type**: Academic Paper / Industry Report / Technical Documentation
- **URL**: [链接]
- **Key Findings**:
  - [要点1]
  - [要点2]
- **Relevance**: [与文章的关联性]
- **Citations**: [引用格式]

### Source 2: [...]

## 📊 Data & Statistics

| Metric | Value | Source |
|--------|-------|--------|
| [指标1] | [数值] | [来源] |

## 💡 Key Insights

- [洞察1]
- [洞察2]

## 🔗 Additional Resources

- [资源链接1]
- [资源链接2]

---
*Research collected via: literature-research, search-content, pdf-analysis*
```

#### `draft-v1.md`
```markdown
---
title: "[待填写标题]"
category: "[待定]"
date: "[自动填入]"
version: "draft-v1"
writing_mode: "[待定]"
status: "in_progress"
---

# [文章标题]

## [Section 1]

[开始写作...]

<!-- 
浮浮酱提示：
- 写完每个section后，可以请求 content-writer agent 提供反馈
- 使用 /optimize-hook 优化开头部分
- 记得保存进度到不同版本
-->

---

*Draft Status: [待完成sections数量]*
*Next Section: [下一个要写的section]*
```

#### `feedback.md`
```markdown
# Feedback History: [Article Name]

> Started: [自动填入日期]

## Feedback Log

### 2025-XX-XX - Initial Outline
**Feedback Type**: Outline Review
**Status**: [Completed / Pending Revision]

[反馈内容将自动添加...]

---

### 2025-XX-XX - Section 1: [Section Name]
**Feedback Type**: Section Review
**Score**: XX/50
**Status**: [Completed / Needs Revision]

[反馈内容...]

**Revision Log**:
- Rev 1 (XX:XX): [修改说明]

---

[更多反馈将自动添加...]
```

#### `README.md`
```markdown
# Writing Workspace: [Article Name]

> Created: [日期]
> Status: 🚧 In Progress

## 📋 Workflow Checklist

### Phase 1: Planning ✓
- [ ] Create outline (use `/collaborative-outline`)
- [ ] Identify research needs
- [ ] Define target audience
- [ ] Select writing mode

### Phase 2: Research
- [ ] Literature search (use `/literature-research` or `/search-content`)
- [ ] Collect key data and statistics
- [ ] Analyze source materials
- [ ] Update research.md

### Phase 3: Drafting
- [ ] Write Section 1 → Get feedback
- [ ] Write Section 2 → Get feedback
- [ ] Write Section 3 → Get feedback
- [... more sections]
- [ ] Complete first draft

### Phase 4: Optimization
- [ ] Optimize hook (use `/optimize-hook`)
- [ ] Review full draft with content-writer agent
- [ ] Check citations and references
- [ ] Proofread and polish

### Phase 5: Finalization
- [ ] Create final version
- [ ] Add metadata
- [ ] Publish to wechat_doc/
- [ ] Archive workspace

## 📂 Files Overview

| File | Purpose | Status |
|------|---------|--------|
| `outline.md` | Article structure | 📝 Draft |
| `research.md` | Source materials | 📚 Collecting |
| `draft-v1.md` | First draft | ✍️ Writing |
| `feedback.md` | Feedback history | 📋 Logging |
| `final.md` | Publication version | ⏳ Pending |

## 🔄 Workflow Tips

浮浮酱的使用提示喵～ ฅ'ω'ฅ

1. **Outline First**: 先用 `/collaborative-outline` 创建大纲
2. **Iterative Writing**: 每写完一个section就获取反馈
3. **Version Control**: 重大修改时创建新版本（draft-v2.md）
4. **Feedback History**: 所有反馈自动保存到 feedback.md
5. **Final Polish**: 使用 `/optimize-hook` 优化开头

## 🚀 Quick Commands

```bash
# 创建/更新大纲
/collaborative-outline

# 补充研究资料
/literature-research [topic]
/search-content [query]

# 优化Hook
/optimize-hook "draft-v1.md"

# 发布到正式目录
/publish-from-workspace "[article_name]" --category="[category]"
```

## 📊 Progress Tracking

- **Started**: [日期]
- **Target Completion**: [日期]
- **Current Phase**: Planning / Research / Drafting / Optimization / Final
- **Completion**: XX%

---
*Workspace created by wechat-content-writer plugin*
```

## Execution Process

### Step 1: Validate Workspace Name

检查工作区名称合法性：
- 只包含字母、数字、下划线、连字符
- 长度在3-50字符之间
- 不与现有工作区冲突

```
✓ Valid: "transformer_optimization", "docker-tutorial", "ai_ethics_2024"
✗ Invalid: "我的文章", "test!", "a"
```

### Step 2: Create Directory Structure

创建工作区目录和所有必要文件：

```bash
mkdir -p "../../wechat_writing_workspace/{article_name}"
mkdir -p "../../wechat_writing_workspace/{article_name}/sources"

# 创建各个模板文件
touch outline.md research.md draft-v1.md feedback.md final.md README.md
```

### Step 3: Initialize Template Files

使用上述模板内容填充各个文件，自动替换变量：
- `[article_name]` → 用户提供的名称
- `[自动填入日期]` → 当前日期（YYYY-MM-DD）
- `[自动填入时间]` → 当前时间（HH:MM）

### Step 4: Confirm and Guide Next Steps

输出成功信息并引导用户：

```markdown
# ✅ Workspace Created Successfully!

浮浮酱已经为主人创建好工作区啦～ ヽ(✿ﾟ▽ﾟ)ノ

## 📂 Workspace Location
`../../wechat_writing_workspace/{article_name}/`

## 📋 Created Files
✓ outline.md - 文章大纲模板
✓ research.md - 研究资料汇总
✓ draft-v1.md - 第一版草稿
✓ feedback.md - 反馈历史记录
✓ final.md - 最终发布版本
✓ sources/ - 参考资料目录
✓ README.md - 工作区使用指南

## 🚀 Recommended Next Steps

### Step 1: Create Outline (推荐第一步)
```bash
/collaborative-outline
```
浮浮酱会帮主人创建结构化的文章大纲喵～

### Step 2: Gather Research
```bash
/literature-research "[topic]"
# or
/search-content "[query]"
```
根据大纲中的研究需求，补充资料

### Step 3: Start Writing
直接开始写 draft-v1.md，每完成一个section就请浮浮酱review喵～

### Alternative: Quick Setup Wizard
想要浮浮酱引导主人完成初始设置吗？
[Yes] → 开始交互式设置向导
[No] → 主人可以自己开始创作

---

**提示**: 所有文件都已经准备好模板了，主人可以直接编辑使用喵～ (´。• ᵕ •。`) ♡
```

## Integration Features

### With Collaborative Outline

如果用户在工作区中使用 `/collaborative-outline`：
- 自动保存大纲到 `outline.md`
- 自动提取研究需求到 `research.md`
- 更新 README.md 中的进度

### With Section Feedback

当 content-writer agent 提供section反馈时：
- 自动追加到 `feedback.md`
- 记录时间戳和section名称
- 跟踪修订历史

### With Hook Optimization

当使用 `/optimize-hook` 时：
- 自动备份原始版本
- 保存优化历史到 `feedback.md`
- 更新draft文件

## Workspace Management

### Version Creation

用户可以手动创建新版本：
```bash
cp draft-v1.md draft-v2.md
```

或使用专门命令（如果实现）：
```bash
/create-version "draft-v1.md"
# 自动创建 draft-v2.md
```

### Workspace Status

查看工作区状态：
```bash
/workspace-status "{article_name}"
```

输出：
```markdown
# Workspace Status: {article_name}

## Progress
- Phase: Drafting (60%)
- Sections completed: 3/5
- Feedback sessions: 4
- Last updated: 2025-12-28 15:30

## Files
- outline.md: ✓ Complete
- research.md: ✓ 5 sources collected
- draft-v1.md: 📝 In progress (60%)
- feedback.md: 📋 4 entries
- final.md: ⏳ Not started

## Next Actions
- [ ] Complete Section 4
- [ ] Get feedback on Section 4
- [ ] Write Section 5
```

### Publishing from Workspace

完成后发布到正式目录：
```bash
/publish-from-workspace "{article_name}" --category="技术分享"
```

流程：
1. 读取 `final.md` (或 `draft-vX.md`)
2. 添加必要的metadata
3. 复制到 `../../wechat_doc/{category}/{date}_{title}.md`
4. 可选：归档工作区到 `.archived/`

## Best Practices

浮浮酱的最佳实践建议喵～ φ(≧ω≦*)♪

### 1. Start with Outline
- 先创建清晰的大纲再开始写作
- 大纲可以随时调整，不要怕修改

### 2. Iterative Feedback
- 每完成一个section就获取反馈
- 不要等到全文完成才review

### 3. Version Control
- 重大修改前创建新版本
- 保留历史版本以便回溯

### 4. Organize Research
- 所有参考资料都整理到 research.md
- PDF等文件放到 sources/ 目录

### 5. Track Feedback
- 认真对待每次反馈
- 在 feedback.md 中记录自己的思考和改进

## Configuration

工作区行为由 config.json 控制：

```json
{
  "workspace_mode": {
    "enabled": true,           // 是否启用工作区功能
    "auto_create": false,      // 是否自动创建（默认需要明确调用）
    "location": "../../wechat_writing_workspace",
    "structure": {
      "outline": "outline.md",
      "research": "research.md",
      "drafts": "draft-v{number}.md",
      "feedback": "feedback.md",
      "final": "final.md",
      "sources": "sources/"
    }
  }
}
```

## Troubleshooting

### 工作区已存在
```
Error: Workspace "{article_name}" already exists.
Options:
1. Use a different name
2. Delete existing workspace: rm -rf "../../wechat_writing_workspace/{article_name}"
3. Resume working in existing workspace
```

### 权限问题
```
Error: Cannot create directory. Check permissions.
Solution: Ensure you have write permissions to ../../wechat_writing_workspace/
```

---

*This command creates a professional workspace for iterative, collaborative article writing with proper version control and feedback tracking.*
