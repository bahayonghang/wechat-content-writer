# Repository Guidelines

## Project Structure & Module Organization

- `wechat-content-writer/`: Claude Code plugin (Node/Express). Key areas: `scripts/` (search servers), `commands/` (slash command definitions), `skills/` (auto-triggered skills), `agents/` (agent prompts), `config.json` (paths + MCP config).
- `docs/`: VitePress documentation site (`.vitepress/`, `guide/`, `development/`, `public/`).
- `wechat_doc/`: Generated articles created by install scripts (gitignored; do not commit).
- `resource/`: Local resources (gitignored).

## Build, Test, and Development Commands

### Plugin (Node.js >= 14)

```bash
cd wechat-content-writer
npm install
npm run start     # start search server (default PORT=3001)
npm run dev       # start with nodemon (auto-reload)
```

### Docs (VitePress)

```bash
cd docs
npm install
npm run docs:dev
npm run docs:build
npm run docs:preview
```

## Coding Style & Naming Conventions

- JavaScript: keep existing CommonJS style (`require(...)`), 2-space indentation, and semicolons.
- Markdown “definitions” must include YAML frontmatter with at least `name` and `description`:
  - `wechat-content-writer/agents/*.md`
  - `wechat-content-writer/commands/*.md`
  - `wechat-content-writer/skills/*/SKILL.md`
- Generated content naming follows `{category}/{YYYY-MM-DD}_{title}.md` under `wechat_doc/`.

## Testing Guidelines

```bash
cd wechat-content-writer
node scripts/test-plugin.js
```

Manual sanity check (after starting the server): `GET http://localhost:3001/health`.

## Commit & Pull Request Guidelines

- Follow Conventional Commits: `type(scope): summary` (history also uses an optional emoji prefix). Examples: `feat(docs): ...`, `chore(ci): ...`, `fix: ...`.
- PRs include: what/why, verification steps (commands run), linked issues, and screenshots for documentation/UI changes. Docs updates are deployed via `.github/workflows/deploy-docs.yml` when merged to `master`.

## Configuration & Secrets

- Runtime config: `wechat-content-writer/config.json`.
- Do not commit API keys. Use environment variables (e.g. `SEARCH_API_KEY`) or local overrides like `*.local.json` (gitignored).
