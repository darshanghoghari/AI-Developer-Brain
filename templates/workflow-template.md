---
title: "[Workflow Title: e.g., Autonomous TDD Regression & Bug Fix Protocol]"
type: "agent-workflow"
domain: "testing, debugging, automation"
version: "1.0.0"
applicable_agents: ["Antigravity", "Claude", "Cursor", "Windsurf", "Copilot"]
---

# ⚙️ AI Workflow: [Workflow Title]

> **Objective**: Define a deterministic, step-by-step sequential execution procedure for an AI assistant or engineer to execute complex code modifications safely without breaking existing architectures.

---

## 📋 Prerequisites & Context Loading

Before initiating any source code modifications or execution commands, the AI assistant MUST gather and absorb the following local context:
1. **Target Identification**: Understand exactly which service, endpoint, or component is being targeted.
2. **Read Associated Standards**: Fetch relevant docs from `docs/` (e.g., if modifying an admin dashboard, review `docs/admin/` and `docs/backend/`).
3. **Verify Clean Working Directory**: Ensure git staging area is understood before making alterations.

---

## 🔄 Step-by-Step Execution Protocol

### Step 1: Analyze & Reproduce (Zero-Modification Phase)
* **Goal**: Isolate the problem or map out existing dependencies without touching implementation code.
* **Actions**:
  * Run grep/searches to find symbol usages, interfaces, and dependent functions.
  * *If Fixing a Bug*: Create or modify an automated test file to reliably reproduce the failing scenario (Red state in TDD).
* **Exit Condition**: Clear comprehension of root cause or feature perimeter; reproducible failing test present.

### Step 2: Plan Modular Implementation (Minimal Diff Strategy)
* **Goal**: Determine the minimal, most reliable path to achieve the objective while adhering to `AGENTS.md` universal directives.
* **Actions**:
  * Design appropriate schemas and types first (Type-driven development).
  * Check if reusable utilities or helpers already exist in the codebase to prevent duplication (DRY).

### Step 3: Implement & Refactor (Green Phase)
* **Goal**: Apply atomic code alterations to fulfill the requirement or pass the failing test.
* **Actions**:
  * Modify code using safe, non-destructive editing tools.
  * Maintain existing comments and docstrings.
  * Ensure comprehensive error validation and logging around newly introduced code paths.
* **Exit Condition**: Code compiles cleanly without type errors or syntax warnings.

### Step 4: Verification & Regression Check
* **Goal**: Guarantee that the alteration did not introduce side-effects or regressions into adjacent modules.
* **Actions**:
  * Execute targeted automated unit and integration tests for the modified component.
  * Verify UI/Admin changes via layout responsiveness rules or build verifications.

### Step 5: Finalization & Commit Formatting
* **Goal**: Clean up temporary scratch scripts and generate an insightful version control record.
* **Actions**:
  * Format commit message strictly using Conventional Commits (`feat:`, `fix:`, `refactor:`, `test:`).
  * Summarize changes succinctly, listing files touched and design decisions made.
