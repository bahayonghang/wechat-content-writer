/**
 * VitePress Configuration for WeChat Content Writer Plugin Documentation
 */
import { defineConfig } from 'vitepress'
import { fileURLToPath } from 'node:url'

export default defineConfig({
  title: 'WeChat Content Writer',
  description: '专业的微信公众号内容创作插件 - 文献搜索、PDF分析、自动化文章生成',
  lang: 'zh-CN',
  base: '/',

  srcDir: fileURLToPath(new URL('.', import.meta.url)),

  head: [
    ['link', { rel: 'icon', href: '/favicon.ico' }],
    ['meta', { name: 'theme-color', content: '#3c8772' }]
  ],

  themeConfig: {
    logo: '/logo.svg',

    nav: [
      { text: '首页', link: '/' },
      { text: '快速开始', link: '/guide/getting-started' },
      { text: '用户指南', link: '/guide/commands' },
      { text: '开发文档', link: '/development/architecture' },
      {
        text: 'GitHub',
        items: [
          { text: '源码仓库', link: 'https://github.com/bahayonghang/wechat-content-writer' }
        ]
      }
    ],

    sidebar: {
      '/guide/': [
        {
          text: '用户指南',
          items: [
            { text: '快速开始', link: '/guide/getting-started' },
            { text: '安装配置', link: '/guide/installation' },
            { text: '命令参考', link: '/guide/commands' },
            { text: '技能使用', link: '/guide/skills' },
            { text: '写作风格', link: '/guide/writing-style' },
            { text: '常见问题', link: '/guide/faq' }
          ]
        }
      ],
      '/development/': [
        {
          text: '开发文档',
          items: [
            { text: '架构设计', link: '/development/architecture' },
            { text: '搜索服务 API', link: '/development/api' },
            { text: '配置说明', link: '/development/configuration' },
            { text: '插件开发', link: '/development/plugin-development' },
            { text: '贡献指南', link: '/development/contributing' }
          ]
        }
      ],
      '/': [
        {
          text: '概览',
          items: [
            { text: '简介', link: '/' },
            { text: '功能特性', link: '/features' },
            { text: '更新日志', link: '/changelog' }
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/bahayonghang/wechat-content-writer' }
    ],

    footer: {
      message: '基于 MIT 许可发布',
      copyright: 'Copyright © 2024 WeChat Content Writer'
    },

    editLink: {
      pattern: 'https://github.com/bahayonghang/wechat-content-writer/edit/main/docs/:path',
      text: '在 GitHub 上编辑此页'
    },

    lastUpdated: {
      text: '最后更新',
      formatOptions: {
        dateStyle: 'short',
        timeStyle: 'short'
      }
    },

    search: {
      provider: 'local'
    }
  },

  markdown: {
    lineNumbers: true,
    config: (md) => {
      // Add custom markdown-it plugins if needed
    }
  }
})
