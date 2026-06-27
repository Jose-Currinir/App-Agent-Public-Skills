# AGENTS.md — App-Agent-Public-Skills

> **Fuente canónica para TODA IA de codificación** (Claude Code, Codex, Cursor, Copilot, etc.).
> `CLAUDE.md`, `.cursor/rules/` y `.github/copilot-instructions.md` son punteros finos a este
> archivo: **no dupliques reglas, edítalas aquí.**
>
> Contexto de empresa y marca: [`.butake/context.md`](.butake/context.md) (autogenerado por el
> control plane — no editar a mano).

---

## 1. Qué es

**App-Agent-Public-Skills** — marketplace **público** de skills reutilizables, universal para toda IA.

- Tipo: `agent` · Familia: `ai-agent` · Visibilidad: `PUBLIC`
- Parte del ecosistema **Butake** (ver `.butake/context.md`).

Gemelo público de `App-Agent-Skills`: misma estructura, pero con skills **genéricas y
compartibles** (no Butake-específicas). Una skill se escribe una vez en
`skills/<name>/SKILL.md` y se publica al formato nativo de cada IA con `publish-skills.sh`.
Lo privado/Butake-específico vive en `App-Agent-Skills`. Decisión **D11**.

## 2. Arquitectura

```
skills/<name>/SKILL.md        ← FUENTE CANÓNICA (frontmatter: name, description + cuerpo)
.claude-plugin/
  marketplace.json            ← marketplace público (plugin "butake-public-skills")
  plugin.json                 ← plugin: skills "./skills/"
scripts/publish-skills.sh     ← publicador universal (idéntico al del repo privado)
dist/ (generado, gitignored)  ← cursor/, copilot/, chatgpt/, agents/
```

Destinos por IA: Claude Code (marketplace), Codex (`~/.codex/skills`), OpenClaw
(`~/.agents/skills`), Cursor (`.cursor/rules`), Copilot (`.github/instructions`), ChatGPT (bundle).

## 3. Cómo correrlo

```bash
./scripts/publish-skills.sh           # instala en roots globales + genera dist/
./scripts/publish-skills.sh --dist    # solo dist/
```
Claude Code: `/plugin marketplace add Jose-Currinir/App-Agent-Public-Skills` →
`/plugin install butake-public-skills@app-agent-public-skills`.

## 4. Convenciones

- Cada skill = `skills/<name>/SKILL.md` (frontmatter `name` + `description` específica).
- Solo skills **genéricas** aquí; nada Butake-específico ni secreto (eso va al repo privado).
- Ramas `develop`/`main`; commits `tipo(módulo):` en español, **sin co-autoría de IA**.

## 5. Estado y pendientes

- Listo: 5 skills (caveman, compress, find-skills, github-readme-polisher, ui-animation),
  marketplace público y publicador universal.
- Pendiente: publicar marketplace y que el equipo/externos lo instalen.

---

## Reglas no negociables (estándar Butake)

- **Verificar antes de decir "listo"**: compilar / correr tests y reportar la salida real.
- **Commit/push solo cuando el usuario lo pida**; si trabajas en `main`, crea rama primero.
- **No tocar** secretos, `.env`, claves ni migraciones aplicadas.
- **No vender humo**: si algo es scaffold o está bloqueado, dilo.
