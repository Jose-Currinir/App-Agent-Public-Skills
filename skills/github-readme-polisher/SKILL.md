---
name: github-readme-polisher
description: Create or improve repository README.md files for GitHub with premium visual presentation, brand/logo usage, badges, clear setup commands, route/API documentation, project structure, validation workflow, cleanup notes, and Spanish copy QA. Use when the user asks to generate, beautify, polish, redesign, or audit a README for GitHub, especially when they provide a logo, brand asset, repo context, or want the README to look professional.
---

# GitHub README Polisher

## Workflow

1. Inspect the repo before writing:
   - Read `README.md`, `package.json`, `.gitignore`, key config files, and visible project structure.
   - Identify framework, runtime, package manager, scripts, deployment target, and major routes/features.
   - If the user provides a logo or brand asset, copy it into a stable repo path such as `public/logo.png` or `docs/assets/logo.png` unless the repo already has a better canonical asset path.

2. Produce a GitHub-rendered README, not a plain text note:
   - Start with centered logo HTML.
   - Add centered title and one-sentence product description.
   - Add badges only when they improve scanability and match the real stack.
   - Use tables for stack, routes, commands, collections, environment, or quality gates.
   - Use fenced command blocks for setup and validation.
   - Keep sections compact and directly useful.

3. Match the repo, not a generic template:
   - Use actual scripts from `package.json`.
   - Mention actual routes/endpoints only if they exist.
   - Mention real config/deployment files.
   - Avoid invented status, CI badges, deployment URLs, or feature claims.

4. Clean obvious README-adjacent repository noise when asked:
   - Ensure `.gitignore` excludes generated artifacts like `dist/`, `.astro/`, `.wrangler/`, `artifacts/`, `test-results/`, `playwright-report/`, `coverage/`, logs, env files, and OS files.
   - Remove local QA artifacts from the working tree only when they are clearly generated and unrelated to source.
   - Do not remove source assets, seed files, configs, or user-authored docs without explicit confirmation.

5. Validate:
   - Run `git diff --check`.
   - Re-read the README top-to-bottom.
   - For Spanish README copy, check accents and common mistakes before finalizing.

## Recommended Shape

Use this order unless the repo calls for a different one:

1. Centered logo
2. Centered title
3. Centered one-line description
4. Badges
5. Short product vision
6. Stack table
7. Key routes/features table
8. CMS/data/admin section when applicable
9. Local development
10. Commands table
11. Validation/quality workflow
12. Deployment
13. Project structure
14. Current status or operating notes

## Brand And Logo Rules

- Prefer a repo-relative image path in README: `<img src="public/logo.png" ... />`.
- Use `width="120"` to `width="160"` for square logos.
- Keep the logo above the H1.
- Do not hotlink local machine paths.
- If replacing an existing logo, verify dimensions and checksum when useful.

## Spanish Copy QA

Before finishing, search for and correct missing accents in visible Spanish copy.

Common corrections:

- `Vision` -> `Visión`
- `publico/publica/publicas` -> `público/pública/públicas`
- `unico` -> `único`
- `Tecnologia` -> `Tecnología`
- `Proposito` -> `Propósito`
- `articulo/articulos` -> `artículo/artículos`
- `metodologia` -> `metodología`
- `Politica` -> `Política`
- `Terminos` -> `Términos`
- `Descripcion` -> `Descripción`
- `produccion` -> `producción`
- `Auditoria/auditoria` -> `Auditoría/auditoría`
- `Navegacion` -> `Navegación`

Watch for invalid overcorrections:

- Use `Colecciones`, not `Colecciónes`.
- Keep code identifiers, package names, URLs, routes, env vars, and commands unchanged.

## Reference

For a compact checklist and reusable README skeleton, read `references/readme-checklist.md` when starting from scratch or when the README needs a full rewrite.
