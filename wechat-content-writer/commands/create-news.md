---
name: create-news
description: Create industry news analysis article from web search or research
argument-hint: "<news_title> --category=<category>"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "mcp__exa__web_search_exa", "mcp__exa__get_code_context_exa"]
---

# Create News Analysis Article

Creates an industry news and trends analysis article.

## Usage

```bash
/wechat-content-writer:create-news "<news_title>" --category=<category>
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `news_title` | Yes | Title of the news topic |
| `--category` | Yes | Category: "行业动态", "AI工业应用", "技术分享" |

## Template Structure

Generated articles follow the **News Analysis** template:

```markdown
# [News Title: Industry Development and Trend Analysis]

## 背景概述
[Context and background of the news]

## 事件详情
- Key facts and developments
- Timeline of events
- Major stakeholders involved

## 影响分析
- Industry impact assessment
- Market response and reactions
- Potential consequences

## 专家观点
[Expert opinions and analysis]

## 未来展望
- Expected developments
- Challenges and opportunities

---
*数据来源：[News sources and references]*
```

## Output

- **File**: `../../wechat_doc/{category}/YYYY-MM-DD_{news_title}.md`
- **Format**: Markdown with YAML frontmatter
- **Style**: Objective, factual, balanced

## Example

```bash
/wechat-content-writer:create-news "2024年AI芯片市场发展新趋势" --category="行业动态"
```
