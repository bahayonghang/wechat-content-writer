---
name: create-tech
description: Create in-depth technical analysis article for technologies or frameworks
argument-hint: "<tech_title> --category=<category> --aspect=<architecture|implementation|optimization>"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "mcp__exa__web_search_exa", "mcp__exa__get_code_context_exa"]
---

# Create Technical Analysis Article

Creates an in-depth technical analysis article for technologies, frameworks, or systems.

## Usage

```bash
/wechat-content-writer:create-tech "<tech_title>" --category=<category> --aspect=<aspect>
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `tech_title` | Yes | Title of the technology analysis |
| `--category` | Yes | Category: "AI-Coding", "技术分享", "AI工业应用" |
| `--aspect` | Yes | Focus aspect: "architecture", "implementation", "optimization" |

## Template Structure

Generated articles follow the **Technical Analysis** template:

```markdown
# [Tech Title: Analysis of XXX Technology]

## 技术概述
- Definition and core concepts
- Development history
- Current state of the art

## 架构设计
- System architecture analysis
- Core components and modules
- Data flow and interactions

## 实现细节
- Key algorithms and techniques
- Code structure and patterns
- Performance characteristics

## 最佳实践
- Design patterns used
- Optimization techniques
- Common pitfalls to avoid

## 对比分析
- Comparison with alternatives
- Advantages and disadvantages
- Use case scenarios

## 应用场景
[Practical applications and case studies]

## 总结评价
- Technical merits
- Adoption considerations
- Future development trends

---
*技术栈：[Related technologies and frameworks]*
```

## Output

- **File**: `../../wechat_doc/{category}/YYYY-MM-DD_{tech_title}.md`
- **Format**: Markdown with YAML frontmatter
- **Style**: Technical, precise, analytical

## Example

```bash
/wechat-content-writer:create-tech "大语言模型推理优化技术深度解析" --category="AI-Coding" --aspect="optimization"
```
