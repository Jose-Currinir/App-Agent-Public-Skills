#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_name="${1:-}"
target_root="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"

if [[ -z "$skill_name" ]]; then
  echo "Uso: $0 <skill-name>" >&2
  exit 2
fi

source_dir="$repo_root/skills/$skill_name"
target_dir="$target_root/$skill_name"

if [[ ! -f "$source_dir/SKILL.md" ]]; then
  echo "Skill no encontrada: $skill_name" >&2
  exit 1
fi

mkdir -p "$target_root"
rm -rf "$target_dir"
cp -R "$source_dir" "$target_dir"

echo "Instalada: $skill_name -> $target_dir"
