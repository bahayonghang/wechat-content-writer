# Marketplace 部署指南

## 方案选择

### 方案 A：在插件仓库中直接包含 marketplace.json（已完成）

**已创建文件：** `wechat-content-writer/.claude-plugin/marketplace.json`

**优点：** 一个仓库搞定，维护简单
**缺点：** 插件和 marketplace 混在一起

### 方案 B：创建独立的 marketplace 仓库（推荐）

**新建仓库：** `bahayonghang/wechat-marketplace`

**优点：**
- 清晰分离，符合 marketplace 设计理念
- 未来可以添加更多插件到同一个 marketplace

---

## 部署步骤

### 步骤 1：推送插件仓库到 GitHub

```bash
# 在插件目录中
cd wechat-content-writer

# 初始化 Git（如果还没有）
git init

# 添加远程仓库
git remote add origin https://github.com/bahayonghang/wechat-content-writer.git

# 添加所有文件
git add .
git commit -m "Initial commit: WeChat Content Writer plugin with marketplace config"

# 推送
git push -u origin main
```

### 步骤 2：在 Claude Code 中安装

```bash
# 添加你的 marketplace
/plugin marketplace add bahayonghang/wechat-content-writer

# 安装插件
/plugin install wechat-content-writer@wechat-content-writer-marketplace
```

---

## 如果使用方案 B（独立 marketplace 仓库）

### 创建新仓库 `bahayonghang/wechat-marketplace`

**仓库结构：**
```
wechat-marketplace/
├── .claude-plugin/
│   └── marketplace.json
└── README.md
```

**marketplace.json 内容：**
```json
{
  "name": "wechat-marketplace",
  "owner": {
    "name": "bahayonghang",
    "email": "your-email@example.com"
  },
  "metadata": {
    "description": "Personal Claude Code plugins marketplace for WeChat content creation",
    "version": "1.0.0"
  },
  "plugins": [
    {
      "name": "wechat-content-writer",
      "source": {
        "source": "url",
        "url": "https://github.com/bahayonghang/wechat-content-writer.git"
      },
      "description": "Professional WeChat content creation plugin with literature search, PDF analysis, and automated article generation",
      "version": "1.0.0",
      "strict": true
    }
  ]
}
```

**安装方式：**
```bash
# 添加你的独立 marketplace
/plugin marketplace add bahayonghang/wechat-marketplace

# 安装插件
/plugin install wechat-content-writer@wechat-marketplace
```

---

## 验证安装

安装成功后，应该能看到以下命令：

```bash
# 应该显示以下命令
/wechat-content-writer:create-article
/wechat-content-writer:create-article-objective
/wechat-content-writer:search-content
/wechat-content-writer:manage-categories
```

---

## 推荐方案

**如果你只有一个插件** → 使用方案 A（已配置好）
**如果你计划发布多个插件** → 使用方案 B（创建独立 marketplace）

---

## 更新插件

用户可以通过以下命令更新插件：

```bash
/plugin update wechat-content-writer
```
