---
title: "One-Shot Zero-Regression Execution Shield"
type: "workflow-state-machine"
category: "rules"
version: "3.0.0"
---

# 🛡️ One-Shot Zero-Regression Execution Shield

> **The mandatory operational security protocol guaranteeing that existing application functionality never regresses or breaks during autonomous AI feature development across ANY technology stack.**

---

## 🎯 Core Mandate: Zero Breakage Allowed
When an AI assistant refactors code or injects new modules in `projects/*`, it frequently overwrites adjacent business logic, deletes essential error handlers, or alters existing interface signatures—causing functional regressions.
In **v3.0**, autonomous execution is shielded: **Every feature or refactor must complete cleanly in one shot without breaking previously working tests or user experiences.**

---

## 🔒 The 3-Layer Zero-Regression Shield Architecture

```mermaid
graph TD
    A[🚀 Start Approved Plan Execution] --> B["Layer 1: Pre-Flight Baseline Test Loop"]
    B -->|Tests Pass (Green Baseline)| C["Layer 2: Non-Destructive Atomic Diffing"]
    B -->|Existing Tests Failing| B1[❌ PAUSE! Inform Developer of Pre-existing Broken State]
    
    C --> D["Layer 3: Post-Edit Automated Verification Suite"]
    D -->|Zero Regressions Detected| E[✨ Clean Commit & Autonomously Update .brain/memory/]
    D -->|Regression Test Triggered| D1[⚠️ Revert Bad Diff & Auto-Fix Logic Immediately]
```

### Layer 1: Pre-Flight Baseline Verification
Before invoking code edit commands on target project files, establish that existing systems are intact:
1. **Run Local Test Suite**: Execute unit and static type verification runners appropriate for the active project stack (*e.g., `npm test`, `npx tsc --noEmit`, `cargo test`, `pytest`, `flutter test`, `go test`*).
2. **Handle Pre-Existing Defects**: If pre-existing broken code is uncovered prior to your edits, **stop and notify the developer immediately** so you do not conflate past system defects with your planned implementations.
3. **Greenfield & Scaffolding Exemption**: If operating within a brand-new target project in `projects/*` where zero source code or automated test runner scripts currently exist, **do not pause or report test failures**. Immediately bypass Pre-Flight verification and directly initialize test framework configuration alongside your code generation!

### Layer 2: Non-Destructive Atomic Diffing
When altering existing project files, enforce strict modification boundaries:
1. **Minimal Drop-In Diffs**: Edit only the specific lines containing target feature variables using modular replacement tools (*e.g., `replace_file_content`*). **Never attempt to overwrite or regenerate an entire massive multi-hundred line file** if only a single method requires adjustment.
2. **Preserve Adjacent Symbols**: Never delete existing helper functions, comments, docstrings, or export syntaxes unless instructed directly by an approved refactoring plan.
3. **Maintain Interface Backward Compatibility**: When expanding interfaces, type definitions, or SQL tables, introduce new properties as optional (`?` or `DEFAULT` nullable columns) first so existing calling consumers do not experience breaking type failures.

### Layer 3: Post-Edit Regression Verification Loop
Immediately following your edits and before concluding your operational turn:
1. **Re-run Automated Verifiers**: Execute the identical static typecheck and test commands from Layer 1.
2. **Targeted E2E / Integration Checks**: When modifying UI routing or backend REST contracts, verify matching interface boundaries.
3. **Automated Rollback Reflex**: If your recent edits cause a previously functional unit test to fail (regression detected), **do not present the task as finished**. Analyze the failing trace, apply correcting diff patches immediately, and re-test until a 100% green verification pass is confirmed!

---

## ⚡ Any-Stack Verifier Reference Summary
Whenever verifying code health during Layer 1 and Layer 3, execute commands aligned with the stack recorded in **[global-stack-state.json](../memory/global-stack-state.json)**:
```bash
# Node.js / TypeScript / React / Next.js / NestJS loop:
npm run tsc --noEmit && npm test -- --watchAll=false

# Python / FastAPI / Django loop:
pytest --maxfail=1 --disable-warnings -q

# Flutter / Dart Mobile loop:
flutter analyze && flutter test

# Go / Rust / C# loops:
go test ./...  # or: cargo test  # or: dotnet test
```
