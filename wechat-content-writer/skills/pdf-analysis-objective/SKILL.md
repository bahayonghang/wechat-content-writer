---
name: pdf-analysis
description: This skill should be used when the user asks to "分析PDF", "解读文档", "分析PDF文件", "PDF解读", "extract content from PDF", "analyze PDF document", "parse academic paper", or provides a PDF file path for content extraction and analysis. Provides objective PDF document analysis and content extraction for professional WeChat content creation.
version: 2.0.0
---

# Objective PDF Analysis Skill

## Purpose

This skill enables comprehensive analysis of PDF documents, particularly academic papers and technical documents, to extract valuable content for objective WeChat article creation. It provides systematic workflows for document parsing, content extraction, and transformation into professional public-facing content.

## When to Use

Activate this skill when users need to:
- Analyze academic papers in PDF format objectively
- Extract technical content from documents professionally
- Understand complex research papers with neutral perspective
- Create WeChat content based on PDF materials with factual approach
- Summarize technical documents for professional audience consumption

## Core Workflow

### 1. Document Preprocessing

Start by examining the PDF structure:
- Check document metadata (title, authors, publication date)
- Assess document length and technical complexity
- Identify document type (research paper, technical report, review article)
- Note any special formatting or visual elements
- Determine language and writing style
- Assess technical depth and target audience

### 2. Content Extraction

Systematically extract key content sections:
- **Abstract and Introduction**: Core research questions and contributions
- **Methodology**: Technical approaches and experimental setup
- **Results and Discussion**: Key findings and their implications
- **Conclusion**: Main takeaways and future work
- **References**: Related work and additional resources
- **Technical Details**: Data, statistics, and technical specifications

### 3. Technical Analysis

For research papers, focus on:
- **Problem Statement**: What issue is being addressed
- **Novel Contributions**: What makes this research unique
- **Methodological Innovation**: New techniques or approaches
- **Experimental Results**: Key data and findings
- **Practical Applications**: Real-world implications and use cases
- **Limitations**: Technical constraints and challenges
- **Future Research**: Potential developments and directions

### 4. Content Transformation

Convert technical content into WeChat-friendly format with objectivity:
- **Maintain Technical Accuracy**: Preserve precise technical terminology
- **Provide Context**: Explain technical concepts clearly without oversimplification
- **Highlight Relevance**: Connect research to practical applications objectively
- **Structure Informationally**: Create logical presentation of technical content
- **Include Evidence**: Use data and statistics to support claims
- **Maintain Neutrality**: Present balanced technical perspective

## Document Analysis Templates

### Research Paper Analysis Template
```
Paper Title: [EXTRACTED_TITLE]
Authors: [EXTRACTED_AUTHORS]
Publication: [JOURNAL/CONFERENCE]
Date: [PUBLICATION_DATE]

Research Classification:
- Primary Field: [FIELD_OF_STUDY]
- Methodology Type: [RESEARCH_METHOD]
- Sample Size: [SAMPLE_SIZE]
- Statistical Significance: [P_VALUES/CONFIDENCE_LEVELS]

Technical Questions Addressed:
1. What specific problem does this research address?
2. What is the main technical contribution?
3. How does this approach compare to existing methods?
4. What are the quantitative results?
5. What are the practical applications?
6. What are the methodological limitations?

Content Extraction:
- Abstract Summary: [KEY_TECHNICAL_POINTS]
- Methodology Overview: [TECHNICAL_APPROACH_DESCRIPTION]
- Main Results: [QUANTITATIVE_FINDINGS]
- Statistical Analysis: [STATISTICAL_METHODS_AND_RESULTS]
- Limitations: [TECHNICAL_CONSTRAINTS]
- Future Work: [RESEARCH_DIRECTIONS]

Performance Metrics:
- Accuracy: [ACCURACY_RATES]
- Precision/Recall: [PRECISION_RECALL_VALUES]
- Computational Efficiency: [PERFORMANCE_METRICS]
- Comparison with Baselines: [COMPARATIVE_ANALYSIS]
```

### Technical Document Analysis Template
```
Document Type: [MANUAL/GUIDE/REPORT]
Target Audience: [TECHNICAL_EXPERTISE_LEVEL]
Core Concepts: [MAIN_TECHNICAL_TOPICS]

Technical Information:
- Purpose: [TECHNICAL_OBJECTIVE]
- Scope: [TECHNICAL_COVERAGE]
- Implementation Requirements: [PREREQUISITES]
- Performance Specifications: [TECHNICAL_SPECIFICATIONS]
- Compatibility: [SYSTEM_REQUIREMENTS]

Key Technical Details:
- Architecture: [SYSTEM_ARCHITECTURE]
- Algorithms: [CORE_ALGORITHMS]
- Data Structures: [USED_DATA_STRUCTURES]
- API Specifications: [INTERFACE_DEFINITIONS]
- Configuration: [SETUP_REQUIREMENTS]

Technical Recommendations:
- Implementation Guidelines: [BEST_PRACTICES]
- Performance Optimization: [OPTIMIZATION_TECHNIQUES]
- Troubleshooting: [COMMON_ISSUES_AND_SOLUTIONS]
- Maintenance: [MAINTENANCE_PROCEDURES]
```

