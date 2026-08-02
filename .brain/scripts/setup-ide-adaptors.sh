#!/usr/bin/env bash

# Enterprise AI Adaptor Symlink Utility (Linux / macOS / UNIX / CI Pipelines)
# Connects root-level AI IDEs and Open-Source CLI engines directly to .brain/ configuration
# without cluttering Git repository commits.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BRAIN_ROOT="$(dirname "$SCRIPT_DIR")"
REPO_ROOT="$(dirname "$BRAIN_ROOT")"

echo "Initializing Enterprise AI IDE & Open-Source Adaptors for UNIX / macOS / Linux..."

link_file() {
    local source_file="${BRAIN_ROOT}/$1"
    local dest_path="${REPO_ROOT}/$2"

    if [ ! -f "$source_file" ]; then
        echo "Warning: Source file $1 not found in .brain/"
        return
    ]

    rm -f "$dest_path"
    ln -s "$source_file" "$dest_path"
    echo "[OK] Created Symlink: $dest_path -> $source_file"
}

# 1. Connect Cursor IDE (.cursorrules)
link_file ".cursorrules" ".cursorrules"

# 2. Connect Windsurf Flow (.windsurfrules)
link_file ".windsurfrules" ".windsurfrules"

# 3. Connect Cline (.clinerules)
link_file ".clinerules" ".clinerules"

# 4. Connect Roo Code Autonomous Agent (.roorules linked from .clinerules)
link_file ".clinerules" ".roorules"

# 5. Connect Aider & Open-Source Local CLI Models (.aider.conf.yml)
link_file ".aider.conf.yml" ".aider.conf.yml"

# 6. Connect GitHub Copilot Chat (.github/copilot-instructions.md)
mkdir -p "${REPO_ROOT}/.github"
link_file "github-copilot-instructions.md" ".github/copilot-instructions.md"

echo "SUCCESS: Universal AI & Open-Source model rules activated! All tools will now strictly enforce .brain/ guardrails without root git clutter."
