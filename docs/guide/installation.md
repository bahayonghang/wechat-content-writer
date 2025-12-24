# 安装配置

本文档详细介绍 WeChat Content Writer 插件的安装和配置步骤。

## 目录

- [环境准备](#环境准备)
- [插件安装](#插件安装)
- [搜索服务配置](#搜索服务配置)
- [插件配置](#插件配置)
- [高级配置](#高级配置)
- [故障排查](#故障排查)

## 环境准备

### Node.js 安装

插件需要 Node.js 14.0.0 或更高版本。

**检查版本：**
```bash
node --version
npm --version
```

**安装 Node.js：**

- **Windows**: 从 [nodejs.org](https://nodejs.org/) 下载安装包
- **macOS**: 使用 Homebrew `brew install node`
- **Linux**: 使用包管理器或 [nvm](https://github.com/nvm-sh/nvm)

### Claude Code 安装

确保已安装最新版本的 Claude Code CLI。

```bash
claude --version
```

## 插件安装

### 方式一：从 GitHub 克隆

```bash
git clone https://github.com/bahayonghang/wechat-content-writer.git
cd wechat-content-writer
npm install
```

### 方式二：从 Marketplace 安装

```bash
# 在 Claude Code 中执行
/plugin install wechat-content-writer
```

### 验证安装

```bash
# 检查插件配置
cat .claude-plugin/plugin.json

# 检查依赖
npm list --depth=0
```

## 搜索服务配置

搜索服务是插件的核心组件，提供文献搜索和内容分析能力。

### 启动服务

```bash
# 生产模式
npm start

# 开发模式（自动重载）
npm run dev
```

### 服务端点

| 端点 | 方法 | 功能 |
|------|------|------|
| `/health` | GET | 健康检查 |
| `/search/academic` | POST | 学术文献搜索 |
| `/search/web` | POST | 通用网页搜索 |
| `/analyze/content` | POST | 内容分析 |

### 环境变量配置

创建 `.env` 文件（可选）：

```bash
# 服务端口（默认 3001）
PORT=3001

# Google Scholar API（可选，用于增强搜索）
SEARCH_API_KEY=your_api_key_here

# 日志级别
LOG_LEVEL=info
```

### MCP 配置

插件通过 MCP 协议与搜索服务通信，配置文件为 `.mcp.json`：

```json
{
  "mcpServers": {
    "web-search": {
      "command": "node",
      "args": ["${CLAUDE_PLUGIN_ROOT}/scripts/simple-search-server.js"],
      "env": {
        "PORT": "3001",
        "LOG_LEVEL": "info"
      }
    }
  }
}
```

## 插件配置

主配置文件为 `config.json`，包含所有插件行为设置。

### 完整配置示例

```json
{
  "version": "1.0.0",
  "plugin_name": "wechat-content-writer",
  "content_directories": {
    "base_path": "../../wechat_doc",
    "categories": {
      "AI工业应用": "AI工业应用",
      "文献解读": "文献解读",
      "AI-Coding": "AI-Coding",
      "技术分享": "技术分享",
      "行业动态": "行业动态"
    }
  },
  "file_naming": {
    "pattern": "{category}/{date}_{title}.md",
    "date_format": "YYYY-MM-DD"
  },
  "mcp_servers": {
    "web-search": {
      "command": "node",
      "args": ["${CLAUDE_PLUGIN_ROOT}/scripts/simple-search-server.js"],
      "env": {
        "PORT": "3001"
      }
    }
  },
  "auto_create_directories": true,
  "content_validation": true
}
```

### 配置项说明

#### content_directories

| 字段 | 类型 | 说明 |
|------|------|------|
| `base_path` | string | 内容目录相对路径 |
| `categories` | object | 文章分类映射 |

#### file_naming

| 字段 | 类型 | 说明 |
|------|------|------|
| `pattern` | string | 文件命名模式，支持占位符 |
| `date_format` | string | 日期格式 |

占位符说明：
- `{category}`: 文章分类
- `{date}`: 当前日期
- `{title}`: 文章标题（自动清理特殊字符）

#### 其他配置

| 配置项 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| `auto_create_directories` | boolean | true | 自动创建分类目录 |
| `content_validation` | boolean | true | 启用内容验证 |

## 高级配置

### 自定义分类

添加新的文章分类：

1. 编辑 `config.json`：

```json
"categories": {
  "AI工业应用": "AI工业应用",
  "文献解读": "文献解读",
  "AI-Coding": "AI-Coding",
  "技术分享": "技术分享",
  "行业动态": "行业动态",
  "产品评测": "产品评测"  // 新增
}
```

2. 创建对应目录：

```bash
mkdir -p ../../wechat_doc/产品评测
```

### 自定义文件命名

修改文件命名格式：

```json
"file_naming": {
  "pattern": "{category}/{date}_{title}.md",
  "date_format": "YYYY-MM-DD"
}
```

其他命名模式示例：

- `{category}/{title}_{date}.md` - 标题在前
- `{date}/{category}/{title}.md` - 日期作为顶层目录
- `{category}/{title}.md` - 不包含日期

### 代理设置

如果网络环境需要代理，配置搜索服务使用代理：

```bash
# .env 文件
HTTP_PROXY=http://proxy.example.com:8080
HTTPS_PROXY=http://proxy.example.com:8080
```

### 搜索源配置

在 `scripts/search-server.js` 中配置搜索源：

```javascript
const SEARCH_CONFIG = {
  sources: [
    {
      name: 'arxiv',
      baseUrl: 'http://export.arxiv.org/api/query',
      type: 'academic'
    },
    {
      name: 'google-scholar',
      baseUrl: 'https://serpapi.com/search',
      type: 'academic',
      requiresApiKey: true
    }
  ]
};
```

## 故障排查

### 问题：服务无法启动

**症状：**
```
Error: listen EADDRINUSE: address already in use :::3001
```

**解决方案：**
```bash
# 查找占用端口的进程
# Windows
netstat -ano | findstr :3001

# Linux/Mac
lsof -i :3001

# 杀死进程或更换端口
PORT=3002 npm start
```

### 问题：npm install 失败

**症状：**
```
npm ERR! network request failed
```

**解决方案：**
```bash
# 使用国内镜像
npm config set registry https://registry.npmmirror.com

# 或临时使用
npm install --registry=https://registry.npmmirror.com
```

### 问题：插件命令不生效

**检查清单：**
1. 搜索服务是否正在运行
2. `.mcp.json` 配置是否正确
3. 插件目录路径是否正确
4. Claude Code 版本是否最新

**调试命令：**
```bash
# 测试搜索服务
curl http://localhost:3001/health

# 查看 Claude Code 日志
claude --verbose
```

### 问题：内容目录未创建

**解决方案：**
```bash
# 手动创建内容目录
mkdir -p ../../wechat_doc
mkdir -p ../../wechat_doc/AI工业应用
mkdir -p ../../wechat_doc/文献解读
mkdir -p ../../wechat_doc/AI-Coding
mkdir -p ../../wechat_doc/技术分享
mkdir -p ../../wechat_doc/行业动态
```

## 下一步

安装配置完成后，请继续阅读：

- [命令参考](./commands.md) - 了解所有可用命令
- [技能使用](./skills.md) - 学习自动技能的使用
- [写作风格指南](./writing-style.md) - 掌握客观写作规范
