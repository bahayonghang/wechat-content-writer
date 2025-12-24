---
name: manage-categories
description: Manage article categories and folder structure for WeChat content organization
argument-hint: "<action> [--category=<category_name>]"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "Bash"]
---

# WeChat Content Writer: Manage Categories

This command provides comprehensive category management for organizing WeChat content, including folder creation, listing, and maintenance.

## Usage

```bash
/wechat-content-writer:manage-categories <action> [--category=<category_name>]
```

### Arguments

- **action** (required): Management action to perform
  - Options: "list", "add", "delete", "stats", "cleanup"
- **--category** (optional): Category name for add/delete actions
  - Required for "add" and "delete" actions
  - Ignored for "list", "stats", "cleanup" actions

## Actions

### 1. List Categories
```bash
/wechat-content-writer:manage-categories list
```

Displays all existing categories with article counts:
- Category names and folder paths
- Number of articles in each category
- Last updated dates
- Total storage usage

### 2. Add Category
```bash
/wechat-content-writer:manage-categories add --category="新类别名称"
```

Creates a new category folder:
- Validates category name format
- Creates directory structure
- Adds category metadata file
- Sets up default templates

### 3. Delete Category
```bash
/wechat-content-writer:manage-categories delete --category="类别名称"
```

Removes a category and its content:
- Confirms deletion intent
- Moves content to archive if requested
- Removes category folder
- Updates category registry

### 4. Category Statistics
```bash
/wechat-content-writer:manage-categories stats
```

Shows detailed statistics:
- Total articles across all categories
- Most/least active categories
- Content growth trends
- Storage usage breakdown

### 5. Cleanup
```bash
/wechat-content-writer:manage-categories cleanup
```

Performs maintenance tasks:
- Removes empty categories
- Fixes inconsistent naming
- Updates category metadata
- Optimizes folder structure

## Category Structure

Categories follow this organization:

```
项目文件夹/
├── 文献解读/
│   ├── 2024-01-15_论文标题.md
│   ├── 2024-01-20_另一个论文.md
│   └── category_info.json
├── AI-Coding/
│   ├── 2024-01-16_技术文章.md
│   ├── 2024-01-21_编程技巧.md
│   └── category_info.json
└── [自定义分类]/
    ├── 日期_文章标题.md
    └── category_info.json
```

### Category Metadata File

Each category contains a `category_info.json` file:

```json
{
  "name": "分类名称",
  "description": "分类描述",
  "created_date": "2024-01-15",
  "last_updated": "2024-01-20",
  "article_count": 5,
  "total_words": 12500,
  "tags": ["标签1", "标签2"],
  "default_template": "literature-review",
  "color_scheme": "#3498db"
}
```

## Default Categories

### Built-in Categories

1. **文献解读**
   - Purpose: Academic paper analysis and interpretation
   - Template: literature-review
   - Typical content: Research findings, theoretical analysis

2. **AI-Coding**
   - Purpose: AI development and programming content
   - Template: technical-deep-dive
   - Typical content: Code tutorials, AI applications

### Creating Custom Categories

When adding custom categories:
- Use descriptive, meaningful names
- Keep names concise yet clear
- Consider content organization needs
- Plan for future growth

## Output Formats

### List Output
```markdown
# 文章分类管理

## 现有分类 (3个)

### 📚 文献解读 (5篇文章)
- 最新更新: 2024-01-20
- 总字数: 12,500字
- 平均阅读时间: 8分钟

### 💻 AI-Coding (3篇文章)
- 最新更新: 2024-01-19
- 总字数: 8,200字
- 平均阅读时间: 6分钟

### 📊 数据科学 (2篇文章)
- 最新更新: 2024-01-18
- 总字数: 5,100字
- 平均阅读时间: 5分钟

## 总计
- 文章总数: 10篇
- 总字数: 25,800字
- 分类数量: 3个
```

### Stats Output
```markdown
# 分类统计报告

## 内容概览
- 总文章数: 10篇
- 总分类数: 3个
- 总字数: 25,800字
- 平均文章长度: 2,580字

## 活跃度排行
1. 文献解读 (5篇文章, 50%)
2. AI-Coding (3篇文章, 30%)
3. 数据科学 (2篇文章, 20%)

## 增长趋势
- 本月新增: 3篇文章
- 最活跃分类: 文献解读
- 平均每周: 0.75篇文章
```

## Category Naming Guidelines

### Best Practices
- Use clear, descriptive names in Chinese or English
- Avoid overly technical jargon
- Keep names under 20 characters
- Consider search and discoverability
- Plan for scalability

### Examples
✅ **Good**: "机器学习应用", "前端开发技巧", "产品思维"
❌ **Avoid**: "ML", "FE", "PM" (too abbreviated)
✅ **Good**: "技术趋势分析", "创业经验分享"
❌ **Avoid**: "技术", "创业" (too generic)

## Integration with Article Creation

Categories integrate seamlessly with:
- **create-article command**: Automatic categorization
- **search-content command**: Category-based filtering
- **Content workflow**: Streamlined organization

### Category Selection During Article Creation
The create-article command automatically:
- Suggests relevant categories based on content
- Creates category folders if needed
- Updates category metadata
- Maintains consistent organization

## File Organization Best Practices

### Folder Structure
- Keep category names consistent
- Use date prefixes for articles
- Include metadata files in each category
- Maintain clean folder hierarchy

### Naming Conventions
- Articles: `YYYY-MM-DD_标题.md`
- Categories: Descriptive Chinese or English names
- Metadata: `category_info.json`
- Archives: `_archive/` subfolder

### Content Management
- Regular category cleanup
- Monitor category growth
- Merge similar categories if needed
- Archive inactive categories

## Advanced Features

### Category Templates
Categories can have default templates:
- literature-review: For academic content
- technical-deep-dive: For technical articles
- news-analysis: For industry news
- tutorial: For educational content

### Category Analytics
Track category performance:
- Article read times
- Engagement metrics
- Popular topics within categories
- Content gaps and opportunities

### Bulk Operations
Perform actions on multiple categories:
- Batch rename operations
- Mass template updates
- Cross-category content migration
- Comprehensive reporting

## Error Handling

### Common Issues and Solutions

1. **Category Already Exists**
   - Offer to merge or rename
   - Suggest alternative names
   - Check for similar categories

2. **Category Not Found**
   - Verify exact spelling
   - List available categories
   - Offer to create new category

3. **Cannot Delete Non-empty Category**
   - Show category contents
   - Offer to move articles first
   - Provide archive option

4. **Permission Issues**
   - Check folder permissions
   - Verify write access
   - Suggest alternative locations

## Maintenance Recommendations

### Regular Tasks
- Monthly category review
- Quarterly cleanup of unused categories
- Annual category structure assessment
- Regular metadata updates

### Performance Monitoring
- Track category growth rates
- Monitor article distribution
- Identify content gaps
- Optimize category structure

### User Feedback Integration
- Collect reader preferences
- Monitor engagement by category
- Adjust categories based on feedback
- Add new categories as needed