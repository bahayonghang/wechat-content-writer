---
name: create-paper
description: Create academic paper review article from PDF or literature search
argument-hint: "<paper_title> --category=<category> [--url=<pdf_url>]"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "mcp__exa__web_search_exa", "mcp__exa__get_code_context_exa"]
---

# Create Paper Review Article

Creates a professional academic paper review article with objective technical analysis.

## Usage

```bash
/wechat-content-writer:create-paper "<paper_title>" --category=<category> [--url=<pdf_url>]
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `paper_title` | Yes | Title of the academic paper |
| `--category` | Yes | Category: "文献解读", "AI工业应用", "AI-Coding", "技术分享" |
| `--url` | No | Direct URL to the PDF paper (optional) |

## Template Structure

Generated articles follow the **Academic Research** template:

```markdown
# [Technical Title: Research on XXX Based on XXX]

## 摘要
[Brief summary (200-300 words)]

## 研究背景
- Industry status and technical challenges
- Limitations of existing solutions

## 技术方法
- System architecture and core principles
- Key technologies and algorithms

## 实验结果
- Performance comparison data
- Key indicators analysis

## 应用价值
- Practical application scenarios
- Economic benefit analysis

## 结论与展望
- Main findings summary
- Future development directions

---
*来源：[Paper citation]*
```

## Output

- **File**: `../../wechat_doc/{category}/YYYY-MM-DD_{paper_title}.md`
- **Format**: Markdown with YAML frontmatter
- **Style**: Objective, third-person, technical

## Example

```bash
/wechat-content-writer:create-paper "基于多模态融合的FeO浓度实时预测技术研究" --category="文献解读"
```
