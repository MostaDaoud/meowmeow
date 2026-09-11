<#
.SYNOPSIS
Installs meow and AI-discipline globally across Antigravity, Claude Code, and Agent environments.
#>

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$homeDir = $HOME

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Installing meow & discipline globally  " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# 1. Claude Code
$claudeSkillDir = Join-Path $homeDir ".claude\skills\meow"
$claudeCmdDir = Join-Path $homeDir ".claude\commands"
if (-not (Test-Path $claudeSkillDir)) { New-Item -ItemType Directory -Path $claudeSkillDir -Force | Out-Null }
if (-not (Test-Path $claudeCmdDir)) { New-Item -ItemType Directory -Path $claudeCmdDir -Force | Out-Null }

Copy-Item -Path (Join-Path $repoRoot "SKILL.md") -Destination (Join-Path $claudeSkillDir "SKILL.md") -Force
Copy-Item -Path (Join-Path $repoRoot "meow.md") -Destination (Join-Path $claudeCmdDir "meow.md") -Force
Write-Host "[OK] Installed to Claude Code (~/.claude/skills/meow and ~/.claude/commands/meow.md)" -ForegroundColor Green

# 2. Antigravity Global Skill
$geminiSkillDir = Join-Path $homeDir ".gemini\config\skills\meow"
if (-not (Test-Path $geminiSkillDir)) { New-Item -ItemType Directory -Path $geminiSkillDir -Force | Out-Null }
Copy-Item -Path "$repoRoot\*" -Destination $geminiSkillDir -Recurse -Force
Write-Host "[OK] Installed to Antigravity (~/.gemini/config/skills/meow)" -ForegroundColor Green

# 3. Universal Agent Skills
$agentSkillDir = Join-Path $homeDir ".agents\skills\meow"
if (-not (Test-Path $agentSkillDir)) { New-Item -ItemType Directory -Path $agentSkillDir -Force | Out-Null }
Copy-Item -Path "$repoRoot\*" -Destination $agentSkillDir -Recurse -Force
Write-Host "[OK] Installed to Agent Skills (~/.agents/skills/meow)" -ForegroundColor Green

# 4. Global Directives (~/.gemini/meow & ~/.gemini/partner-mindset)
$geminiMeowDir = Join-Path $homeDir ".gemini\meow"
if (-not (Test-Path $geminiMeowDir)) { New-Item -ItemType Directory -Path $geminiMeowDir -Force | Out-Null }
Copy-Item -Path (Join-Path $repoRoot "meow-core.md") -Destination (Join-Path $geminiMeowDir "GEMINI.md") -Force
Write-Host "[OK] Installed global meow rule (~/.gemini/meow/GEMINI.md)" -ForegroundColor Green

Write-Host "`n[OK] meow and disciplines installed successfully! Type /meow in your agent sessions." -ForegroundColor Cyan
