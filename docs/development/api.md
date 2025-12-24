# 搜索服务 API

本文档详细说明了搜索服务器的 API 端点、请求格式和响应结构。

## 目录

- [概述](#概述)
- [端点列表](#端点列表)
- [健康检查](#健康检查)
- [学术文献搜索](#学术文献搜索)
- [网页搜索](#网页搜索)
- [内容分析](#内容分析)
- [错误处理](#错误处理)

## 概述

搜索服务器是一个基于 Express.js 的 REST API，提供文献搜索和内容分析能力。

### 基本信息

| 属性 | 值 |
|------|-----|
| 基础URL | `http://localhost:3001` |
| 协议 | HTTP |
| 数据格式 | JSON |
| 编码 | UTF-8 |

### 默认端口

| 环境 | 默认端口 |
|------|----------|
| 开发 | 3001 |
| 生产 | 3001 (可通过环境变量配置) |

---

## 端点列表

| 端点 | 方法 | 描述 |
|------|------|------|
| `/health` | GET | 健康检查 |
| `/search/academic` | POST | 学术文献搜索 |
| `/search/web` | POST | 通用网页搜索 |
| `/analyze/content` | POST | 内容分析 |

---

## 健康检查

检查服务运行状态。

### 请求

```http
GET /health
```

### 响应

```json
{
  "status": "healthy",
  "timestamp": "2024-12-24T11:34:12.000Z"
}
```

### 状态码

| 状态码 | 说明 |
|--------|------|
| 200 | 服务正常 |
| 503 | 服务不可用 |

### 示例

```bash
curl http://localhost:3001/health
```

---

## 学术文献搜索

搜索 arXiv 和 Google Scholar 的学术文献。

### 请求

```http
POST /search/academic
Content-Type: application/json

{
  "query": "string",
  "limit": 10,
  "fields": ["computer-science", "artificial-intelligence"]
}
```

### 请求参数

| 参数 | 类型 | 必需 | 默认值 | 说明 |
|------|------|------|--------|------|
| `query` | string | ✅ | - | 搜索关键词 |
| `limit` | number | ❌ | 10 | 返回结果数量 (1-50) |
| `fields` | string[] | ❌ | ["cs.AI"] | arXiv 分类字段 |

### 响应

```json
{
  "query": "multimodal learning",
  "totalResults": 15,
  "results": [
    {
      "id": "http://arxiv.org/abs/2301.00001",
      "title": "Multimodal Learning with Transformers",
      "summary": "This paper presents...",
      "authors": ["Author Name", "Co-Author"],
      "published": "2024-01-15T00:00:00Z",
      "categories": ["cs.AI", "cs.LG"],
      "link": "http://arxiv.org/abs/2301.00001",
      "source": "arxiv"
    }
  ],
  "sources": ["arxiv", "google-scholar"]
}
```

### 响应字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `query` | string | 搜索关键词 |
| `totalResults` | number | 结果总数 |
| `results` | array | 文献列表 |
| `sources` | string[] | 使用的数据源 |

### 结果对象字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `id` | string | 文献唯一标识 |
| `title` | string | 标题 |
| `summary` | string | 摘要 |
| `authors` | string[] | 作者列表 |
| `published` | string | 发表时间 (ISO 8601) |
| `categories` | string[] | arXiv 分类 |
| `link` | string | 文献链接 |
| `source` | string | 数据来源 |

### arXiv 分类字段

| 分类 | 说明 |
|------|------|
| `cs.AI` | 人工智能 |
| `cs.CL` | 计算语言学 |
| `cs.CV` | 计算机视觉 |
| `cs.LG` | 机器学习 |
| `cs.NE` | 神经网络 |

### 示例

```bash
curl -X POST http://localhost:3001/search/academic \
  -H "Content-Type: application/json" \
  -d '{
    "query": "multimodal learning",
    "limit": 5,
    "fields": ["cs.AI", "cs.LG"]
  }'
```

### JavaScript 示例

```javascript
const response = await fetch('http://localhost:3001/search/academic', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    query: 'multimodal learning',
    limit: 10,
    fields: ['cs.AI', 'cs.LG']
  })
});

const data = await response.json();
console.log(data.results);
```

---

## 网页搜索

通用网页内容搜索。

### 请求

```http
POST /search/web
Content-Type: application/json

{
  "query": "string",
  "limit": 10,
  "language": "zh-CN"
}
```

### 请求参数

| 参数 | 类型 | 必需 | 默认值 | 说明 |
|------|------|------|--------|------|
| `query` | string | ✅ | - | 搜索关键词 |
| `limit` | number | ❌ | 10 | 返回结果数量 |
| `language` | string | ❌ | "zh-CN" | 语言代码 |

### 响应

```json
{
  "query": "深度学习应用",
  "totalResults": 8,
  "results": [
    {
      "title": "深度学习在医疗领域的应用",
      "url": "https://example.com/article",
      "snippet": "深度学习技术...",
      "published": "2024-01-15T00:00:00Z",
      "source": "example.com"
    }
  ],
  "searchMethod": "api"
}
```

### 响应字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `query` | string | 搜索关键词 |
| `totalResults` | number | 结果总数 |
| `results` | array | 结果列表 |
| `searchMethod` | string | 搜索方法 (api/free) |

### 结果对象字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `title` | string | 标题 |
| `url` | string | 页面链接 |
| `snippet` | string | 内容摘要 |
| `published` | string | 发布时间 |
| `source` | string | 来源网站 |

### 示例

```bash
curl -X POST http://localhost:3001/search/web \
  -H "Content-Type: application/json" \
  -d '{
    "query": "深度学习应用",
    "limit": 5,
    "language": "zh-CN"
  }'
```

---

## 内容分析

分析指定 URL 的内容。

### 请求

```http
POST /analyze/content
Content-Type: application/json

{
  "url": "string",
  "contentType": "article"
}
```

### 请求参数

| 参数 | 类型 | 必需 | 默认值 | 说明 |
|------|------|------|--------|------|
| `url` | string | ✅ | - | 目标 URL |
| `contentType` | string | ❌ | "article" | 内容类型 |

### 内容类型

| 类型 | 说明 |
|------|------|
| `article` | 文章内容 |
| `blog` | 博客文章 |
| `news` | 新闻内容 |
| `documentation` | 技术文档 |

### 响应

```json
{
  "url": "https://example.com/article",
  "contentType": "article",
  "analysis": {
    "title": "文章标题",
    "description": "文章描述",
    "keywords": "关键词1, 关键词2",
    "contentLength": 5000,
    "wordCount": 800,
    "contentType": "academic",
    "language": "zh-CN",
    "readabilityScore": "moderate",
    "keyTopics": ["topic1", "topic2", "topic3"]
  },
  "timestamp": "2024-12-24T11:34:12.000Z"
}
```

### 分析字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `title` | string | 页面标题 |
| `description` | string | 页面描述 |
| `keywords` | string | 关键词 |
| `contentLength` | number | 内容字符数 |
| `wordCount` | number | 单词数 |
| `contentType` | string | 检测的内容类型 |
| `language` | string | 检测的语言 |
| `readabilityScore` | string | 可读性评分 |
| `keyTopics` | string[] | 关键主题 |

### 内容类型检测

| 类型 | 检测条件 |
|------|----------|
| `academic` | 包含 abstract、methodology、results |
| `tutorial` | 包含 step、tutorial、how to |
| `news` | 包含 breaking、latest、report |
| `documentation` | 包含 function、class、API |

### 可读性评分

| 等级 | 说明 |
|------|------|
| `easy` | 简单，平均每句 < 10 词 |
| `moderate` | 中等，平均每句 10-20 词 |
| `difficult` | 困难，平均每句 > 20 词 |

### 示例

```bash
curl -X POST http://localhost:3001/analyze/content \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://arxiv.org/abs/2301.00001",
    "contentType": "article"
  }'
```

---

## 错误处理

### 错误响应格式

```json
{
  "error": "错误类型",
  "message": "详细错误信息",
  "details": "附加详情"
}
```

### HTTP 状态码

| 状态码 | 说明 |
|--------|------|
| 200 | 请求成功 |
| 400 | 请求参数错误 |
| 404 | 资源不存在 |
| 500 | 服务器内部错误 |

### 错误类型

| 错误 | 说明 |
|------|------|
| `ValidationError` | 参数验证失败 |
| `SearchFailed` | 搜索失败 |
| `AnalysisFailed` | 内容分析失败 |
| `InternalServerError` | 服务器错误 |

### 示例错误响应

```json
{
  "error": "ValidationError",
  "message": "Query parameter is required",
  "details": "The 'query' field must be provided in the request body"
}
```

---

## 使用限制

### 速率限制

| 端点 | 限制 |
|------|------|
| `/search/academic` | 10 请求/分钟 |
| `/search/web` | 20 请求/分钟 |
| `/analyze/content` | 15 请求/分钟 |

### 请求大小限制

| 限制 | 值 |
|------|-----|
| 最大请求体 | 1 MB |
| 最大 URL 长度 | 2048 字符 |
| 最大查询长度 | 500 字符 |

---

## 最佳实践

### 1. 错误重试

```javascript
async function searchWithRetry(query, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      const response = await fetch('http://localhost:3001/search/academic', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query, limit: 10 })
      });

      if (response.ok) {
        return await response.json();
      }

      // 可重试的错误状态码
      if (response.status >= 500 || response.status === 429) {
        await new Promise(resolve => setTimeout(resolve, 1000 * (i + 1)));
        continue;
      }

      throw new Error(`Search failed: ${response.status}`);
    } catch (error) {
      if (i === maxRetries - 1) throw error;
    }
  }
}
```

### 2. 批量搜索

```javascript
async function batchSearch(queries, concurrency = 3) {
  const results = [];

  for (let i = 0; i < queries.length; i += concurrency) {
    const batch = queries.slice(i, i + concurrency);
    const batchResults = await Promise.all(
      batch.map(query => searchWithRetry(query))
    );
    results.push(...batchResults);
  }

  return results;
}
```

### 3. 结果缓存

```javascript
const cache = new Map();

async function cachedSearch(query) {
  if (cache.has(query)) {
    return cache.get(query);
  }

  const result = await searchWithRetry(query);
  cache.set(query, result);

  // 5分钟后过期
  setTimeout(() => cache.delete(query), 5 * 60 * 1000);

  return result;
}
```

## 下一步

- [架构设计](./architecture.md) - 了解系统架构
- [配置说明](./configuration.md) - 服务配置参考
- [插件开发](./plugin-development.md) - 开发者指南
