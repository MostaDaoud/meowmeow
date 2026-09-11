<#
.SYNOPSIS
Installs meow globally across Antigravity, Claude Code, and Agent environments.
#>

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Installing meow globally across agents " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# 1. Claude Code
$claudeSkillDir = Join-Path $HOME ".claude\skills\meow"
$claudeCmdDir = Join-Path $HOME ".claude\commands"
New-Item -ItemType Directory -Path $claudeSkillDir -Force | Out-Null
New-Item -ItemType Directory -Path $claudeCmdDir -Force | Out-Null

Copy-Item -Path (Join-Path $repoRoot "SKILL.md") -Destination (Join-Path $claudeSkillDir "SKILL.md") -Force
Copy-Item -Path (Join-Path $repoRoot "meow.md") -Destination (Join-Path $claudeCmdDir "meow.md") -Force
Write-Host "✓ Installed to Claude Code (~/.claude/skills/meow & ~/.claude/commands/meow.md)" -ForegroundColor Green

# 2. Antigravity / Gemini CLI
$geminiSkillDir = Join-Path $HOME ".gemini\config\skills\meow"
New-Item -ItemType Directory -Path $geminiSkillDir -Force | Out-Null
Copy-Item -Path "$repoRoot\*" -Destination $geminiSkillDir -Recurse -Force
Write-Host "✓ Installed to Antigravity (~/.gemini/config/skills/meow)" -ForegroundColor Green

Write-Host "`n✓ meow installed successfully! Type /meow in your agent sessions." -ForegroundColor Cyan
