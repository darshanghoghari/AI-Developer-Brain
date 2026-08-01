---
title: "Ready-to-Use Individual Project Brain Starter Kit"
type: "starter-kit-documentation"
version: "2.0.0"
---

# 🧠 Ready-to-Use "Individual Project Brain" Starter Kit v2.0

> **A plug-and-play localized AI Brain package designed to transform any new or legacy software codebase into an autonomous, self-aware engineering repository equipped with interactive Q&A planning and zero-regression safeguards.**

---

## ⚡ 60-Second Installation Protocol

To endow any application repository (*mobile, SaaS dashboard, microservice*) with an individualized AI memory cortex:

1. **Copy Starter Components**: Copy `AGENTS.md` and the `.ai-brain/` directory from this starter kit directly into the root of your target app repository:
   ```bash
   # From your target project repository root:
   cp -r /path/to/AI-Developer-Brain/starter-kit/.ai-brain .
   cp /path/to/AI-Developer-Brain/starter-kit/AGENTS.md .
   ```
2. **Customize Bracketed Placeholders**: Open `AGENTS.md` and `.ai-brain/project-identity.md` inside your target app and replace bracketed placeholders (*e.g., `{{PROJECT_NAME}}`, `{{TECH_STACK}}`*) with actual local configuration strings.
3. **Connect Your AI Assistant**: Open your target project inside Cursor, Windsurf, Claude, or Gemini! The AI tool will auto-read `AGENTS.md`, link into the local `.ai-brain/` memory, and execute features via interactive Q&A and zero-regression loops!

---

## 📂 Starter Kit Directory Structure
```text
[Your Target Application Root]/
├── AGENTS.md                            # Localized v2.0 AI entry directive & rules interface
└── .ai-brain/                           # Localized Application Memory Cortex
    ├── project-identity.md              # Approved tech stack & framework boundaries
    ├── domain-rules-and-vocabulary.md   # Domain vocabulary & calculations encyclopedia
    ├── architecture-decisions.md        # Architecture Decision Records (ADRs) log
    ├── automated-verification-suite.md  # Explicit CLI test & deployment verifiers
    └── scratch/                         # Ephemeral AI workspace for test logs and debug scripts
```
