# 更新日志

记录 WeChat Content Writer 插件的重要变更。

---

## [1.0.0] - 2024-12-24

### ✨ 新增功能

#### 命令模块
- `/create-paper` - 学术论文解读命令
- `/create-article-objective` - 客观专业文章创建
- `/create-news` - 行业新闻分析
- `/create-tutorial` - 技术教程创作
- `/create-report` - 行业研究报告
- `/create-tech` - 技术深度解析
- `/create-article` - 通用文章创建
- `/search-content` - 内容搜索
- `/manage-categories` - 分类管理

#### 技能模块
- `literature-research` - 学术文献搜索技能
- `pdf-analysis` - PDF 通俗解读技能
- `pdf-analysis-objective` - PDF 客观分析技能

#### 代理模块
- `content-writer` - 综合内容创作代理

#### 搜索服务
- REST API 服务（端口 3001）
- arXiv 学术文献搜索
- Google Scholar 集成
- 通用网页搜索
- 内容分析端点

### 📦 文档

- 完整的用户指南
- 开发者文档
- API 参考
- 配置说明

### 🎨 设计

- 内容-插件分离架构
- 客观写作风格指南
- 日期驱动文件组织
- 分类管理系统

### ���� 配置

- 灵活的 config.json 配置
- MCP 服务器集成
- 环境变量支持
- 自定义模板支持

---

## 贡献者

- bahayonghang - 项目创建者

---

## 版本说明

遵循 [语义化版本 2.0.0](https://semver.org/lang/zh-CN/) 规范：

- **主版本号**: 不兼容的 API 变更
- **次版本号**: 向下兼容的功能新增
- **修订号**: 向下兼容的问题修正

### 变更类型图标

| 图标 | 类型 | 说明 |
|------|------|------|
| ✨ | `feat` | 新功能 |
| 🐛 | `fix` | 问题修复 |
| 📦 | `docs` | 文档更新 |
| 🎨 | `style` | 代码格式 |
| ♻️ | `refactor` | 代码重构 |
| ⚡ | `perf` | 性能优化 |
| ✅ | `test` | 测试相关 |
| 🔧 | `chore` | 构建/工具 |

---

## 即将推出

### [1.1.0] - 计划中

- [ ] 更多文章模板
- [ ] 本地 PDF 文件处理
- [ ] 批量内容生成
- [ ] 多语言支持
- [ ] CLI 独立运行模式

---

## 反馈与建议

如有功能建议或问题反馈，请：

- 提交 [GitHub Issue](https://github.com/bahayonghang/wechat-content-writer/issues)
- 参与 [Discussions](https://github.com/bahayonghang/wechat-content-writer/discussions)
