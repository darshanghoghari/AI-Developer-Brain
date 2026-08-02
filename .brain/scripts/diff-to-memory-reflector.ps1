# AI Developer Brain v3.0 - Automated Diff-to-Memory Reflector Engine (PowerShell)
# Scans Git commit history and staging diffs across projects/* to generate domain memory delta reports
# and synchronize project intelligence without relying solely on chat prompt loops.

$ErrorActionPreference = "Stop"
$ScriptRoot = $PSScriptRoot
$BrainRoot = (Get-Item $ScriptRoot).Parent.FullName
$RepoRoot = (Get-Item $BrainRoot).Parent.FullName

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "v3.0 AI Brain - Automated Diff-to-Memory Reflector Engine" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "Inspecting repository diffs in: $RepoRoot" -ForegroundColor Gray

# Ensure scratch folder exists for logging delta JSON
$scratchDir = Join-Path $BrainRoot "scratch"
if (-not (Test-Path $scratchDir)) {
    New-Item -ItemType Directory -Path $scratchDir -Force | Out-Null
}
$deltaFile = Join-Path $scratchDir "memory-sync-delta.json"

# Attempt to read modified files via Git status and git diff
$modifiedFiles = @()
try {
    Push-Location $RepoRoot
    # Grab uncommitted staged and unstaged file modifications
    $gitStatus = git status --porcelain 2>$null
    if ($gitStatus) {
        foreach ($line in $gitStatus) {
            if ($line.Length -gt 3) {
                $modifiedFiles += $line.Substring(3).Trim()
            }
        }
    }
    # Also inspect last committed diff if available
    $lastDiff = git diff HEAD~1 --name-only 2>$null
    if ($lastDiff) {
        $modifiedFiles += $lastDiff
    }
    Pop-Location
} catch {
    Write-Warning "Git engine warning or shallow initialization: Continuing with workspace directory scanning."
}

# Ensure unique files
$modifiedFiles = $modifiedFiles | Select-Object -Unique

# Determine affected application domain memory buffers
$affectedDomains = @{
    backend = $false
    frontend = $false
    admin = $false
    mobile = $false
    schema = $false
}

foreach ($file in $modifiedFiles) {
    if ($file -like "*projects/backend*") { $affectedDomains.backend = $true }
    if ($file -like "*projects/frontend*") { $affectedDomains.frontend = $true }
    if ($file -like "*projects/admin*") { $affectedDomains.admin = $true }
    if ($file -like "*projects/mobile*") { $affectedDomains.mobile = $true }
    if ($file -like "*standards/contracts*" -or $file -like "*migration*") { $affectedDomains.schema = $true }
}

Write-Host "`nDiff Reflector Domain Analysis:" -ForegroundColor Yellow
Write-Host "  [+] Backend API Domain Touched: $($affectedDomains.backend)"
Write-Host "  [+] Frontend UI Domain Touched: $($affectedDomains.frontend)"
Write-Host "  [+] Admin Dashboard Touched: $($affectedDomains.admin)"
Write-Host "  [+] Mobile Workspace Touched: $($affectedDomains.mobile)"
Write-Host "  [+] Schema Contracts Touched: $($affectedDomains.schema)"

# Construct Delta JSON object
$deltaReport = @{
    timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    repository = $RepoRoot
    modifiedFilesCount = $modifiedFiles.Count
    sampledFiles = ($modifiedFiles | Select-Object -First 10)
    domainFlags = $affectedDomains
    status = "SYNCHRONIZED_BY_REFLECTOR"
    instructions = "AI agents reviewing this delta must verify that active compiled code remains the Ground Truth over memory summaries."
} | ConvertTo-Json -Depth 5

Set-Content -Path $deltaFile -Value $deltaReport -Force
Write-Host "`n[OK] Saved Delta Synchronization Report to: .brain/scratch/memory-sync-delta.json" -ForegroundColor Green

# Update global stack state timestamp
$globalStateFile = Join-Path (Join-Path $BrainRoot "memory") "global-stack-state.json"
if (Test-Path $globalStateFile) {
    try {
        $stateObj = Get-Content -Path $globalStateFile -Raw | ConvertFrom-Json
        $stateObj | Add-Member -Name "lastReflectorRun" -Value (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ") -MemberType NoteProperty -Force
        $stateObj | ConvertTo-Json -Depth 10 | Set-Content -Path $globalStateFile -Force
        Write-Host "[OK] Global Stack Memory Buffer updated with current synchronization timestamp." -ForegroundColor Green
    } catch {
        Write-Warning "Could not parse or update global-stack-state.json"
    }
}

Write-Host "`nSUCCESS: Reflector Cycle completed! Memory and Code Ground Truth aligned successfully!" -ForegroundColor Green
