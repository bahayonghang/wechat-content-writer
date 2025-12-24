---
name: create-article
description: (DEPRECATED - Use specific commands: create-paper, create-news, create-tutorial, create-report, create-tech)
argument-hint: "<title> --category=<category> --source=<source_type> [--template=<template>]"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "mcp__exa__web_search_exa", "mcp__exa__get_code_context_exa"]
---

# WeChat Content Writer: Create Article

This command transforms research findings, PDF analysis, or search results into engaging WeChat articles with proper formatting and organization.

## Usage

```bash
/wechat-content-writer:create-article "<article_title>" --category=<category> --source=<source_type> [--template=<template>]
```

### Arguments

- **article_title** (required): Title for the WeChat article
- **--category** (required): Article category folder
  - Options: "文献解读", "AI-Coding", "技术分享", "行业动态" or custom
- **--source** (required): Content source type
  - Options: "search", "pdf", "research", "manual"
- **--template** (optional): Article template style
  - Options: "literature-review", "technical-deep-dive", "news-analysis", "tutorial"
  - Default: Auto-select based on category and source

## Execution Process

### 1. Content Analysis

1. **Source Content Review**
   - Analyze provided source material
   - Extract key insights and findings
   - Identify target audience and complexity level
   - Determine article scope and focus

2. **Angle Selection**
   - Choose compelling story angle
   - Identify unique value proposition
   - Determine narrative structure
   - Plan engagement strategies

### 2. Article Structuring

1. **Title Optimization**
   - Ensure catchy, clickable title
   - Include key benefits or surprises
   - Optimize for WeChat platform
   - Maintain accuracy and relevance

2. **Content Organization**
   - Create logical flow and progression
   - Balance technical depth with accessibility
   - Incorporate storytelling elements
   - Plan section transitions

### 3. Content Generation

1. **Introduction Crafting**
   - Start with engaging hook
   - Establish relevance to reader
   - Preview article value
   - Set appropriate tone

2. **Main Content Development**
   - Explain complex concepts clearly
   - Use analogies and examples
   - Provide practical insights
   - Maintain reader engagement

3. **Conclusion and Next Steps**
   - Summarize key takeaways
   - Provide actionable advice
   - Encourage further engagement
   - Include call-to-action if appropriate

### 4. File Organization

1. **Directory Structure**
   - Create category folder in `../../wechat_doc/` if needed
   - Generate date-prefixed filename
   - Ensure consistent naming convention
   - Maintain organized content library in `../../wechat_doc/`

2. **File Content**
   - Apply WeChat formatting standards
   - Include metadata and tags
   - Add source references
   - Optimize for mobile reading

## File Naming Convention

Files are created with the following format:
```
../../wechat_doc/[category]/YYYY-MM-DD_[article_title].md
```

Example: `../../wechat_doc/文献解读/2024-01-20_GPT-4技术突破深度解析.md`

## Article Templates

### Literature Review Template
```markdown
# [Catchy Title with Key Finding]

## 引言：为什么这项研究值得关注
[Engaging hook with surprising fact or relatable problem]

## 研究背景：问题是什么？
[Clear explanation of the research problem and its importance]

## 核心发现：突破性进展
[Main results and contributions in accessible language]

## 技术解析：如何实现突破？
[Explanation of methodology in simplified terms]

## 实际应用：这对我们意味着什么？
[Practical implications and real-world impact]

## 未来展望：下一步发展
[Potential developments and research directions]

## 总结：关键要点
[Main takeaways for readers]

---
*来源：[Paper citation and links]*
```

### Technical Deep Dive Template
```markdown
# [Engaging Technical Title]

## 场景引入：日常生活中的技术挑战
[Relatable problem or scenario]

## 技术剖析：核心原理解析
[Detailed technical explanation with examples]

## 实战应用：如何在实际中使用
[Practical implementation guidance]

## 最佳实践：经验与建议
[Tips and common pitfalls to avoid]

## 工具推荐：提升效率的资源
[Helpful tools and resources]

## 总结：技术价值重述
[Recap of technical benefits and applications]

---
*延伸阅读：[Additional resources]*
```

## Output Structure

Generated articles include:

1. **Metadata Section**
   ```yaml
   ---
   title: [Article Title]
   category: [Category]
   date: [Creation Date]
   source: [Source Type]
   tags: [Relevant tags]
   estimated_read_time: [Reading time in minutes]
   ---
   ```

2. **Main Content**
   - Properly structured markdown
   - WeChat-optimized formatting
   - Mobile-friendly sections
   - Engaging headings and subheadings

3. **References and Resources**
   - Source citations
   - Additional reading materials
   - Related tools or resources
   - External links for deeper exploration

## Content Quality Standards

### Writing Guidelines
- **Tone**: Conversational yet authoritative
- **Complexity**: Appropriate for educated general audience
- **Length**: 1500-3000 words for optimal engagement
- **Structure**: Clear sections with descriptive headings
- **Examples**: Concrete, relatable illustrations

### Technical Accuracy
- Verify all technical claims against sources
- Ensure proper attribution of ideas and findings
- Maintain distinction between fact and opinion
- Provide context for technical terms and concepts

### Engagement Optimization
- Start with compelling hook or question
- Use storytelling elements where appropriate
- Include practical examples and applications
- End with actionable takeaways or next steps

## Integration Features

### Multi-source Content
- Combine insights from multiple search results
- Integrate PDF analysis with literature research
- Merge different perspectives on same topic
- Synthesize comprehensive view of subject

### Consistent Formatting
- Apply standardized markdown structure
- Maintain consistent style across articles
- Use WeChat-optimized formatting conventions
- Ensure mobile-friendly presentation

### Organized Management
- Automatic categorization and filing
- Date-based organization for tracking
- Consistent naming conventions
- Easy content retrieval and reference

## Usage Examples

### From Search Results
```bash
/wechat-content-writer:create-article "AI在医疗诊断中的最新突破" --category="AI-Coding" --source="search" --template="technical-deep-dive"
```

### From PDF Analysis
```bash
/wechat-content-writer:create-article "深度学习模型优化新方法解析" --category="文献解读" --source="pdf" --template="literature-review"
```

### Manual Content Creation
```bash
/wechat-content-writer:create-article "程序员必知的性能优化技巧" --category="技术分享" --source="manual" --template="tutorial"
```

## Post-Creation Workflow

After article creation:
1. **Content Review**: Verify accuracy and engagement quality
2. **SEO Optimization**: Ensure good discoverability
3. **Visual Enhancement**: Consider adding diagrams or illustrations
4. **Publication Preparation**: Format for WeChat platform requirements
5. **Performance Tracking**: Monitor engagement and feedback

## Best Practices

### Content Planning
- Define target audience clearly
- Choose compelling, specific angles
- Balance depth with accessibility
- Plan engagement strategies

### Writing Process
- Start with strong hook or question
- Use concrete examples and stories
- Explain technical concepts simply
- Maintain consistent tone and style

### Organization
- Use clear, descriptive headings
- Break up long paragraphs
- Include bullet points for readability
- Add internal navigation for longer articles

## Error Handling

Common issues and solutions:
- **Insufficient Source Material**: Request additional content or sources
- **Title Optimization**: Provide multiple title options for A/B testing
- **Category Selection**: Suggest appropriate categories based on content
- **Template Selection**: Auto-select based on content type and audience