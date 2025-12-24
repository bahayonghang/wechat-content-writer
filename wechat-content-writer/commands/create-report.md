---
name: create-report
description: Create industry research report or market analysis article
argument-hint: "<report_title> --category=<category> --focus=<market|technology|product>"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "mcp__exa__web_search_exa", "mcp__exa__get_code_context_exa"]
---

# Create Industry Report Article

Creates a comprehensive industry research report or market analysis.

## Usage

```bash
/wechat-content-writer:create-report "<report_title>" --category=<category> --focus=<focus>
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `report_title` | Yes | Title of the report |
| `--category` | Yes | Category: "行业动态", "AI工业应用" |
| `--focus` | Yes | Report focus: "market", "technology", "product" |

## Template Structure

Generated articles follow the **Industry Report** template:

```markdown
# [Report Title: XXX Industry Research Report]

## 报告摘要
[Executive summary of key findings]

## 市场概况
- Market size and growth
- Key players and landscape
- Regional distribution

## 技术趋势
- Emerging technologies
- Innovation highlights
- Technology adoption rates

## 竞争格局
- Major companies analysis
- Market share distribution
- Competitive positioning

## 发展机遇
- Growth opportunities
- Investment areas
- Strategic recommendations

## 风险挑战
[Challenges and risk factors]

## 未来展望
- 3-5 year projections
- Key developments to watch

---
*数据来源：[Industry reports, company filings, research institutions]*
```

## Output

- **File**: `../../wechat_doc/{category}/YYYY-MM-DD_{report_title}.md`
- **Format**: Markdown with YAML frontmatter
- **Style**: Professional, data-driven, analytical

## Example

```bash
/wechat-content-writer:create-report "2024年工业AI市场发展报告" --category="行业动态" --focus="market"
```
