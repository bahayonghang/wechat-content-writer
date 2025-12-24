# 常见问题

这里收集了使用 WeChat Content Writer 插件时的常见问题和解决方案。

## 安装与配置

<details>
<summary><b>插件无法被 Claude Code 识别怎么办？</b></summary>

### 解决方案

1. **检查插件配置文件**
   ```bash
   # 确认 plugin.json 存在
   ls wechat-content-writer/.claude-plugin/plugin.json
   ```

2. **使用绝对路径加载**
   ```bash
   claude --plugin-dir /full/path/to/wechat-content-writer
   ```

3. **检查 Claude Code 版本**
   ```bash
   claude --version
   ```
   确保使用最新版本的 Claude Code。

4. **查看详细日志**
   ```bash
   claude --verbose
   ```
   查看具体的错误信息。

</details>

<details>
<summary><b>搜索服务启动失败��提示端口被占用？</b></summary>

### 解决方案

1. **查找占用端口的进程**
   ```bash
   # Windows
   netstat -ano | findstr :3001

   # Linux/Mac
   lsof -i :3001
   ```

2. **更换端口**
   ```bash
   # Windows
   set PORT=3002
   npm start

   # Linux/Mac
   PORT=3002 npm start
   ```

3. **更新 MCP 配置**
   修改 `.mcp.json` 中的端口号：
   ```json
   {
     "env": {
       "PORT": "3002"
     }
   }
   ```

</details>

<details>
<summary><b>npm install 失败，网络超时？</b></summary>

### 解决方案

使用国内镜像源：
```bash
# 临时使用
npm install --registry=https://registry.npmmirror.com

# 永久配置
npm config set registry https://registry.npmmirror.com
```

</details>

<details>
<summary><b>内容目录创建失败？</b></summary>

### 解决方案

1. **手动创建目录**
   ```bash
   # 在项目根目录执行
   mkdir -p wechat_doc/AI工业应用
   mkdir -p wechat_doc/文献解读
   mkdir -p wechat_doc/AI-Coding
   mkdir -p wechat_doc/技术分享
   mkdir -p wechat_doc/行业动态
   ```

2. **检查 config.json 配置**
   ```json
   "content_directories": {
     "base_path": "../../wechat_doc"
   }
   ```
   确保相对路径正确。

3. **检查目录权限**
   ```bash
   # Linux/Mac
   chmod -R 755 wechat_doc
   ```

</details>

---

## 内容创作

<details>
<summary><b>生成的文章仍有"AI味"怎么办？</b></summary>

### 解决方案

1. **使用客观风格的命令和技能**
   ```
   # 使用 objective 版本
   /create-article-objective 而非 /create-article
   pdf-analysis-objective 而非 pdf-analysis
   ```

2. **手动调整写作风格**
   参考 [写作风格指南](./writing-style.md) 进行修改。

3. **使用 content-writer 代理进行优化**
   ```
   请用客观专业的风格重写这篇文章，遵循第三人称和数据驱动原则。
   ```

</details>

<details>
<summary><b>文献搜索没有结果？</b></summary>

### 解决方案

1. **检查搜索服务是否运行**
   ```bash
   curl http://localhost:3001/health
   ```

2. **尝试不同的搜索关键词**
   ```
   # 使用更通用的术语
   搜索文献：machine learning
   而非过于具体的术语
   ```

3. **检查网络连接**
   arXiv API 需要稳定的网络连接。

4. **配置 API 密钥（可选）**
   在 `.env` 文件中配置 SerpAPI 密钥以获得更丰富的搜索结果：
   ```
   SEARCH_API_KEY=your_api_key
   ```

</details>

<details>
<summary><b>PDF 分析失败？</b></summary>

### 解决方案

1. **确认 PDF 文件可访问**
   确保文件已正确上传到 Claude Code。

2. **检查 PDF 格式**
   目前支持：
   - 文本型 PDF
   - 扫描件（需包含可提取的文字）

3. **尝试重新上传**
   删除原文件后重新上传。

4. **使用备用技能**
   如果 `pdf-analysis` 失败，尝试 `pdf-analysis-objective`。

</details>

<details>
<summary><b>如何添加新的文章分类？</b></summary>

### 解决方��

1. **编辑 config.json**
   ```json
   "categories": {
     "AI工业应用": "AI工业应用",
     "文献解读": "文献解读",
     "AI-Coding": "AI-Coding",
     "技术分享": "技术分享",
     "行业动态": "行业动态",
     "新产品": "新产品"  // 添加新分类
   }
   ```

2. **创建对应目录**
   ```bash
   mkdir -p ../../wechat_doc/新产品
   ```

