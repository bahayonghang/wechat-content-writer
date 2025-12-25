# WeChat Content Writer 文档站点

这是 [WeChat Content Writer](https://github.com/bahayonghang/wechat-content-writer) 插件的官方文档站点。

## 快速开始

### 安装依赖

```bash
npm install
```

### 本地开发

```bash
npm run dev
```

访问 `http://localhost:5173` 查看文档。

### 构建生产版本

```bash
npm run build
```

### 预览生产构建

```bash
npm run preview
```

## 项目结构

```
docs/
├── .vitepress/          # VitePress 配置
│   ├── config.mjs       # 站点配置
│   └── theme/           # 自定义主题
│       ├── index.ts     # 主题入口
│       └── style.css    # 样式文件
├── guide/               # 用户指南
├── development/         # 开发文档
├── public/              # 静态资源
├── index.md             # 首页
├── features.md          # 功能特性
├── changelog.md         # 更新日志
└── package.json         # NPM 配置
```

## 文档目录

### 用户指南
- [快速开始](./guide/getting-started.md)
- [安装配置](./guide/installation.md)
- [命令参考](./guide/commands.md)
- [技能使用](./guide/skills.md)
- [写作风格](./guide/writing-style.md)
- [常见问题](./guide/faq.md)

### 开发文档
- [架构设计](./development/architecture.md)
- [API 参考](./development/api.md)
- [配置说明](./development/configuration.md)
- [插件开发](./development/plugin-development.md)
- [贡献指南](./development/contributing.md)

## 贡献

欢迎贡献文档改进！请阅读 [贡献指南](./development/contributing.md)。

## 许可

[MIT License](https://github.com/bahayonghang/wechat-content-writer/blob/master/LICENSE)
