# 贡献指南

感谢你考虑为 WeChat Content Writer 插件做出贡献！

## 目录

- [行为准则](#行为准则)
- [如何贡献](#如何贡献)
- [开发流程](#开发流程)
- [代码规范](#代码规范)
- [提交规范](#提交规范)

## 行为准则

- 尊重所有贡献者
- 欢迎不同观点和建设性讨论
- 专注于对项目最有益的事情
- 对不同意见保持开放态度

## 如何贡献

### 报告问题

在 [GitHub Issues](https://github.com/bahayonghang/wechat-content-writer/issues) 报告问题时，请提供：

1. **环境信息**
   - 操作系统版本
   - Node.js 版本
   - 插件版本

2. **问题描述**
   - 清晰的问题描述
   - 重现步骤
   - 期望行为
   - 实际行为
   - 错误日志（如有）

3. **最小复现示例**
   - 如果可能，提供可复现问题的最小代码

### 提交代码

1. **Fork 仓库**

```bash
# 在 GitHub 上 Fork 仓库
git clone https://github.com/YOUR_USERNAME/wechat-content-writer.git
cd wechat-content-writer
```

2. **创建分支**

```bash
git checkout -b feature/your-feature-name
```

3. **进行修改**

4. **提交更改**

```bash
git add .
git commit -m "feat: add new feature"
```

5. **推送到 Fork**

```bash
git push origin feature/your-feature-name
```

6. **创建 Pull Request**

在 GitHub 上创建 Pull Request，描述你的更改。

## 开发流程

### 分支策略

| 分支 | 用途 |
|------|------|
| `main` | 主分支，稳定版本 |
| `develop` | 开发分支 |
| `feature/*` | 功能分支 |
| `fix/*` | 修复分支 |
| `docs/*` | 文档分支 |

### 开发步骤

1. 从 `main` 创建功能分支
2. 进行开发和测试
3. 提交 Pull Request 到 `main`
4. 代码审查
5. 合并到主分支

## 代码规范

### JavaScript 规范

遵循 [ESLint](https://eslint.org/) 规则：

```javascript
// 使用 const/let，避免 var
const apiUrl = 'https://api.example.com';
let currentPage = 1;

// 使用箭头函数
const fetchData = async () => {
  const response = await fetch(apiUrl);
  return response.json();
};

// 使用模板字符串
const message = `Hello, ${name}!`;

// 使用解构
const { title, author } = paper;

// 使用可选链
const value = obj?.property?.nested;
```

### 命名规范

| 类型 | 规范 | 示例 |
|------|------|------|
| 变量 | camelCase | `searchResults` |
| 常量 | UPPER_SNAKE_CASE | `MAX_RESULTS` |
| 函数 | camelCase | `fetchData()` |
| 类 | PascalCase | `SearchEngine` |
| 文件 | kebab-case | `search-server.js` |

### 注释规范

```javascript
/**
 * 搜索学术文献
 * @param {string} query - 搜索关键词
 * @param {number} limit - 返回结果数量
 * @returns {Promise<Array>} 文献列表
 */
async function searchPapers(query, limit = 10) {
  // 实现逻辑...
}
```

## 提交规范

遵循 [Conventional Commits](https://www.conventionalcommits.org/) 规范：

### 提交格式

```
<type>(<scope>): <subject>

<body>

<footer>
```

### 类型 (type)

| 类型 | 说明 |
|------|------|
| `feat` | 新功能 |
| `fix` | 问题修复 |
| `docs` | 文档更新 |
| `style` | 代码格式 |
| `refactor` | 代码重构 |
| `test` | 测试相关 |
| `chore` | 构建/工具 |

### 示例

```bash
# 新功能
git commit -m "feat(commands): add analyze-trend command"

# 问题修复
git commit -m "fix(server): resolve port conflict issue"

# 文档更新
git commit -m "docs(api): update endpoint documentation"

# 代码重构
git commit -m "refactor(search): optimize result ranking"
```

### 详细提交

```bash
git commit -m "feat(skills): add code-explainer skill

- Implement code structure analysis
- Add support for multiple languages
- Generate human-readable explanations

Closes #123"
```

## Pull Request 指南

### PR 标题

使用与提交消息相同的格式：

```
feat(commands): add analyze-trend command
```

### PR 描述

```markdown
## 变更类型
- [ ] 新功能
- [ ] 问题修复
- [ ] 文档更新
- [ ] 代码重构

## 变更内容
- 添加了 analyze-trend 命令
- 实现趋势分析逻辑
- 添加单元测试

## 相关 Issue
Closes #123

## 测试
- [ ] 单元测试通过
- [ ] 手动测试完成
- [ ] 文档已更新
```

### 代码审查

提交 PR 后，请确保：

- [ ] 代码通过 ESLint 检查
- [ ] 所有测试通过
- [ ] 添加了必要的注释
- [ ] 更新了相关文档

## 文档贡献

文档同样重要！你可以：

- 修正错别字和语法错误
- 改进现有文档的清晰度
- 添加更多示例
- 翻译文档

## 获取帮助

如有疑问，欢迎：

- 在 [Discussions](https://github.com/bahayonghang/wechat-content-writer/discussions) 提问
- 在 Issues 中寻求帮助
- 联系维护者

## 许可

贡献的代码将采用与项目相同的 [MIT License](https://opensource.org/licenses/MIT)。

---

再次感谢你的贡献！ (￣▽￣)ﾉ
