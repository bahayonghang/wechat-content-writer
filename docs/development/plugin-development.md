# 插件开发

本文档为插件开发者提供详细的开发指南和最佳实践。

## 目录

- [开发环境搭建](#开发环境搭建)
- [项目结构](#项目结构)
- [添加新命令](#添加新命令)
- [添加新技能](#添加新技能)
- [添加新代理](#添加新代理)
- [测试](#测试)
- [发布](#发布)

## 开发环境搭建

### 前置要求

| 工具 | 最低版本 | 推荐版本 |
|------|----------|----------|
| Node.js | 14.0.0 | 18.0.0+ |
| npm | 6.0.0 | 9.0.0+ |
| Claude Code | 最新版 | 最新版 |

### 安装步骤

```bash
# 1. 克隆仓库
git clone https://github.com/bahayonghang/wechat-content-writer.git
cd wechat-content-writer

# 2. 安装依赖
npm install

# 3. 启动开发服务器
npm run dev

# 4. 在另一个终端启动 Claude Code
claude --plugin-dir /path/to/wechat-content-writer
```

### 推荐工具

- **VS Code**: 推荐的代码编辑器
- **ESLint**: JavaScript 代码检查
- **Prettier**: 代码格式化

---

## 项目结构

```
wechat-content-writer/
├── .claude-plugin/           # 插件元数据
│   └── plugin.json          # 插件定义
├── agents/                   # AI 代理
│   └── content-writer.md    # 内容创作代理
├── commands/                 # 斜杠命令
│   ├── create-paper.md
│   ├── create-article.md
│   └── ...
├── skills/                   # 自动技能
│   ├── literature-research/
│   │   └── SKILL.md
│   ├── pdf-analysis/
│   │   └── SKILL.md
│   └── pdf-analysis-objective/
│       └── SKILL.md
├── scripts/                  # 服务脚本
│   ├── search-server.js     # 主搜索服务
│   ├── simple-search-server.js
│   └── test-server.js
├── templates/               # 文章模板（可选）
│   └── custom-template.md
├── config.json              # 插件配置
├── .mcp.json                # MCP 服务器配置
└── package.json             # NPM 包配置
```

---

## 添加新命令

命令是用户可以直接调用的功能入口点。

### 命令文件结构

```markdown
---
command: new-command
description: 命令描述
parameters:
  - name: param1
    description: 参数1描述
    required: true
    type: string
  - name: param2
    description: 参数2描述
    required: false
    type: string
    default: "默认值"
examples:
  - /new-command "示例1"
  - /new-command "示例2" --param2 "值"
---

# 命令标题

命令的详细说明...

## 使用方法

描述如何使用该命令...

## 输出格式

描述命令的输出格式...

## 注意事项

使用该命令时需要注意...
```

### 命令开发步骤

1. **创建命令文件**

```bash
# 在 commands/ 目录创建新文件
touch commands/your-command.md
```

2. **编写命令定义**

```markdown
---
command: analyze-trend
description: 分析技术趋势
parameters:
  - name: topic
    description: 技术主题
    required: true
    type: string
  - name: timeframe
    description: 时间范围
    required: false
    type: string
    default: "1year"
examples:
  - /analyze-trend "大语言模型"
  - /analyze-trend "自动驾驶" --timeframe "6months"
---

# 技术趋势分析

分析指定技术主题的发展趋势...
```

3. **实现命令逻辑**

在 `scripts/` 目录添加实现文件：

```javascript
// scripts/analyze-trend.js
const axios = require('axios');

async function analyzeTrend(topic, timeframe = '1year') {
  // 调用搜索服务
  const response = await axios.post('http://localhost:3001/search/web', {
    query: `${topic} 趋势 ${timeframe}`,
    limit: 10
  });

  // 分析结果
  const results = response.data.results;
  const trends = analyzeTrends(results);

  return {
    topic,
    timeframe,
    trends,
    summary: generateSummary(trends)
  };
}

function analyzeTrends(results) {
  // 实现趋势分析逻辑
  return results.map(r => ({
    title: r.title,
    date: r.published,
    relevance: calculateRelevance(r)
  }));
}

function generateSummary(trends) {
  // 生成趋势摘要
  return trends.map(t => t.title).join('\n');
}

module.exports = { analyzeTrend };
```

4. **注册命令（如果需要）**

在 `config.json` 添加命令配置：

```json
{
  "commands": {
    "analyze-trend": {
      "handler": "./scripts/analyze-trend.js",
      "enabled": true
    }
  }
}
```

### 命令最佳实践

- ✅ 使用清晰的命令名称
- ✅ 提供详细的参数说明
- ✅ 包含多个使用示例
- ✅ 处理错误情况
- ✅ 提供有意义的错误消息

---

## 添加新技能

技能是通过关键词自动触发的功能。

### 技能文件结构

```markdown
---
skill: your-skill-name
description: 技能描述
triggers:
  - "触发词1"
  - "触发词2"
  - "trigger word 3"
examples:
  - "用户输入示例1"
  - "用户输入示例2"
---

# 技能标题

技能的详细说明...

## 触发条件

描述何时触发该技能...

## 工作流程

1. 步骤一
2. 步骤二
3. 步骤三

## 输出格式

描述技能的输出格式...
```

### 技能开发步骤

1. **创建技能目录**

```bash
# 在 skills/ 目录创建新目录
mkdir skills/your-skill-name
```

2. **创建技能文件**

```markdown
---
skill: code-explainer
description: 代码解释技能
triggers:
  - "解释这段代码"
  - "explain this code"
  - "代码分析"
examples:
  - "解释这段代码：[代码片段]"
  - "explain this code: function test() { return true; }"
---

# 代码解释技能

自动分析并解释代码片段的功能...

## 功能特点

- 语法分析
- 功能解释
- 最佳实践建议
```

3. **添加技能逻辑**

```javascript
// skills/code-explainer/handler.js
function analyzeCode(code, language) {
  // 识别编程语言
  const detectedLang = detectLanguage(code);

  // 分析代码结构
  const structure = parseStructure(code);

  // 生成解释
  const explanation = generateExplanation(structure);

  return {
    language: detectedLang,
    structure,
    explanation,
    suggestions: generateSuggestions(structure)
  };
}

function detectLanguage(code) {
  // 实现语言检测
}

function parseStructure(code) {
  // 实现代码结构解析
}

function generateExplanation(structure) {
  // 生成代码解释
}

function generateSuggestions(structure) {
  // 生成改进建议
}

module.exports = { analyzeCode };
```

4. **添加示例文件**

```markdown
<!-- skills/code-explainer/examples/basic-usage.md -->
# 基本用法示例

## 输入

```
解释这段代码：def hello(): print("Hello")
```

## 输出

```markdown
## 代码分析

**语言**: Python

**功能**: 定义一个打印问候语的函数

**代码结构**:
- 函数名: `hello`
- 无参数
- 打印 "Hello" 到控制台
```
```

---

## 添加新代理

代理用于处理复杂的多步骤任务。

### 代理文件结构

```markdown
---
agent: your-agent-name
description: 代理描述
capabilities:
  - 能力1
  - 能力2
  - 能力3
tools:
  - Read
  - Write
  - Edit
  - WebSearch
examples:
  - "任务示例1"
  - "任务示例2"
---

# 代理标题

代理的详细说明...

## 能力

描述代理的能力范围...

## 工作流程

描述代理如何完成复杂任务...

## 使用指南

如何有效使用该代理...
```

### 代理开发步骤

1. **创建代理文件**

```bash
# 在 agents/ 目录创建新文件
touch agents/your-agent.md
```

2. **编写代理定义**

```markdown
---
agent: research-analyst
description: 深度研究分析代理
capabilities:
  - 文献调研
  - 数据分析
  - 趋势预测
  - 报告生成
tools:
  - Read
  - Write
  - Edit
  - WebSearch
  - mcp__web-search-exa
  - mcp__exa__get-code-context-exa
examples:
  - "分析大语言模型在医疗领域的应用现状和发展趋势"
  - "研究强化学习在机器人控制中的最新进展"
---

# 研究分析代理

专业的深度研究分析代理，能够进行全面的文献调研和趋势分析...

## 工作流程

1. 需求分析
2. 文献搜索
3. 内容筛选
4. 深度分析
5. 报告生成

## 输出格式

生成结构化的研究报告，包含：
- 执行摘要
- 研究方法
- 分析结果
- 结论与建议
```

---

## 测试

### 单元测试

```javascript
// tests/commands.test.js
const { analyzeTrend } = require('../scripts/analyze-trend');

describe('analyzeTrend', () => {
  test('should return trend analysis', async () => {
    const result = await analyzeTrend('AI', '6months');

    expect(result).toHaveProperty('topic', 'AI');
    expect(result).toHaveProperty('timeframe', '6months');
    expect(result).toHaveProperty('trends');
    expect(Array.isArray(result.trends)).toBe(true);
  });

  test('should handle invalid topic', async () => {
    await expect(analyzeTrend('')).rejects.toThrow();
  });
});
```

### 集成测试

```bash
# 测试搜索服务
curl http://localhost:3001/health

# 测试搜索端点
curl -X POST http://localhost:3001/search/academic \
  -H "Content-Type: application/json" \
  -d '{"query": "test", "limit": 5}'
```

### 运行测试

```bash
# 运行所有测试
npm test

# 运行特定测试文件
npm test -- tests/commands.test.js

# 运行测试并生成覆盖率报告
npm test -- --coverage
```

---

## 发布

### 版本管理

遵循语义化版本规范：

- **主版本号**: 不兼容的 API 变更
- **次版本号**: 向下兼容的功能新增
- **修订号**: 向下兼容的问题修正

### 发布步骤

1. **更新版本号**

```bash
# 更新 package.json 版本
npm version patch  # 或 minor, major
```

2. **更新 CHANGELOG**

```markdown
## [1.1.0] - 2024-12-24

### Added
- 新增 analyze-trend 命令
- 新增 code-explainer 技能

### Fixed
- 修复搜索服务超时问题

### Changed
- 优化文章生成性能
```

3. **构建和测试**

```bash
npm run build
npm test
```

4. **发布到 GitHub**

```bash
git tag v1.1.0
git push origin v1.1.0
git push origin main
```

5. **发布到 npm（如果适用）**

```bash
npm publish
```

---

## 最佳实践

### 代码风格

- 使用 ESLint 进行代码检查
- 使用 Prettier 进行代码格式化
- 遵循 Airbnb JavaScript 风格指南

### 文档规范

- 所有公开 API 必须有 JSDoc 注释
- 复杂逻辑必须添加注释说明
- 更新时同步更新文档

### 错误处理

```javascript
async function safeExecute(operation) {
  try {
    return await operation();
  } catch (error) {
    console.error('Operation failed:', error);
    // 返回有意义的错误信息
    return {
      error: true,
      message: error.message,
      suggestion: '请检查输入参数后重试'
    };
  }
}
```

### 日志记录

```javascript
const logger = {
  info: (msg) => console.log(`[INFO] ${msg}`),
  warn: (msg) => console.warn(`[WARN] ${msg}`),
  error: (msg) => console.error(`[ERROR] ${msg}`)
};

logger.info('Processing request...');
logger.error('Request failed');
```

## 下一步

- [API 参考](./api.md) - 搜索服务 API 文档
- [架构设计](./architecture.md) - 系统架构说明
- [贡献指南](./contributing.md) - 如何贡献代码
