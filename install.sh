#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Installing meow globally..."

# 1. Claude Code
mkdir -p "$HOME/.claude/skills/meow"
mkdir -p "$HOME/.claude/commands"
cp "$DIR/SKILL.md" "$HOME/.claude/skills/meow/SKILL.md"
cp "$DIR/meow.md" "$HOME/.claude/commands/meow.md"
echo "✓ Installed to Claude Code (~/.claude/skills/meow & ~/.claude/commands/meow.md)"

# 2. Antigravity / Gemini CLI
mkdir -p "$HOME/.gemini/config/skills/meow"
cp -r "$DIR/"* "$HOME/.gemini/config/skills/meow/" 2>/dev/null || true
echo "✓ Installed to Antigravity (~/.gemini/config/skills/meow)"

echo "✓ meow installed successfully!"
