---
name: search-content
description: Search for academic literature and web content on specified topics for WeChat article creation
argument-hint: "<topic> [--category=<category>] [--limit=<number>]"
allowed-tools: ["WebSearch", "Read", "Write", "Edit", "Grep", "Glob"]
---

# WeChat Content Writer: Search Content

This command enables comprehensive content search for WeChat article creation, supporting both academic literature and general web content discovery.

## Usage

```bash
/wechat-content-writer:search-content <search_topic> [--category=<category>] [--limit=<number>]
```

### Arguments

- **search_topic** (required): The main topic or keywords to search for
- **--category** (optional): Content category classification
  - Options: "文献解读", "AI-Coding", "技术分享", "行业动态" or custom category
  - Default: Uses topic-based classification
- **--limit** (optional): Number of search results to process
  - Default: 10
  - Range: 1-50

## Execution Process

### 1. Search Strategy Formulation

1. **Analyze Search Topic**
   - Extract key concepts and keywords
   - Identify academic field or technical domain
   - Determine search scope (recent vs. comprehensive)

2. **Select Search Sources**
   - Academic databases (arXiv, Google Scholar)
   - Technical blogs and news sites
   - Industry reports and whitepapers
   - Research institution publications

### 2. Content Discovery

1. **Execute Web Search**
   - Use appropriate search queries for each source type
   - Apply filters for recency and relevance
   - Collect diverse content types

2. **Filter and Rank Results**
   - Prioritize recent publications (last 2-3 years)
   - Favor authoritative sources
   - Ensure content diversity and quality

### 3. Content Analysis

1. **Extract Key Information**
   - Main findings and contributions
   - Methodology and approaches
   - Practical applications and implications
   - Future directions and outlook

2. **Assess Content Value**
   - Relevance to target audience
   - Novelty and significance
   - Accessibility for public consumption
   - Potential for engaging storytelling

### 4. Result Organization

1. **Categorize Findings**
   - Group by theme or subtopic
   - Identify common patterns and trends
   - Highlight contradictory or complementary views

2. **Generate Summary**
   - Provide overview of search landscape
   - Identify most promising content areas
   - Suggest specific angles for article development

## Output Format

The command generates a structured search result:

```markdown
# Search Results: [Topic]

## Overview
[Brief summary of search landscape and key findings]

## Key Content Areas

### Area 1: [Subtopic Name]
- **Main Finding**: [Key insight]
- **Sources**: [Reference to specific papers or articles]
- **Potential Angle**: [Suggested approach for WeChat article]

### Area 2: [Subtopic Name]
- **Main Finding**: [Key insight]
- **Sources**: [Reference to specific papers or articles]
- **Potential Angle**: [Suggested approach for WeChat article]

## Recommended Article Topics
1. [Topic 1 with brief description]
2. [Topic 2 with brief description]
3. [Topic 3 with brief description]

## Next Steps
- Use `/wechat-content-writer:create-article` to develop specific content
- Apply literature-research skill for deeper academic analysis
- Use pdf-analysis skill for specific document analysis
```

## Integration with Other Commands

This command works seamlessly with:
- **create-article**: Develop search results into full articles
- **literature-research skill**: Deep dive into academic papers
- **pdf-analysis skill**: Analyze specific documents in detail

## Best Practices

### Search Optimization
- Use specific, targeted keywords
- Include relevant technical terms
- Consider recent developments and trends
- Balance breadth with depth

### Content Selection
- Prioritize recent and relevant content
- Ensure source credibility
- Look for unique angles or insights
- Consider audience interests and knowledge level

### Result Utilization
- Save search results for future reference
- Use as foundation for multiple articles
- Track content performance over time
- Update searches regularly for fresh content

## Examples

### Basic Search
```bash
/wechat-content-writer:search-content "large language models efficiency"
```

### Category-Specific Search
```bash
/wechat-content-writer:search-content "computer vision medical imaging" --category="AI-Coding"
```

### Limited Results
```bash
/wechat-content-writer:search-content "quantum computing breakthroughs" --limit=5
```

## Tips for Effective Searching

1. **Use Specific Terms**: Instead of "AI technology", try "transformer architecture optimization"
2. **Include Time References**: Add "2024" or "recent" for current developments
3. **Combine Keywords**: Use multiple related terms for comprehensive coverage
4. **Consider Different Angles**: Search for both technical and business perspectives
5. **Follow Citation Chains**: Use references from good articles to find more content

## Error Handling

If no relevant content is found:
1. Try broader search terms
2. Check spelling and terminology
3. Consider alternative phrasing
4. Adjust category classification
5. Increase result limit if needed

## Performance Considerations

- Search typically processes 10-20 sources within 30-60 seconds
- Complex or technical topics may require additional processing time
- Large result limits may increase processing time significantly
- Consider running searches during off-peak hours for better performance