# 🧠 Ready-to-Use "Individual Project Brain" Starter Kit

> **A Plug-and-Play Localized AI Brain Package designed to transform any new or existing application repository into an autonomous, AI-ready engineering workspace.**

---

## 🎯 Executive Overview & Purpose

Every software application is unique. While global engineering rules provide foundation and discipline, every specific codebase requires its own **Localized Memory Cortex** to preserve domain rules, architecture decisions, database constraints, and verification protocols.

This starter kit is designed to be copied directly into any application root (Mobile, Admin SaaS, Backend Service). Once added, any AI coding assistant (Cursor, Windsurf, Copilot, Gemini, Claude) instantly recognizes the project boundaries and acts as an autonomous domain expert!

---

## ⚡ 60-Second Installation Protocol

To endow any existing or new repository with an individual AI Brain:

1. **Copy Starter Kit Components**: Copy `AGENTS.md` and the `.ai-brain/` folder directly from this starter template into the root of your target project repository:
   ```bash
   # From your target application root directory:
   cp -r /path/to/AI-Developer-Brain/templates/project-brain-starter/.ai-brain .
   cp /path/to/AI-Developer-Brain/templates/project-brain-starter/AGENTS.md .
   ```
2. **Customize Placeholder Values**: Open `AGENTS.md` and `.ai-brain/project-identity.md` in your target repo and replace bracketed placeholders like `{{PROJECT_NAME}}` and `{{TECH_STACK}}` with actual project parameters.
3. **Connect Your AI IDE**: Open your target application inside Cursor, Windsurf, or VS Code / Gemini. The assistant will auto-detect `AGENTS.md` and link directly into your app's local memory cortex!

---

## 📂 Starter Package Structure

```text
[Your Application Root]/
│
├── AGENTS.md                            # Primary AI entry directive & rules interface
│
└── .ai-brain/                           # Local Application Memory Cortex
    ├── project-identity.md              # Core mission, tech stack & framework boundaries
    ├── domain-rules-and-vocabulary.md   # Domain vocabulary & calculations glossary
    ├── architecture-decisions.md        # Architectural Decision Records (ADRs) log
    ├── automated-verification-suite.md  # Precise CLI test & deployment verifiers
    └── scratch/                         # Ephemeral AI workspace for test logs and scripts
```
