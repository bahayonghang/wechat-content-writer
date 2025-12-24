# 配置说明

本文档详细说明了插件的所有配置选项和自定义方法。

## 目录

- [配置文件概览](#配置文件概览)
- [插件配置 (config.json)](#插件配置-configjson)
- [MCP 配置 (.mcp.json)](#mcp-配置-mcpjson)
- [环境变量](#环境变量)
- [包配置 (package.json)](#包配置-packagejson)
- [高级配置](#高级配置)

## 配置文件概览

| 文件 | 位置 | 用途 |
|------|------|------|
| `config.json` | 插件根目录 | 插件主配置 |
| `.mcp.json` | 插件根目录 | MCP 服务器配置 |
| `package.json` | 插件根目录 | NPM 包配置 |
| `.env` | 插件根目录（可选） | 环境变量 |

---

## 插件配置 config.json

插件的主配置文件，控制内容生成、文件组织和分类管理。

### 完整示例

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

### 配置项详解

#### version

插件配置版本号，用于配置迁移。

```json
"version": "1.0.0"
```

#### plugin_name

插件唯一标识名称。

```json
"plugin_name": "wechat-content-writer"
```

#### content_directories

内容目录配置。

```json
"content_directories": {
  "base_path": "../../wechat_doc",
  "categories": {
    "显示名称": "目录名称"
  }
}
```

| 字段 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `base_path` | string | ✅ | 内容目录相对路径 |
| `categories` | object | ✅ | 分类映射 |

**base_path 说明**:
- 相对于插件目录的路径
- 建议使用 `../../wechat_doc` 保持内容与插件分离
- 支持绝对路径

**categories 说明**:
- 键：用户界面显示的分类名称
- 值：实际目录名称
- 支持中文目录名

#### file_naming

文件命名模式配置。

```json
"file_naming": {
  "pattern": "{category}/{date}_{title}.md",
  "date_format": "YYYY-MM-DD"
}
```

| 字段 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `pattern` | string | ✅ | 文件命名模式 |
| `date_format` | string | ✅ | 日期格式 |

**占位符**:

| 占位符 | 替换内容 | 示例 |
|--------|----------|------|
| `{category}` | 文章分类 | `文献解读` |
| `{date}` | 当前日期 | `2024-12-24` |
| `{title}` | 文章标题 | `深度学习研究` |

**其他命名模式**:

```json
// 标题在前
"pattern": "{category}/{title}_{date}.md"

// 日期作为顶层目录
"pattern": "{date}/{category}/{title}.md"

// 不包含日期
"pattern": "{category}/{title}.md"

// 包含时间戳
"pattern": "{category}/{timestamp}_{title}.md"
```

#### mcp_servers

MCP 服务器配置（与 `.mcp.json` 保持同步）。

```json
"mcp_servers": {
  "web-search": {
    "command": "node",
    "args": ["${CLAUDE_PLUGIN_ROOT}/scripts/simple-search-server.js"],
    "env": {
      "PORT": "3001",
      "LOG_LEVEL": "info"
    }
  }
}
```

#### auto_create_directories

自动创建不存在的目录。

```json
"auto_create_directories": true
```

- `true`: 自动创建
- `false`: 需要手动创建

#### content_validation

启用内容验证。

```json
"content_validation": true
```

验证项包括：
- 文章标题非空
- 分类存在
- Markdown 格式正确

---

## MCP 配置 .mcp.json

MCP (Model Context Protocol) 服务器配置文件。

### 完整示例

```json
{
  "mcpServers": {
    "web-search": {
      "command": "node",
      "args": [
        "${CLAUDE_PLUGIN_ROOT}/scripts/simple-search-server.js"
      ],
      "env": {
        "PORT": "3001",
        "NODE_ENV": "production"
      }
    }
  }
}
```

### 配置项详解

#### mcpServers

MCP 服务器列表。

```json
"mcpServers": {
  "服务器名称": {
    "command": "执行命令",
    "args": ["参数数组"],
    "env": { "环境变量": "值" }
  }
}
```

#### 环境变量

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `PORT` | 3001 | 搜索服务端口 |
| `NODE_ENV` | production | 运行环境 |
| `LOG_LEVEL` | info | 日志级别 |

---

## 环境变量

可通过 `.env` 文件配置（需安装 `dotenv` 包）。

### 环境变量列表

| 变量 | 说明 | 默认值 |
|------|------|--------|
| `PORT` | 服务端口 | 3001 |
| `NODE_ENV` | 运行环境 | production |
| `LOG_LEVEL` | 日志级别 | info |
| `SEARCH_API_KEY` | 搜索 API 密钥 | - |

### .env 文件示例

```bash
# 服务配置
PORT=3001
NODE_ENV=production
LOG_LEVEL=info

# API 密钥（可选）
SEARCH_API_KEY=your_api_key_here
```

### 日志级别

| 级别 | 说明 |
|------|------|
| `error` | 仅错误 |
| `warn` | 警告和错误 |
| `info` | 信息、警告和错误 |
| `debug` | 调试信息 |
| `trace` | 详细追踪 |

---

## 包配置 package.json

NPM 包配置文件。

### 完整示例

```json
{
  "name": "wechat-content-writer",
  "version": "1.0.0",
  "description": "WeChat content creation plugin",
  "main": "scripts/search-server.js",
  "scripts": {
    "start": "node scripts/search-server.js",
    "dev": "nodemon scripts/search-server.js",
    "test": "node scripts/test-server.js"
  },
  "keywords": [
    "wechat",
    "content-creation",
    "claude-code-plugin"
  ],
  "author": "WeChat Content Creator",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.2",
    "cors": "^2.8.5",
    "axios": "^1.6.2",
    "jsdom": "^23.0.1"
  },
  "devDependencies": {
    "nodemon": "^3.0.2"
  },
  "engines": {
    "node": ">=14.0.0"
  }
}
```

### 脚本命令

| 命令 | 说明 |
|------|------|
| `npm start` | 启动搜索服务 |
| `npm run dev` | 开发模式（自动重载） |
| `npm test` | 运行测试 |

---

## 高级配置

### 自定义搜索源

编辑 `scripts/search-server.js`：

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
    },
    // 添加自定义数据源
    {
      name: 'custom-source',
      baseUrl: 'https://api.example.com/search',
      type: 'custom'
    }
  ]
};
```

### 自定义文章模板

创建 `templates/` 目录并添加模板文件：

```markdown
<!-- templates/custom-template.md -->
---
title: "{{title}}"
category: "{{category}}"
date: "{{date}}"
---

# {{title}}

{{content}}

## 参考资料

{{references}}
```

### 代理配置

如果需要通过代理访问外部服务：

```bash
# .env 文件
HTTP_PROXY=http://proxy.example.com:8080
HTTPS_PROXY=http://proxy.example.com:8080
NO_PROXY=localhost,127.0.0.1
```

### 缓存配置

配置搜索结果缓存：

```javascript
// scripts/search-server.js
const CACHE_CONFIG = {
  enabled: true,
  ttl: 300000,  // 5分钟（毫秒）
  maxSize: 100  // 最大缓存条目数
};
```

---

## 配置验证

### 验证命令

```bash
# 验证配置文件格式
cat config.json | jq .

# 验证 MCP 配置
cat .mcp.json | jq .

# 测试搜索服务
curl http://localhost:3001/health
```

### 常见配置错误

| 错误 | 原因 | 解决方案 |
|------|------|----------|
| `base_path` 错误 | 相对路径不正确 | 检查路径层级 |
| 分类不存在 | 分类未创建 | 设置 `auto_create_directories: true` |
| MCP 连接失败 | 端口冲突 | 更换端口或杀死占用进程 |
| JSON 格式错误 | 语法错误 | 使用 `jq` 验证 |

---

## 配置最佳实践

1. **使用版本控制**
   - 将配置文件纳入版本控制
   - `.env` 文件使用示例模板

2. **环境分离**
   - 开发/生产环境使用不同配置
   - 通过环境变量控制

3. **文档同步**
   - 配置变更时更新文档
   - 添加配置说明注释

4. **验证优先**
   - 配置修改后先验证
   - 使用测试命令检查

## 下一步

- [API 参考](./api.md) - 搜索服务 API 文档
- [插件开发](./plugin-development.md) - 开发者指南
- [架构设计](./architecture.md) - 系统架构说明
