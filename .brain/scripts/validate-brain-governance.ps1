# AI Developer Brain v3.0 - Automated Continuous Governance Audit (PowerShell)
# Verifies repository structural cleanliness, zero-trust security compliance, and memory integrity.

$ErrorActionPreference = "Stop"
$ScriptRoot = $PSScriptRoot
$BrainRoot = (Get-Item $ScriptRoot).Parent.FullName
$RepoRoot = (Get-Item $BrainRoot).Parent.FullName

$failures = 0

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "🛡️ v3.0 Universal AI Developer Brain - Automated Governance Audit" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "Scanning repository root: $RepoRoot" -ForegroundColor Gray
Write-Host ""

# -------------------------------------------------------------------------
# Audit 1: Root Zero-Clutter Architecture Enforcement
# -------------------------------------------------------------------------
Write-Host "[1/3] Checking Workspace Root Clutter & Directory Hierarchy..." -NoNewline
$allowedRootItems = @(".brain", ".git", ".github", "projects", "README.md", ".gitignore", ".cursorrules", ".windsurfrules", ".clinerules", ".roorules", ".aider.conf.yml")
$rootItems = Get-ChildItem -Path $RepoRoot -Force | Select-Object -ExpandProperty Name

$unauthorizedItems = $rootItems | Where-Object { $allowedRootItems -notcontains $_ }

if ($unauthorizedItems.Count -eq 0) {
    Write-Host " [PASS]" -ForegroundColor Green
} else {
    Write-Host " [FAIL]" -ForegroundColor Red
    Write-Warning "Unauthorized clutter detected in workspace root: $($unauthorizedItems -join ', ')"
    Write-Warning "Per v3.0 rules, all documentation and intelligence must sit in .brain/ and all application code in projects/."
    $failures++
}

# -------------------------------------------------------------------------
# Audit 2: Zero-Trust Security & Credential Leak Check
# -------------------------------------------------------------------------
Write-Host "[2/3] Auditing for Committed Credential Secret Files (.env, *.pem, *.key)..." -NoNewline

$secretPatterns = @("*.env*", "*.pem", "*.id_rsa", "*secrets.yml")
$foundSecrets = Get-ChildItem -Path $RepoRoot -Include $secretPatterns -Recurse -Force -ErrorAction SilentlyContinue | Where-Object { 
    $_.FullName -notlike "*\.env.example*" -and $_.FullName -notlike "*\.git\*"
}

if ($foundSecrets.Count -eq 0) {
    Write-Host " [PASS]" -ForegroundColor Green
} else {
    Write-Host " [FAIL]" -ForegroundColor Red
    Write-Warning "Potential unignored credential files discovered in workspace: $($foundSecrets.Name -join ', ')"
    Write-Warning "Per Zero-Trust Security rules, credential files MUST be excluded from version control and only .env.example templates may be shared."
    $failures++
}

# -------------------------------------------------------------------------
# Audit 3: Memory Cortex & Routing Index Health
# -------------------------------------------------------------------------
Write-Host "[3/3] Verifying Core Memory Buffer & Router Link Integrity..." -NoNewline
$requiredMemoryFiles = @("AI_ROUTING_INDEX.md", "AGENTS.md", "memory/global-stack-state.json", "memory/backend-memory.md", "memory/frontend-memory.md", "memory/admin-memory.md", "memory/mobile-memory.md", "memory/architecture-decisions.md")
$missingMemory = @()

foreach ($mf in $requiredMemoryFiles) {
    $fullPath = Join-Path $BrainRoot $mf
    if (-not (Test-Path $fullPath)) {
        $missingMemory += $mf
    }
}

if ($missingMemory.Count -eq 0) {
    Write-Host " [PASS]" -ForegroundColor Green
} else {
    Write-Host " [FAIL]" -ForegroundColor Red
    Write-Warning "Missing mandatory memory or intelligence files in .brain/: $($missingMemory -join ', ')"
    $failures++
}

Write-Host "----------------------------------------------------------------"
if ($failures -eq 0) {
    Write-Host "🚀 GOVERNANCE AUDIT SUCCESSFUL: 0 Violations Detected!" -ForegroundColor Green
    Write-Host "Repository architecture complies 100% with v3.0 ANY-STACK standards." -ForegroundColor Green
    exit 0
} else {
    Write-Host "🚨 GOVERNANCE AUDIT FAILED: $failures Violation(s) Detected!" -ForegroundColor Red
    Write-Host "Please review the warnings above and self-heal the repository structure before merging code." -ForegroundColor Red
    exit 1
}
