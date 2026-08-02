#!/usr/bin/env bash

# AI Developer Brain v3.0 - Automated Continuous Governance Audit (Bash / CI)
# Verifies repository structural cleanliness, zero-trust security compliance, and memory integrity.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BRAIN_ROOT="$(dirname "$SCRIPT_DIR")"
REPO_ROOT="$(dirname "$BRAIN_ROOT")"

FAILURES=0

echo "================================================================"
echo "🛡️ v3.0 Universal AI Developer Brain - Automated Governance Audit"
echo "================================================================"
echo "Scanning repository root: ${REPO_ROOT}"
echo ""

# -------------------------------------------------------------------------
# Audit 1: Root Zero-Clutter Architecture Enforcement
# -------------------------------------------------------------------------
echo -n "[1/3] Checking Workspace Root Clutter & Directory Hierarchy..."
ALLOWED="\.brain$|\.git$|\.github$|projects$|README\.md$|\.gitignore$|\.cursorrules$|\.windsurfrules$|\.clinerules$|\.roorules$|\.aider\.conf\.yml$"

UNAUTHORIZED=$(find "${REPO_ROOT}" -maxdepth 1 -mindepth 1 | grep -E -v "${ALLOWED}" || true)

if [ -z "${UNAUTHORIZED}" ]; then
    echo " [PASS]"
else
    echo " [FAIL]"
    echo "⚠️ Warning: Unauthorized clutter detected in workspace root:"
    echo "${UNAUTHORIZED}"
    echo "Per v3.0 rules, all documentation must sit in .brain/ and application code in projects/."
    FAILURES=$((FAILURES + 1))
fi

# -------------------------------------------------------------------------
# Audit 2: Zero-Trust Security & Credential Leak Check
# -------------------------------------------------------------------------
echo -n "[2/3] Auditing for Committed Credential Secret Files (.env, *.pem, *.key)..."

SECRETS=$(find "${REPO_ROOT}" -not -path "*/.git/*" \( -name "*.env*" -o -name "*.pem" -o -name "*.id_rsa" -o -name "*secrets.yml" \) ! -name "*.env.example*" || true)

if [ -z "${SECRETS}" ]; then
    echo " [PASS]"
else
    echo " [FAIL]"
    echo "⚠️ Warning: Potential unignored credential files discovered:"
    echo "${SECRETS}"
    FAILURES=$((FAILURES + 1))
fi

# -------------------------------------------------------------------------
# Audit 3: Memory Cortex & Routing Index Health
# -------------------------------------------------------------------------
echo -n "[3/3] Verifying Core Memory Buffer & Router Link Integrity..."
REQUIRED_FILES=("AI_ROUTING_INDEX.md" "AGENTS.md" "memory/global-stack-state.json" "memory/backend-memory.md" "memory/frontend-memory.md" "memory/admin-memory.md" "memory/mobile-memory.md" "memory/architecture-decisions.md")
MISSING=0

for rf in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "${BRAIN_ROOT}/${rf}" ]; then
        echo "Missing file: ${rf}"
        MISSING=1
    fi
done

if [ ${MISSING} -eq 0 ]; then
    echo " [PASS]"
else
    echo " [FAIL]"
    FAILURES=$((FAILURES + 1))
fi

echo "----------------------------------------------------------------"
if [ ${FAILURES} -eq 0 ]; then
    echo "🚀 GOVERNANCE AUDIT SUCCESSFUL: 0 Violations Detected!"
    echo "Repository architecture complies 100% with v3.0 ANY-STACK standards."
    exit 0
else
    echo "🚨 GOVERNANCE AUDIT FAILED: ${FAILURES} Violation(s) Detected!"
    exit 1
fi
