/**
 * VitePress Theme Extension
 * WeChat Content Writer Plugin Documentation
 */

import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme-without-fonts'
import './style.css'

/**
 * Custom theme configuration
 */
export default {
  extends: DefaultTheme,

  enhanceApp({ app, router, siteData }) {
    // Add global error handling
    if (typeof window !== 'undefined') {
      window.addEventListener('error', (event) => {
        console.error('[VitePress]', event.error)
      })

      // Smooth scroll for anchor links
      document.addEventListener('click', (e) => {
        const target = e.target as HTMLElement
        if (target.tagName === 'A' && target.getAttribute('href')?.startsWith('#')) {
          e.preventDefault()
          const id = target.getAttribute('href')?.slice(1)
          const element = document.getElementById(id || '')
          if (element) {
            element.scrollIntoView({ behavior: 'smooth' })
          }
        }
      })
    }
  }
} satisfies Theme
