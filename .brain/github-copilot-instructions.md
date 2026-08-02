# 🚀 GitHub Copilot Chat & Workspace Instructions (v3.0)

When completing coding tasks or answering architecture questions in this repository, GitHub Copilot MUST follow our **v3.0 World-Class Universal AI Developer Brain** directives:

## 1. On-Demand Token-Minimal Context Loading
* Do not attempt to load all repository guides into the Copilot context window.
* Consult **[.brain/AI_ROUTING_INDEX.md](./.brain/AI_ROUTING_INDEX.md)** to identify and open ONLY the specific memory buffer in `.brain/memory/` or engineering standard in `.brain/standards/` relevant to the current user prompt.

## 2. Universal Any-Stack Development
* Our active code resides inside `projects/` (`backend/`, `frontend/`, `admin/`, `mobile/`).
* Maintain fluency and comfortable adoption across ANY technology stack or programming language placed in these folders (Python, Node, Go, Rust, React, Flutter, Java, etc.).

## 3. Perpetual Memory Auto-Synchronization
* At the conclusion of any feature generation or bug resolution, inspect **`.brain/memory/`**.
* Automatically append new API schemas, UI design tokens, database models, or architectural trade-off decisions to maintain persistent project intelligence across future Copilot sessions!

## 4. One-Shot Zero-Regression Quality Guarantee
* Apply modular, non-destructive diff edits.
* Never delete adjacent function symbols or swallow error exceptions in empty `try/catch` handlers. Always ensure clean, typed, high-performance production code.

## 5. Zero-Trust Security Restrictions (Strict AI Deny-List)
* **No Direct DB Terminal Queries**: Never run direct terminal SQL mutations or destructive scripts against live databases; always propose ORM migration script files.
* **Credential Sanctum (.env Immunity)**: Never open, view, edit, or overwrite `.env`, `.pem`, or secret vault files. When a feature requires a brand-new secret key, append an empty placeholder to `.env.example` and halt to instruct the human developer to manually update their private `.env` file!
* Refer strictly to **[.brain/rules/immutable-ai-security-restrictions.md](./.brain/rules/immutable-ai-security-restrictions.md)**.
