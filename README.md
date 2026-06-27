<h1 align="center">App-Agent-Public-Skills</h1>

<p align="center">
  Public-safe agent skills maintained for reuse without exposing private infrastructure.
</p>

<p align="center">
  <img alt="Mode" src="https://img.shields.io/badge/Mode-Agent-7c3aed?style=for-the-badge&labelColor=0f172a" />
  <img alt="Visibility" src="https://img.shields.io/badge/GitHub-Public-16a34a?style=for-the-badge&labelColor=0f172a" />
  <img alt="Safety" src="https://img.shields.io/badge/Safety-Sanitized-0f766e?style=for-the-badge&labelColor=0f172a" />
</p>

---

## Propósito

Este repositorio contiene skills genéricas que pueden compartirse públicamente sin rutas internas, hosts privados, secretos, clientes ni topología operacional privada.

La fuente privada completa vive fuera de este repo. Este repositorio es solo la distribución pública segura.

## Skills incluidas

| Skill | Propósito |
|---|---|
| `caveman` | Comunicación ultra comprimida para ahorrar tokens. |
| `compress` | Compresión controlada de archivos de memoria en formato breve. |
| `find-skills` | Búsqueda e instalación de skills del ecosistema abierto. |
| `github-readme-polisher` | Mejora de README.md para GitHub con presentación premium y QA de contenido. |
| `ui-animation` | Guía para diseñar, implementar y revisar animaciones de UI. |

## Instalación local

```bash
./scripts/install-skill.sh caveman
./scripts/install-skill.sh github-readme-polisher
./scripts/install-skill.sh ui-animation
```

Por defecto instala en:

```text
~/.codex/skills/<skill>
```

Puedes cambiar el destino con `CODEX_SKILLS_DIR`:

```bash
CODEX_SKILLS_DIR="$HOME/.agents/skills" ./scripts/install-skill.sh find-skills
```

## Regla de publicación

Una skill puede entrar aquí solo si cumple:

- no contiene rutas locales privadas
- no contiene dominios internos o hosts productivos privados
- no contiene nombres de clientes sensibles
- no contiene `.env`, tokens, credenciales ni secretos
- no depende de documentación privada para funcionar

Las skills internas se mantienen en el repo privado `App-Agent-Skills`.

## Estructura

```text
App-Agent-Public-Skills/
├── README.md
├── scripts/
│   └── install-skill.sh
└── skills/
    ├── caveman/
    ├── compress/
    ├── find-skills/
    ├── github-readme-polisher/
    └── ui-animation/
```
