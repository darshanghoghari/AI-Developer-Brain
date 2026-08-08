<#
.SYNOPSIS
Autonomous AI Agent Loop with Token Tracking
.DESCRIPTION
Watches the projects/ directory for file saves. When a save occurs, it waits for a debounce period, reads the git diff, generates a prompt, and triggers a headless AI agent (e.g., Aider). It logs performance metrics to optimize token usage.
#>

$ProjectsDir = Resolve-Path ".\projects"
$BrainDir = Resolve-Path ".\.brain"
$TrackerFile = "$BrainDir\memory\optimization_history.json"
$PromptTemplates = Get-Content "$BrainDir\scripts\ai-prompt-templates.json" | ConvertFrom-Json

# Initialize tracker file
if (-not (Test-Path $TrackerFile)) {
    if (-not (Test-Path "$BrainDir\memory")) { New-Item -ItemType Directory -Path "$BrainDir\memory" | Out-Null }
    @() | ConvertTo-Json | Set-Content $TrackerFile
}

function Log-Metrics {
    param (
        [string]$TaskType,
        [int]$DurationSeconds,
        [string]$ChangedFile
    )
    $History = Get-Content $TrackerFile | ConvertFrom-Json
    if ($null -eq $History) { $History = @() }
    
    $NewEntry = @{
        timestamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
        task = $TaskType
        duration_sec = $DurationSeconds
        file = $ChangedFile
    }
    
    $History += $NewEntry
    $History | ConvertTo-Json -Depth 5 | Set-Content $TrackerFile
    Write-Host "[Metrics] Logged execution time: $DurationSeconds seconds." -ForegroundColor Cyan
}

function Execute-AIAgent {
    param (
        [string]$Prompt,
        [string]$ChangedFile
    )
    
    Write-Host "[AI Loop] Triggering Headless AI for changes in: $ChangedFile" -ForegroundColor Green
    Write-Host "[AI Prompt] $Prompt" -ForegroundColor DarkGray
    
    $StartTime = Get-Date
    
    # -------------------------------------------------------------------------
    # TODO: Replace the block below with the actual CLI tool execution (e.g., Aider)
    # Example: aider --message "$Prompt" --yes --no-auto-commits
    # We enforce NO automatic git push here.
    # -------------------------------------------------------------------------
    Write-Host "[AI Agent] (Simulated Execution) Running tests and updating docs..." -ForegroundColor Yellow
    Start-Sleep -Seconds 3 # Simulating work
    # -------------------------------------------------------------------------
    
    $EndTime = Get-Date
    $Duration = [math]::Round(($EndTime - $StartTime).TotalSeconds)
    
    Log-Metrics -TaskType "auto_tdd_and_docs" -DurationSeconds $Duration -ChangedFile $ChangedFile
}

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $ProjectsDir
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

Write-Host "🤖 Autonomous AI Loop is now watching for file changes in $ProjectsDir..." -ForegroundColor Magenta
Write-Host "Press Ctrl+C to stop."

$lastTriggerTime = Get-Date
$debounceSeconds = 10

while ($true) {
    # We wait for events, debouncing multiple saves
    $result = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::Changed -bOr [System.IO.WatcherChangeTypes]::Created, 1000)
    
    if ($result.TimedOut -eq $false) {
        $now = Get-Date
        if (($now - $lastTriggerTime).TotalSeconds -gt $debounceSeconds) {
            $lastTriggerTime = $now
            $changedFile = $result.Name
            
            # Simple prompt template selection
            $prompt = $PromptTemplates.on_file_changed.Replace("{{changed_file}}", $changedFile)
            
            Execute-AIAgent -Prompt $prompt -ChangedFile $changedFile
        }
    }
}
