---
name: pdf-analysis
description: This skill should be used when the user asks to "解析PDF", "解读文档", "分析PDF文件", "PDF解读", "extract content from PDF", "analyze PDF document", "parse academic paper", or provides a PDF file path for content extraction and analysis. Provides comprehensive PDF document analysis and content extraction capabilities for WeChat content creation.
version: 1.0.0
---

# PDF Analysis Skill

## Purpose

This skill enables comprehensive analysis of PDF documents, particularly academic papers and technical documents, to extract valuable content for WeChat article creation. It provides systematic workflows for document parsing, content extraction, and transformation into engaging public-facing content.

## When to Use

Activate this skill when users need to:
- Analyze academic papers in PDF format
- Extract content from technical documents
- Understand complex research papers
- Create WeChat content based on PDF materials
- Summarize lengthy documents for audience consumption

## Core Workflow

### 1. Document Preprocessing

Start by examining the PDF structure:
- Check document metadata (title, authors, publication date)
- Assess document length and complexity
- Identify document type (research paper, technical report, review article)
- Note any special formatting or visual elements
- Determine language and writing style

### 2. Content Extraction

Systematically extract key content sections:
- **Abstract and Introduction**: Core research questions and contributions
- **Methodology**: Technical approaches and experimental setup
- **Results and Discussion**: Key findings and their implications
- **Conclusion**: Main takeaways and future work
- **References**: Related work and additional resources

### 3. Technical Analysis

For research papers, focus on:
- **Problem Statement**: What issue is being addressed
- **Novel Contributions**: What makes this research unique
- **Methodological Innovation**: New techniques or approaches
- **Experimental Results**: Key data and findings
- **Practical Applications**: Real-world implications and use cases

### 4. Content Transformation

Convert technical content into WeChat-friendly format:
- **Simplify Technical Language**: Replace jargon with accessible explanations
- **Create Analogies**: Use familiar concepts to explain complex ideas
- **Highlight Relevance**: Connect research to everyday experiences
- **Structure Narratively**: Create compelling story around the research
- **Add Visual Elements**: Suggest diagrams or illustrations if helpful

## Document Analysis Templates

### Research Paper Analysis
```
Paper Title: [EXTRACTED_TITLE]
Authors: [EXTRACTED_AUTHORS]
Publication: [JOURNAL/CONFERENCE]

Key Questions:
1. What problem does this research solve?
2. What is the main contribution?
3. How does this compare to existing approaches?
4. What are the practical implications?
5. Who would benefit from this research?

Content Extraction:
- Abstract Summary: [KEY_POINTS]
- Methodology Overview: [APPROACH_DESCRIPTION]
- Main Results: [FINDINGS]
- Limitations: [WEAKNESSES/CONSTRAINTS]
- Future Work: [NEXT_STEPS]
```

### Technical Document Analysis
```
Document Type: [MANUAL/GUIDE/REPORT]
Target Audience: [INTENDED_USERS]
Core Concepts: [MAIN_TOPICS]

Key Information:
- Purpose: [DOCUMENT_GOAL]
- Scope: [COVERED_AREAS]
- Recommendations: [KEY_ADVICE]
- Implementation: [PRACTICAL_STEPS]
- Resources: [ADDITIONAL_MATERIALS]
```

## Content Structure for WeChat

### Research-Based Article Structure
1. **Engaging Hook**: Start with surprising finding or relatable problem
2. **Background Context**: Explain why this research matters
3. **Problem Statement**: Clearly articulate the issue being addressed
4. **Solution Overview**: Describe the innovative approach
5. **Key Results**: Highlight most important findings
6. **Practical Impact**: Explain real-world applications
7. **Future Outlook**: Discuss potential developments
8. **Call to Action**: Encourage reader engagement or further learning

### Writing Style Guidelines
- **Conversational Tone**: Write as if explaining to interested friend
- **Storytelling Elements**: Use narrative to maintain engagement
- **Visual Language**: Help readers visualize concepts
- **Progressive Disclosure**: Introduce complexity gradually
- **Practical Examples**: Connect abstract concepts to concrete situations

## Quality Assessment Criteria

Before finalizing content, verify:
- [ ] Accurate representation of original document
- [ ] Appropriate simplification without distortion
- [ ] Clear connection to reader interests
- [ ] Proper attribution to source material
- [ ] Engaging and accessible language
- [ ] Logical flow and structure

## Common Document Types and Approaches

### Academic Papers
- Focus on novel contributions and breakthroughs
- Explain experimental setup and results clearly
- Connect theory to practical applications
- Highlight significance for field advancement

### Technical Reports
- Emphasize practical recommendations and guidelines
- Extract actionable insights for readers
- Simplify technical specifications
- Provide implementation guidance

### Review Articles
- Identify key trends and developments
- Summarize consensus views and debates
- Highlight emerging areas of research
- Provide balanced perspective on field

## Content Generation Strategies

### Simplification Techniques
1. **Analogical Reasoning**: Compare complex concepts to familiar ones
2. **Concrete Examples**: Use specific instances to illustrate general principles
3. **Progressive Complexity**: Start simple, gradually add detail
4. **Visual Metaphors**: Create mental images to aid understanding
5. **Question-Based Approach**: Anticipate and answer reader questions

### Engagement Strategies
1. **Surprising Facts**: Start with unexpected or counterintuitive information
2. **Personal Connection**: Relate content to reader experiences
3. **Interactive Elements**: Pose questions or scenarios for consideration
4. **Future Implications**: Discuss how this might affect readers' lives
5. **Practical Takeaways**: Provide actionable advice or insights

## Integration with Workflow

After PDF analysis:
1. Extract key content and insights
2. Determine appropriate content category
3. Use `create-article` command for structured generation
4. Apply consistent formatting and style
5. Ensure proper attribution and references

## Additional Resources

### Reference Files
- **`references/analysis-techniques.md`** - Detailed methods for document analysis
- **`references/content-templates.md`** - WeChat article templates for different document types

### Example Files
- **`examples/paper-analysis-example.md`** - Complete analysis of a research paper
- **`examples/wechat-article-from-pdf.md`** - Full WeChat article based on PDF analysis

## Technical Considerations

### PDF Parsing
- Handle different PDF formats and structures
- Extract text while preserving formatting context
- Identify and process special elements (tables, figures, equations)
- Manage multi-column layouts and academic formatting

### Content Quality
- Verify accuracy of extracted information
- Check for completeness of key sections
- Ensure proper handling of technical terminology
- Maintain document context and flow

## Tips for Effective Analysis

1. **Read Abstract First**: Get overview before detailed analysis
2. **Identify Target Audience**: Tailor content appropriately
3. **Extract Key Numbers**: Use statistics and data for credibility
4. **Find Human Angle**: Connect technical content to human interests
5. **Verify Claims**: Cross-check important statements with source
6. **Consider Visual Elements**: Suggest diagrams or illustrations if helpful

## Common Pitfalls to Avoid

- **Oversimplification**: Don't distort complex concepts beyond recognition
- **Missing Context**: Provide sufficient background for understanding
- **Jargon Overload**: Replace or explain technical terms
- **Dry Presentation**: Use engaging language and examples
- **Incomplete Attribution**: Always credit original sources properly