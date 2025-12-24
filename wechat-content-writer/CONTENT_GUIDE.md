# 微信公众号内容创作指南

## 📁 目录结构说明

### 插件目录 (wechat-content-writer)
此目录专门用于插件开发和维护：

```
wechat-content-writer/
├── .claude-plugin/     # 插件配置
├── agents/            # AI代理定义
├── commands/          # 自定义命令
├── hooks/             # 生命周期钩子
├── scripts/           # 工具脚本
├── skills/            # 技能定义
├── config.json        # 插件配置
├── install.sh         # Linux/macOS安装脚本
├── install.ps1        # Windows安装脚本
└── README.md          # 插件说明文档
```

### 内容目录 (wechat_doc)
此目录用于存放所有创作的微信公众号内容：

```
wechat_doc/
├── AI工业应用/         # 工业AI应用相关文章
├── 文献解读/          # 学术论文解读文章
├── AI-Coding/         # AI编程技术文章
├── 技术分享/          # 通用技术分享
└── 行业动态/          # 行业新闻和趋势分析
```

## 🎯 文件路径规范

### 文件命名格式
```
{category}/{YYYY-MM-DD}_{article_title}.md
```

**示例：**
- `AI工业应用/2025-12-20_AI看火焰就能预测钢铁质量？中国研究团队黑科技突破.md`
- `文献解读/2025-12-20_GPT-4技术突破深度解析.md`

### 相对路径引用
在插件配置和脚本中，使用 `../../wechat_doc/` 来引用内容目录：

**JavaScript示例：**
```javascript
const contentPath = '../../wechat_doc/AI工业应用/2025-12-20_article.md';
```

**PowerShell示例：**
```powershell
$contentPath = Join-Path $projectRoot "wechat_doc\AI工业应用\2025-12-20_article.md"
```

## 🔧 自动安装配置

安装脚本 (`install.sh` 和 `install.ps1`) 会自动：

1. **创建内容目录结构**：
   - 在项目根目录创建 `wechat_doc` 文件夹
   - 创建所有预定义的分类目录

2. **配置文件路径**：
   - 更新 `config.json` 中的路径设置
   - 确保所有脚本都使用正确的相对路径

3. **设置权限**：
   - 为插件目录设置适当的访问权限
   - 确保内容目录可读写

## 📝 使用流程

### 1. 安装插件
```bash
# Linux/macOS
./install.sh

# Windows
./install.ps1
```

### 2. 创作内容
使用 `/wechat-content-writer:create-article` 命令：
```bash
/wechat-content-writer:create-article "文章标题" --category="AI工业应用" --source="pdf"
```

### 3. 文件保存位置
- **文章内容**：`../../wechat_doc/{category}/{date}_{title}.md`
- **临时文件**：插件目录（不会被提交到版本控制）

## 🔄 重新安装

### 完全重装
```bash
# 删除现有插件目录
rm -rf wechat-content-writer

# 重新克隆或下载
git clone <repository_url>

# 运行安装脚本
./install.sh  # 或 install.ps1
```

### 仅更新配置
```bash
# 删除配置文件
rm -f wechat-content-writer/config.json

# 重新运行安装脚本
./install.sh --skip-node --skip-git
```

## 📋 目录维护

### 定期清理
- **插件目录**：只保留必要文件
- **内容目录**：定期整理和归档旧文章
- **缓存文件**：删除临时生成的文件

### 备份策略
```bash
# 备份内容目录
tar -czf wechat_doc_backup_$(date +%Y%m%d).tar.gz wechat_doc/

# 备份插件配置
cp -r wechat-content-writer/config.json ./config_backup.json
```

## ⚠️ 注意事项

1. **路径分离**：永远不要在插件目录中存储创作的内容
2. **版本控制**：只将插件代码纳入版本控制，内容目录可单独管理
3. **权限设置**：确保插件和内容目录都有适当的读写权限
4. **定期更新**：随着功能更新，及时重新安装插件

## 🐛 故障排除

### 常见问题

**问题1：文件路径错误**
```
解决方案：检查 config.json 中的 base_path 设置
```

**问题2：权限不足**
```bash
# Linux/macOS
chmod -R 755 wechat_doc/
chmod -R 755 wechat-content-writer/

# Windows
# 以管理员身份运行 PowerShell
```

**问题3：目录结构缺失**
```bash
# 重新运行安装脚本
./install.sh --skip-node --skip-git
```

### 日志查看
- **插件日志**：`wechat-content-writer/logs/`
- **安装日志**：安装过程中的输出信息
- **错误日志**：具体操作的错误信息

---

*如有其他问题，请查看 README.md 或提交 issue。*