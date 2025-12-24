---
name: create-tutorial
description: Create technical tutorial or how-to guide article
argument-hint: "<tutorial_title> --category=<category> --level=<beginner|intermediate|advanced>"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "mcp__exa__web_search_exa", "mcp__exa__get_code_context_exa"]
---

# Create Tutorial Article

Creates a step-by-step technical tutorial or how-to guide.

## Usage

```bash
/wechat-content-writer:create-tutorial "<tutorial_title>" --category=<category> --level=<level>
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `tutorial_title` | Yes | Title of the tutorial |
| `--category` | Yes | Category: "AI-Coding", "技术分享" |
| `--level` | Yes | Target level: "beginner", "intermediate", "advanced" |

## Template Structure

Generated articles follow the **Tutorial** template:

```markdown
# [Tutorial Title: Practical Guide for XXX]

## 教程简介
- What you will learn
- Prerequisites and requirements
- Expected completion time

## 准备工作
- Environment setup
- Required tools and dependencies
- Initial configuration

## 步骤一：基础准备
[Step-by-step instructions]

## 步骤二：核心实现
[Step-by-step instructions]

## 步骤三：实践应用
[Step-by-step instructions]

## 常见问题
- FAQ and troubleshooting
- Common errors and solutions

## 总结
- Key takeaways
- Next steps for further learning

---
*难度等级：[Beginner/Intermediate/Advanced]*
```

## Output

- **File**: `../../wechat_doc/{category}/YYYY-MM-DD_{tutorial_title}.md`
- **Format**: Markdown with YAML frontmatter
- **Style**: Clear, instructional, practical

## Example

```bash
/wechat-content-writer:create-tutorial "Claude Code插件开发入门指南" --category="AI-Coding" --level="beginner"
```
