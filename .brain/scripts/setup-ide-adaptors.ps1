# Enterprise AI Adaptor Symlink Utility (PowerShell / Windows)
# Connects root-level AI IDEs and Open-Source CLI engines directly to .brain/ configuration
# without cluttering Git repository commits.

$ErrorActionPreference = "Stop"
$ScriptRoot = $PSScriptRoot
$BrainRoot = (Get-Item $ScriptRoot).Parent.FullName
$RepoRoot = (Get-Item $BrainRoot).Parent.FullName

Write-Host "Initializing Enterprise AI IDE & Open-Source Adaptors for Windows / PowerShell..." -ForegroundColor Cyan

function Link-Or-Copy {
    param (
        [string]$sourceName,
        [string]$destPath
    )
    $sourceFile = Join-Path $BrainRoot $sourceName
    if (-not (Test-Path $sourceFile)) {
        Write-Warning "Source file $sourceName not found in .brain/"
        return
    }
    
    # Remove existing destination if present
    if (Test-Path $destPath) {
        Remove-Item -Path $destPath -Force
    }

    # Attempt Symbolic Link first (Requires Developer Mode or Admin on Windows)
    try {
        New-Item -ItemType SymbolicLink -Path $destPath -Target $sourceFile -Force -ErrorAction Stop | Out-Null
        Write-Host "[OK] Created Symlink: $destPath -> $sourceFile" -ForegroundColor Green
    }
    catch {
        # Fallback to file copy if symlinks are restricted by local Windows group policy
        Copy-Item -Path $sourceFile -Destination $destPath -Force
        Write-Host "[COPY] Copied fallback configuration to: $destPath (Symlink restricted by Windows OS policy)" -ForegroundColor Yellow
    }
}

# 1. Connect Cursor IDE (.cursorrules)
Link-Or-Copy -sourceName ".cursorrules" -destPath (Join-Path $RepoRoot ".cursorrules")

# 2. Connect Windsurf Flow (.windsurfrules)
Link-Or-Copy -sourceName ".windsurfrules" -destPath (Join-Path $RepoRoot ".windsurfrules")

# 3. Connect Cline (.clinerules)
Link-Or-Copy -sourceName ".clinerules" -destPath (Join-Path $RepoRoot ".clinerules")

# 4. Connect Roo Code Autonomous Agent (.roorules linked from .clinerules)
Link-Or-Copy -sourceName ".clinerules" -destPath (Join-Path $RepoRoot ".roorules")

# 5. Connect Aider & Open-Source Local CLI Models (.aider.conf.yml)
Link-Or-Copy -sourceName ".aider.conf.yml" -destPath (Join-Path $RepoRoot ".aider.conf.yml")

# 6. Connect GitHub Copilot Chat (.github/copilot-instructions.md)
$githubDir = Join-Path $RepoRoot ".github"
if (-not (Test-Path $githubDir)) {
    New-Item -ItemType Directory -Path $githubDir -Force | Out-Null
}
Link-Or-Copy -sourceName "github-copilot-instructions.md" -destPath (Join-Path $githubDir "copilot-instructions.md")

Write-Host "SUCCESS: Universal AI & Open-Source model rules activated! All tools will now strictly enforce .brain/ guardrails without root git clutter." -ForegroundColor Green