3. **重启搜索服务**
   ```bash
   npm start
   ```

</details>

---

## 性能与优化

<details>
<summary><b>文献搜索速度慢？</b></summary>

### 解决方案

1. **减少返回结果数量**
   ```
   /search-content "关键词" --limit 5
   ```

2. **限定搜索领域**
   ```json
   // 在 config.json 中配置
   "fields": ["computer-science", "artificial-intelligence"]
   ```

3. **使用缓存**
   重复搜索时会使用缓存结果。

</details>

<details>
<summary><b>如何提高文章质量？</b></summary>

### 解决方案

1. **遵循推荐工作流**
   ```
   文献搜索 → PDF分析 → 内容创作 → 人工审核
   ```

2. **提供明确的指令**
   ```
   /create-article-objective "明确标题"
     --category 明确分类
     --source research
     --template academic
   ```

3. **多次迭代优化**
   使用 `content-writer` 代理进行多轮优化。

4. **参考写作风格指南**
   遵循 [写作风格指南](./writing-style.md) 的规范。

</details>

---

## 高级问题

<details>
<summary><b>如何在多个项目间共享插件？</b></summary>

### 解决方案

1. **全局安装插件**
   ```bash
   # 设置环境变量
   export CLAUDE_PLUGIN_DIR=~/wechat-content-writer
   ```

2. **使用符号链接**
   ```bash
   # 在每个项目中创建符号链接
   ln -s ~/wechat-content-writer ./plugin
   ```

3. **配置 Marketplace**
   将插件添加到全局 Marketplace 配置中。

</details>

<details>
<summary><b>如何自定义文章模板？</b></summary>

### 解决方案

1. **创建模板文件**
   在插件目录创建 `templates/` 文件夹：
   ```
   wechat-content-writer/
   └── templates/
       ├── custom-article.md
       └── custom-report.md
   ```

2. **在命令中引用**
   ```
   /create-article "标题" --category 分类 --template custom-article
   ```

3. **模板变量**
   模板支持以下变量：
   - `{{title}}` - 文章标题
   - `{{date}}` - 当前日期
   - `{{category}}` - 文章分类
   - `{{content}}` - 生成内容

</details>

<details>
<summary><b>如何集成到 CI/CD 流程？</b></summary>

### 解决方案

```yaml
# .github/workflows/content-generation.yml
name: Content Generation

on:
  schedule:
    - cron: '0 9 * * 1'  # 每周一上午9点

jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '18'
      - name: Install dependencies
        run: |
          cd wechat-content-writer
          npm install
      - name: Start search server
        run: |
          cd wechat-content-writer
          npm start &
        env:
          PORT: 3001
      - name: Generate content
        run: |
          # 使用 Claude Code API 生成内容
          claude /create-news "AI行业动态" --category 行业动态
```

</details>

---

## 错误排查

### 错误代码参考

| 错误 | 原因 | 解决方案 |
|------|------|----------|
| `ECONNREFUSED` | 搜索服务未启动 | 运行 `npm start` |
| `ENOENT` | 文件或目录不存在 | 检查路径配置 |
| `EADDRINUSE` | 端口被占用 | 更换端口或杀死占用进程 |
| `400 Bad Request` | 请求参数错误 | 检查命令参数格式 |
| `500 Internal Error` | 服务端错误 | 查看服务器日志 |

### 获取帮助

如果以上方案无法解决问题：

1. **查看日志**
   ```bash
   # 搜索服务日志
   npm start

   # Claude Code 日志
   claude --verbose
   ```

2. **GitHub Issues**
   在 [GitHub Issues](https://github.com/bahayonghang/wechat-content-writer/issues) 提交问题，包含：
   - 错误信息
   - 操作步骤
   - 环境信息（OS、Node.js 版本）

3. **文档参考**
   - [开发文档](../development/architecture.md)
   - [API 参考](../development/api.md)

---

## 其他

<details>
<summary><b>插件是开源的吗？</b></summary>

是的，插件采用 MIT 许可证开源。欢迎贡献代码和提出建议。

GitHub: https://github.com/bahayonghang/wechat-content-writer

</details>

<details>
<summary><b>如何获取最新更新？</b></summary>

1. **关注 GitHub 仓库**
   点击 Watch 按钮接收更新通知。

2. **定期更新**
   ```bash
   git pull origin main
   npm install
   ```

3. **查看更新日志**
   参考 [更新日志](../changelog.md)。

</details>

<details>
<summary><b>有商业使用限制吗？</b></summary>

MIT 许可证允许商业使用，无需额外费用。请遵守许可证条款。

</details>
