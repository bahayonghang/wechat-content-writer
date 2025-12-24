# 📦 WeChat Content Writer 插件安装指南

本指南将帮助你快速安装和配置 WeChat Content Writer Claude Code 插件。

## 🚀 快速安装

### Windows 用户

```powershell
# 方法1：使用 PowerShell 脚本（推荐）
.\install.ps1

# 方法2：手动指定全局安装
.\install.ps1 -t global

# 方法3：跳过环境检查
.\install.ps1 -s -g  # 跳过 Node.js 和 Git 检查
```

### Linux/macOS 用户

```bash
# 方法1：使用 Bash 脚本（推荐）
chmod +x install.sh
./install.sh

# 方法2：全局安装
./install.sh -t global

# 方法3：指定安装路径
./install.sh /opt/wechat-plugin

# 方法4：跳过环境检查
./install.sh -s -g  # 跳过 Node.js 和 Git 检查
```

## 📋 系统要求

### 必需组件
- **Node.js** 14.0 或更高版本
- **Claude Code** CLI 工具

### 可选组件
- **Git** - 用于版本控制和某些高级功能
- **PowerShell** (Windows) 或 **Bash** (Linux/macOS)

## 🔧 安装选项详解

### 安装类型

| 类型 | 说明 | 适用场景 |
|------|------|----------|
| `local` (默认) | 安装到当前目录或指定路径 | 开发测��、多用户环境 |
| `global` | 安装到 Claude 插件目录 | 个人使用、全局可用 |

### 命令行选项

#### Windows PowerShell
```powershell
.\install.ps1 [选项] [安装路径]

选项:
    -t, --type TYPE     安装类型 (local/global)
    -s, --skip-node     跳过 Node.js 检查
    -g, --skip-git      跳过 Git 检查
    -v, --verbose       详细输出
```

#### Linux/macOS Bash
```bash
./install.sh [选项] [安装路径]

选项:
    -h, --help          显示帮助信息
    -t, --type TYPE     安装类型 (local/global)
    -s, --skip-node     跳过 Node.js 检查
    -g, --skip-git      跳过 Git 检查
    -v, --verbose       详细输出
```

## 🛠️ 手动安装

如果自动安装脚本遇到问题，可以按照以下步骤手动安装：

### 1. 环境准备

```bash
# 检查 Node.js 版本
node --version

# 如果没有安装或版本过低，请安装 Node.js 14+
# Windows: https://nodejs.org/
# macOS: brew install node
# Linux: curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs
```

### 2. 复制插件文件

```bash
# 创建 Claude 插件目录
mkdir -p ~/.claude/plugins

# 复制插件文件
cp -r wechat-content-writer ~/.claude/plugins/

# 或者复制到其他指定位置
cp -r wechat-content-writer /path/to/your/plugin/directory/
```

### 3. 验证安装

```bash
# 检查关键文件
ls -la ~/.claude/plugins/wechat-content-writer/
ls -la ~/.claude/plugins/wechat-content-writer/.claude-plugin/
ls -la ~/.claude/plugins/wechat-content-writer/skills/
ls -la ~/.claude/plugins/wechat-content-writer/commands/
ls -la ~/.claude/plugins/wechat-content-writer/agents/
```

## 🎯 验证安装

### 启动插件

```bash
# 方法1：启动时加载插件
claude --plugin-dir ~/.claude/plugins/wechat-content-writer

# 方法2：启动后加载插件
claude
/plugin-dir ~/.claude/plugins/wechat-content-writer
```

### 测试功能

安装成功后，你应该能看到以下功能：

#### 🔍 自动技能
- 询问"搜索文献"时自动触发 `literature-research` 技能
- 询问"分析PDF"时自动触发 `pdf-analysis` 技能

#### ⚡ 可用命令
```bash
/wechat-content-writer:search-content "AI最新研究"  # 搜索内容
/wechat-content-writer:create-article "标题"       # 创建文章
/wechat-content-writer:manage-categories list      # 管理分类
```

