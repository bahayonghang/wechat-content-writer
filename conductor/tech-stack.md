# Tech Stack: WeChat Content Writer

This document details the technology stack and development environment for the WeChat Content Writer project.

## 1. Core Runtime & Languages
- **Runtime:** Node.js (Version >= 14.0.0)
- **Primary Language:** JavaScript (ES6+)
- **Documentation Language:** Markdown (with VitePress extensions)

## 2. Backend (Search Server)
- **Framework:** Express.js
- **Key Libraries:**
    - **Axios:** For handling HTTP requests to academic and web sources.
    - **JSDOM:** For parsing and manipulating HTML content from search results.
    - **CORS:** For enabling Cross-Origin Resource Sharing.

## 3. Documentation Site
- **Engine:** VitePress
- **Frontend Core:** Vue.js / Vite
- **Extensions:**
    - **Mermaid:** For rendering architectural and flow diagrams.

## 4. Development & Deployment
- **Integration Platform:** Claude Code (Model Context Protocol / MCP)
- **Process Management:** Nodemon (for automated server reloading during development)
- **CI/CD:** GitHub Actions (for automated documentation deployment)
- **Scripting:** 
    - Windows PowerShell (.ps1)
    - Unix/Linux Shell (.sh)

## 5. Content Infrastructure
- **Storage:** Local filesystem with structured directory mapping.
- **Data Exchange:** JSON (for configuration and MCP communication).
