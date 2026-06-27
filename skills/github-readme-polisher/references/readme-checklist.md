# README Checklist

## Premium README Skeleton

```md
<p align="center">
  <img src="public/logo.png" alt="Project logo" width="140" />
</p>

<h1 align="center">Project Name</h1>

<p align="center">
  One clear sentence that explains what this product is.
</p>

<p align="center">
  <img alt="Stack" src="https://img.shields.io/badge/Stack-Value-19d79f?style=for-the-badge&labelColor=02130e" />
</p>

---

## Visión

Short product explanation.

## Stack

| Capa | Tecnología |
| --- | --- |
| Frontend | ... |
| Runtime | ... |

## Rutas

| Ruta | Propósito |
| --- | --- |
| `/` | Home |

## Desarrollo

```bash
pnpm install
pnpm dev
```

## Comandos

| Comando | Descripción |
| --- | --- |
| `pnpm dev` | ... |

## Calidad

```bash
pnpm typecheck
pnpm test
```
```

## Final QA

- Logo path is repo-relative and renders on GitHub.
- Badges are real and not misleading.
- Commands match `package.json`.
- Routes and APIs exist in the repo.
- `.gitignore` excludes generated artifacts.
- No local absolute paths appear in README.
- Spanish copy has correct accents.
- `git diff --check` passes.
