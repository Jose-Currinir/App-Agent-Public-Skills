#!/usr/bin/env bash
# =============================================================================
# publish-skills.sh — publica las skills canónicas a TODAS las IAs.
# Fuente única: skills/<name>/SKILL.md  (frontmatter: name, description + cuerpo).
#
# Destinos:
#   - Claude Code   ~/.claude/skills/<name>/        (copia SKILL.md)   [+ plugin marketplace]
#   - Codex         ~/.codex/skills/<name>/          (copia SKILL.md)
#   - OpenClaw      ~/.agents/skills/<name>/         (copia SKILL.md)
#   - Cursor        dist/cursor/<name>.mdc           (render rule)     [commit a .cursor/rules]
#   - Copilot       dist/copilot/<name>.instructions.md (render)       [commit a .github/instructions]
#   - ChatGPT       dist/chatgpt/butake-skills.md    (bundle pegable en Project/Custom GPT)
#   - Universal     dist/agents/SKILLS.md            (agregado para AGENTS.md de cualquier repo)
#
# Uso:
#   ./scripts/publish-skills.sh            # instala en roots globales + genera dist/
#   ./scripts/publish-skills.sh --dist     # solo genera dist/ (no toca el HOME)
#   ./scripts/publish-skills.sh --into /ruta/repo   # además copia cursor/copilot a ese repo
# =============================================================================
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/skills"
DIST="$ROOT/dist"
ONLY_DIST=0; INTO=""
while [[ $# -gt 0 ]]; do case "$1" in
  --dist) ONLY_DIST=1;;
  --into) INTO="$2"; shift;;
  *) echo "arg desconocido: $1"; exit 1;;
esac; shift; done

GLOBAL_ROOTS=("$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.agents/skills")

# extrae 'description' del frontmatter y el cuerpo (tras el segundo '---')
read_skill() { # $1=SKILL.md  -> exporta DESC y BODY_FILE
  python3 - "$1" <<'PY'
import sys,re
p=sys.argv[1]; t=open(p,encoding='utf-8').read()
desc=""; body=t
m=re.match(r'^---\n(.*?)\n---\n?(.*)$', t, re.S)
if m:
    fm,body=m.group(1),m.group(2)
    d=re.search(r'^description:\s*"?(.*?)"?\s*$', fm, re.M)
    if d: desc=d.group(1)
open('/tmp/_skill_desc','w',encoding='utf-8').write(desc)
open('/tmp/_skill_body','w',encoding='utf-8').write(body)
PY
  DESC="$(cat /tmp/_skill_desc)"; BODY_FILE="/tmp/_skill_body"
}

mkdir -p "$DIST"/{cursor,copilot,chatgpt,agents}
CHATGPT="$DIST/chatgpt/butake-skills.md"; AGG="$DIST/agents/SKILLS.md"
echo "# Skills Butake (bundle para ChatGPT — pegar en el Project/Custom GPT)" > "$CHATGPT"
echo "# Skills Butake (agregado — incluir en AGENTS.md)" > "$AGG"

count=0
for d in "$SRC"/*/; do
  [ -f "$d/SKILL.md" ] || continue
  name="$(basename "$d")"; read_skill "$d/SKILL.md"
  echo "→ $name"

  # 1) roots globales basados en SKILL.md (Claude / Codex / OpenClaw)
  if [[ $ONLY_DIST -eq 0 ]]; then
    for r in "${GLOBAL_ROOTS[@]}"; do mkdir -p "$r/$name"; cp -R "$d"* "$r/$name/"; done
  fi

  # 2) Cursor rule (.mdc)
  { printf -- "---\ndescription: %s\nalwaysApply: false\n---\n\n" "$DESC"; cat "$BODY_FILE"; } \
    > "$DIST/cursor/$name.mdc"

  # 3) Copilot instructions
  { printf -- "---\ndescription: %s\napplyTo: \"**\"\n---\n\n" "$DESC"; cat "$BODY_FILE"; } \
    > "$DIST/copilot/$name.instructions.md"

  # 4) ChatGPT bundle + 5) agregado universal
  { echo; echo "## $name"; echo "_${DESC}_"; echo; cat "$BODY_FILE"; echo; } | tee -a "$CHATGPT" >> "$AGG"

  # opcional: copiar artefactos a un repo destino
  if [[ -n "$INTO" ]]; then
    mkdir -p "$INTO/.cursor/rules" "$INTO/.github/instructions"
    cp "$DIST/cursor/$name.mdc" "$INTO/.cursor/rules/$name.mdc"
    cp "$DIST/copilot/$name.instructions.md" "$INTO/.github/instructions/$name.instructions.md"
  fi
  count=$((count+1))
done

echo
echo "Publicadas $count skills."
[[ $ONLY_DIST -eq 0 ]] && echo "Instaladas en: ${GLOBAL_ROOTS[*]}"
echo "Artefactos en: $DIST (cursor/, copilot/, chatgpt/, agents/)"
echo "Claude Code (marketplace): /plugin marketplace add Jose-Currinir/App-Agent-Skills"
