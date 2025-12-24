---
name: create-article-objective
description: Create objective professional WeChat articles (use create-paper for academic content)
argument-hint: "<title> --category=<category> --source=<source_type> [--template=<template>]"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "mcp__exa__web_search_exa", "mcp__exa__get_code_context_exa"]
---

# Professional WeChat Content Creation: Create Article

This command transforms research findings, PDF analysis, or search results into professional WeChat articles with objective technical documentation and proper organization.

## Usage

```bash
/wechat-content-writer:create-article "<article_title>" --category=<category> --source=<source_type> [--template=<template>]
```

### Arguments

- **article_title** (required): Professional title for the WeChat article
- **--category** (required): Article category folder
  - Options: "文献解读", "AI-Coding", "技术分享", "行业动态" or custom
- **--source** (required): Content source type
  - Options: "search", "pdf", "research", "manual"
- **--template** (optional): Article template style
  - Options: "academic-research", "technical-analysis", "industry-report", "technology-guide"
  - Default: Auto-select based on category and source

## Execution Process

### 1. Content Analysis

1. **Source Content Review**
   - Analyze provided source material for technical accuracy
   - Extract key insights and findings
   - Identify target audience and complexity level
   - Determine article scope and focus

2. **Angle Selection**
   - Choose objective technical perspective
   - Identify unique value proposition
   - Determine logical structure
   - Plan information organization

### 2. Article Structuring

1. **Title Optimization**
   - Ensure professional, accurate title
   - Include key technical information
   - Maintain technical accuracy and relevance
   - Follow academic paper title conventions

2. **Content Organization**
   - Create logical flow and progression
   - Balance technical depth with accessibility
   - Organize information systematically
   - Plan section transitions

### 3. Content Generation

1. **Introduction Development**
   - Start with technical background
   - Establish research significance
   - Preview article structure
   - Set professional objective tone

2. **Main Content Development**
   - Explain technical concepts accurately
   - Use data and evidence for support
   - Provide analytical insights
   - Maintain objective technical presentation

3. **Conclusion and Implications**
   - Summarize key technical findings
   - Discuss practical applications
   - Present future research directions
   - Include technical references

### 4. File Organization

1. **Directory Structure**
   - Create category folder in `../../wechat_doc/` if needed
   - Generate date-prefixed filename
   - Ensure consistent naming convention
   - Maintain organized content library in `../../wechat_doc/`

2. **File Content**
   - Apply professional formatting standards
   - Include metadata and citations
   - Add source references
   - Optimize for technical reading

## File Naming Convention

Files are created with the following format:
```
../../wechat_doc/[category]/YYYY-MM-DD_[professional_article_title].md
```

Example: `../../wechat_doc/文献解读/2025-01-20_基于多模态融合的FeO浓度实时预测技术研究.md`

## Article Templates

### Academic Research Article Template
```markdown
# [Technical Title: Research on XXX Based on XXX Methodology]

## 摘要
[Brief summary of research background, methods, results, and significance (200-300 words)]

## 研究背景
- Industry status and technical challenges
- Limitations of existing solutions
- Research necessity and value

## 技术方法
- System architecture and core principles
- Key technologies and algorithms
- Experimental design and datasets

## 实验结果
- Performance comparison data
- Key indicators analysis
- Effectiveness evaluation and discussion

## 应用价值
- Practical application scenarios
- Economic benefit analysis
- Technology promotion prospects

## 结论与展望
- Main research findings summary
- Technical limitations analysis
- Future development directions

---
*本文基于学术论文《Paper Title》撰写，数据来源：Research Institution/Journal*
```

### Technical Analysis Article Template
```markdown
# [Technical Title: Analysis of XXX Technology Development and Application]

## 技术概述
- Technology definition and basic principles
- Development history and technological evolution
- Current technical level

## 应用场景
- Main application fields and cases
- Technical implementation methods
- Actual effect analysis

## 市场分析
- Market size and development trends
- Major vendors and products
- Competitive landscape analysis

## 挑战与机遇
- Technical difficulties and solutions
- Development opportunities and prospects
- Risk factor analysis

## 发展建议
- Technology development directions
- Industry application recommendations
- Policy support needs

---
*数据来源：行业报告、企业年报、专家访谈等*
```