#### 🤖 智能代理
- `content-writer` 代理可用于专业内容创作

## 🗂️ 文件结构

安装后的插件结构：

```
wechat-content-writer/
├── .claude-plugin/
│   └── plugin.json              # 插件配置
├── .mcp.json                    # MCP 服务器配置
├── agents/
│   └── content-writer.md        # 内容创作代理
├── commands/
│   ├── search-content.md        # 搜索内容命令
│   ├── create-article.md        # 创建文章命令
│   └── manage-categories.md     # 管理分类命令
├── scripts/
│   ├── search-server.js         # 搜索服务器
│   └── test-plugin.js           # 测试脚本
└── skills/
    ├── literature-research/
    │   └── SKILL.md              # 文献研究技能
    └── pdf-analysis/
        └── SKILL.md              # PDF 分析技能
```

## 🔄 更新插件

### 使用安装脚本更新

```bash
# 重新运行安装脚本会自动备份现有安装
./install.sh  # Linux/macOS
.\install.ps1  # Windows
```

### 手动更新

```bash
# 备份现有安装
mv ~/.claude/plugins/wechat-content-writer ~/.claude/plugins/wechat-content-writer.backup

# 下载新版本并重新安装
git clone https://github.com/your-repo/wechat-content-writer.git
cp -r wechat-content-writer ~/.claude/plugins/
```

## 🐛 故障排除

### 常见问题

#### 1. 插件未被识别

**症状**: 启动 Claude Code 后看不到插件功能

**解决方案**:
```bash
# 检查插件路径是否正确
ls -la ~/.claude/plugins/wechat-content-writer/.claude-plugin/plugin.json

# 检查 Claude Code 版本
claude --version

# 尝试绝对路径加载
claude --plugin-dir /full/path/to/wechat-content-writer
```

#### 2. Node.js 版本过低

**症状**: 安装过程中提示 Node.js 版本不兼容

**解决方案**:
```bash
# 更新 Node.js 到最新 LTS 版本
# Windows: 下载并安装 https://nodejs.org/
# macOS: brew install node
# Linux:
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### 3. 权限问题

**症状**: 安装过程中出现权限错误

**解决方案**:
```bash
# Linux/macOS: 使用适当的权限
sudo chown -R $USER:$USER ~/.claude/

# Windows: 以管理员身份运行 PowerShell
# 右键点击 PowerShell -> "以管理员身份运行"
```

#### 4. MCP 服务器启动失败

**症状**: 搜索功能不可用

**解决方案**:
```bash
# 检查 Node.js 是否正确安装
node --version
npm --version

# 手动测试搜索服务器
cd ~/.claude/plugins/wechat-content-writer
node scripts/simple-search-server.js
```

### 日志和调试

#### 启用详细输出

```bash
# 安装时显示详细信息
./install.sh -v  # Linux/macOS
.\install.ps1 -v  # Windows
```

#### 检查插件状态

```bash
# 运行插件测试脚本
cd ~/.claude/plugins/wechat-content-writer
node scripts/test-plugin.js
```

## 📞 获取帮助

如果遇到问题，可以：

1. **查看日志**: 启用详细输出查看错误信息
2. **运行测试**: 使用内置测试脚本检查安装状态
3. **手动验证**: 检查关键文件是否存在且格式正确
4. **重新安装**: 卸载后重新安装插件

## 📚 更多资源

- **插件文档**: [README.md](README.md)
- **验证报告**: [PLUGIN_VALIDATION_REPORT.md](PLUGIN_VALIDATION_REPORT.md)
- **Claude Code 文档**: https://docs.anthropic.com/claude/docs/claude-code
- **Node.js 官网**: https://nodejs.org/

---

**安装完成后，你就可以开始使用 WeChat Content Writer 插件来创作高质量的公众号内容了！** 🎉