## Content Structure for Professional WeChat Articles

### Research-Based Article Structure
1. **Technical Abstract**: Concise overview of research significance
2. **Background Context**: Technical background and problem statement
3. **Methodology Explanation**: Clear description of technical approach
4. **Results Presentation**: Quantitative findings and data analysis
5. **Technical Discussion**: Analysis of results and implications
6. **Practical Applications**: Real-world relevance and use cases
7. **Future Perspectives**: Research directions and development potential

### Writing Style Guidelines
- **Objective Tone**: Present information neutrally without bias
- **Technical Precision**: Use accurate terminology and measurements
- **Evidence-Based**: Support claims with data and research findings
- **Logical Structure**: Present information in clear, logical progression
- **Professional Language**: Use formal technical writing conventions

## Quality Assessment Criteria

Before finalizing content, verify:
- [ ] Accurate representation of original technical document
- [ ] Appropriate technical complexity for target audience
- [ ] Clear connection to practical applications
- [ ] Proper technical attribution and citations
- [ ] Engaging yet objective technical presentation
- [ ] Logical technical flow and structure
- [ ] Balanced perspective including limitations

## Common Document Types and Approaches

### Academic Papers
- Focus on novel technical contributions and breakthroughs
- Explain experimental methodology and results objectively
- Connect theoretical research to practical applications
- Highlight significance for technical advancement
- Include quantitative performance metrics
- Present limitations and future research directions

### Technical Reports
- Emphasize practical technical recommendations and guidelines
- Extract actionable technical insights for readers
- Simplify technical specifications without losing accuracy
- Provide implementation guidance and best practices
- Include performance benchmarks and comparisons

### Review Articles
- Identify technical trends and developments in the field
- Summarize consensus technical views and debates
- Highlight emerging areas of technical research
- Provide balanced perspective on technical progress
- Compare different technical approaches objectively

## Content Generation Strategies

### Technical Simplification Techniques
1. **Progressive Disclosure**: Introduce technical concepts in logical sequence
2. **Contextual Explanation**: Explain technical concepts with relevant context
3. **Quantitative Focus**: Use specific numbers and measurements for clarity
4. **Comparative Analysis**: Compare different approaches objectively
5. **Practical Examples**: Use concrete technical implementations to illustrate concepts

### Objectivity Strategies
1. **Evidence-Based Claims**: Support all statements with research data
2. **Balanced Presentation**: Include both advantages and limitations
3. **Neutral Language**: Avoid promotional or overly positive language
4. **Technical Precision**: Maintain accurate technical terminology
5. **Source Attribution**: Clearly cite all sources and references

## Integration with Workflow

After PDF analysis:
1. Extract key technical content and insights objectively
2. Determine appropriate technical content category
3. Use `create-article-objective` command for structured professional generation
4. Apply consistent professional formatting and style
5. Ensure proper technical attribution and references
6. Validate technical accuracy and objectivity

## Additional Resources

### Reference Files
- **`references/analysis-techniques.md`** - Detailed methods for objective document analysis
- **`references/content-templates.md`** - Professional WeChat article templates for different document types

### Example Files
- **`examples/academic-paper-analysis.md`** - Complete objective analysis of a research paper
- **`examples/technical-wechat-article.md`** - Full professional WeChat article based on PDF analysis

## Technical Considerations

### PDF Parsing
- Handle different PDF formats and technical structures
- Extract text while preserving technical formatting context
- Identify and process technical elements (tables, figures, equations)
- Manage multi-column layouts and academic formatting
- Preserve technical notation and mathematical symbols

### Content Quality
- Verify technical accuracy of extracted information
- Check for completeness of technical key sections
- Ensure proper handling of technical terminology
- Maintain document technical context and flow
- Validate quantitative data and statistical information

## Tips for Effective Objective Analysis

1. **Read Abstract First**: Get technical overview before detailed analysis
2. **Identify Target Audience**: Tailor technical content appropriately
3. **Extract Key Technical Metrics**: Use performance data and statistics for credibility
4. **Find Practical Applications**: Connect technical content to real-world uses
5. **Verify Technical Claims**: Cross-check important technical statements with source
6. **Consider Technical Limitations**: Present balanced view including constraints
7. **Maintain Technical Precision**: Preserve accuracy of technical concepts

## Common Pitfalls to Avoid

- **Oversimplification**: Don't distort complex technical concepts beyond recognition
- **Technical Inaccuracy**: Ensure all technical details are correctly represented
- **Missing Technical Context**: Provide sufficient technical background for understanding
- **Promotional Language**: Use neutral, objective technical writing
- **Incomplete Technical Analysis**: Include all relevant technical aspects
- **Lack of Technical Evidence**: Support all technical claims with data
- **Incomplete Technical Attribution**: Always credit technical sources properly

---

*This skill is designed for creating objective, professional technical content with proper scientific methodology and balanced perspective.*