### Technology Guide Template
```markdown
# [Technical Title: XXX Technology Implementation Guide]

## 技术简介
- Technology overview and features
- Application scope and limitations
- Implementation prerequisites

## 系统架构
- Technical architecture design
- Core components and functions
- Data flow and processing logic

## 实施步骤
- Environment preparation and configuration
- System deployment and testing
- Operation and maintenance guidelines

## 最佳实践
- Common issues and solutions
- Performance optimization methods
- Security considerations

## 总结评估
- Implementation effectiveness
- Resource requirements analysis
- ROI evaluation

---
*参考文档：[Technical documentation, API references, best practice guides]*
```

## Output Structure

Generated articles include:

1. **Metadata Section**
   ```yaml
   ---
   title: [Professional Article Title]
   category: [Category]
   date: [Creation Date]
   source: [Source Type]
   tags: [Technical tags]
   estimated_read_time: [Reading time in minutes]
   references: [Cited sources]
   ---
   ```

2. **Main Content**
   - Professional markdown formatting
   - Technical structure and sections
   - Objective technical presentation
   - Clear and informative headings

3. **References and Resources**
   - Academic citations
   - Technical documentation links
   - Industry reports and research papers
   - Additional technical resources

## Content Quality Standards

### Writing Guidelines
- **Tone**: Objective and professional
- **Complexity**: Appropriate for educated technical audience
- **Length**: 2000-4000 words for comprehensive technical coverage
- **Structure**: Clear sections with descriptive headings
- **Examples**: Technical case studies and data analysis

### Technical Accuracy
- Verify all technical claims against reliable sources
- Ensure proper attribution of research findings
- Maintain distinction between facts and expert opinions
- Provide context for technical terminology

### Professional Objectivity
- Present information objectively without bias
- Include limitations and challenges
- Use evidence-based arguments
- Avoid promotional language or exaggeration

## Integration Features

### Multi-source Content
- Synthesize insights from multiple technical sources
- Integrate PDF analysis with literature research
- Combine different technical perspectives
- Present comprehensive technical overview

### Consistent Formatting
- Apply standardized technical markdown structure
- Maintain consistent professional style across articles
- Use technical formatting conventions
- Ensure readability for technical audience

### Organized Management
- Systematic categorization and filing
- Date-based organization for tracking
- Consistent naming conventions
- Easy content retrieval and reference

## Usage Examples

### From Academic Research
```bash
/wechat-content-writer:create-article "基于深度学习的图像识别技术研究" --category="文献解读" --source="pdf" --template="academic-research"
```

### From Technical Analysis
```bash
/wechat-content-writer:create-article "AI芯片技术发展趋势分析" --category="技术分享" --source="research" --template="technical-analysis"
```

### From Industry Report
```bash
/wechat-content-writer:create-article "2024年工业AI市场发展报告" --category="行业动态" --source="search" --template="industry-report"
```

## Post-Creation Workflow

After article creation:
1. **Technical Review**: Verify accuracy and objectivity
2. **Citation Check**: Ensure proper source attribution
3. **Quality Assurance**: Review for professional standards
4. **Publication Preparation**: Format for technical platform requirements
5. **Performance Monitoring**: Track reader engagement and feedback

## Best Practices

### Content Planning
- Define technical audience clearly
- Choose specific technical angles
- Balance depth with accessibility
- Plan information structure

### Writing Process
- Start with clear technical background
- Use evidence-based technical arguments
- Explain technical concepts precisely
- Maintain consistent professional tone

### Organization
- Use clear, descriptive technical headings
- Organize information logically
- Include technical diagrams when helpful
- Add technical navigation for longer articles

## Error Handling

Common issues and solutions:
- **Insufficient Technical Sources**: Request additional technical documentation or research
- **Title Professionalism**: Provide multiple professional title options
- **Category Selection**: Suggest appropriate technical categories based on content
- **Template Selection**: Auto-select based on technical content type and audience

---

*This tool is designed for creating professional technical content with objective analysis and proper scientific methodology.*