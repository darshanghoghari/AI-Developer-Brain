---
title: "AI Developer Brain Repository"
type: "master-repository-hub"
author: "Darshan Ghoghari"
email: "darshanghoghari5657@gmail.com"
version: "3.0.0"
---

# 🧠 AI Developer Brain

> **The ultimate open-source AI engineering knowledge hub, execution engine, and customizable "Project Brain" starter ecosystem for building scalable, high-scale production software with autonomous AI assistants.**

[![Version: 3.0.0](https://img.shields.io/badge/Version-v3.0.0-00E5FF)](https://github.com/)
[![Token Efficiency: 70% Saved](https://img.shields.io/badge/Token_Efficiency-70%25_Saved-00C853)](./.brain/AI_ROUTING_INDEX.md)
[![Zero-Trust Security: Enforced](https://img.shields.io/badge/Security-Zero--Trust_Deny_List-D50000)](./.brain/rules/immutable-ai-security-restrictions.md)
[![Universal Compatibility: Any Stack](https://img.shields.io/badge/Compatibility-Universal_Any--Stack-8A2BE2)](./projects/README.md)
[![AI Adaptors: Symlink Protected](https://img.shields.io/badge/IDE_Adaptors-Zero_Git_Clutter-FF6D00)](#-universal-plug-and-play-ai-ide-adaptors)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

## 🚀 What is New in Version 3.0?

**Version 3.0** introduces a ground-up architectural overhaul designed to make artificial intelligence coding assistants (*Cursor, Windsurf, Claude, Gemini, Cline, Roo Code, Aider, GitHub Copilot*) dramatically faster, token-minimal, strictly secure, and universally compatible across any programming stack.

### 1. 🏛️ Ultra-Clean Root Architecture (2-Pillar Engine)
To eliminate workspace clutter and git commit noise, the root repository in Version 3.0 contains strictly **only two directories**:
* **`.brain/`**: The intelligence center housing all rules, automated scripts, memory buffers, and engineering standards.
* **`projects/`**: Dedicated code workspaces (`backend/`, `frontend/`, `admin/`, `mobile/`) ready for ANY technology stack.

### 2. ⚡ On-Demand Token-Minimal Routing (Saves ~70% Tokens)
Instead of forcing AI assistants to digest 50,000+ words of general documentation on every chat prompt, v3.0 introduces **[AI_ROUTING_INDEX.md](./.brain/AI_ROUTING_INDEX.md)**. AI models dynamically open *only* the specific domain memory buffer or handbook relevant to the current user request, eliminating attention hallucination and slashing token costs.

### 3. 🛡️ Zero-Trust Security & AI Deny-List
Version 3.0 enacts strict cybersecurity guardrails (**[.brain/rules/immutable-ai-security-restrictions.md](./.brain/rules/immutable-ai-security-restrictions.md)**):
* **No Direct DB Terminal Mutations**: AI agents are strictly prohibited from executing raw destructive terminal SQL commands (`DROP`, `TRUNCATE`). All changes must occur through version-controlled ORM migration files.
* **Credential Sanctum**: Real `.env`, `.pem`, or secret files are strictly forbidden from AI reading or modification. Assistants may only interact with safe `.env.example` templates.

### 4. 🏗️ The 4 Eternal Compatibility & Automation Pillars
To guarantee seamless operation over a 5-10 year software lifecycle without vendor lock-in, Version 3.0 incorporates:
* **Schema-First Interface Agreement**: Cross-stack communication between backend servers and frontend clients is strictly bound by language-agnostic data schemas ([OpenAPI 3.1 & Zod](./.brain/rules/schema-first-interface-agreement.md)).
* **Zero-Model Vendor Lock-In**: Supports flagship cloud AI IDEs as well as **100% offline open-source local LLMs (*Ollama, Llama 3/4, DeepSeek, Aider*)** via open ASCII/UTF-8 rule formats.
* **Continuous Automated Governance**: Integrated CI/CD pipelines ([brain-continuous-governance.yml](./.github/workflows/brain-continuous-governance.yml)) automatically scan repositories for secret leaks, structural regressions, and link health.
* **Automated Diff-to-Memory Reflector**: Built-in scripts ([diff-to-memory-reflector.ps1](./.brain/scripts/diff-to-memory-reflector.ps1)) monitor Git commit history and synchronize repository deltas directly into AI memory buffers!

---

## 🏛️ v3.0 Repository Hierarchy

```text
AI-Developer-Brain/                    <-- Master Repository Root (Zero Root Clutter)
│
├── 🧠 .brain\                         <-- Pillar 1: AI Intelligence & Directives Hub
│   ├── AGENTS.md                      <-- v3.0 Master Universal AI Directives & Ground Truth Law
│   ├── HOW_TO_WORK.md                 <-- v3.0 Step-by-Step Developer Operational Playbook
│   ├── AI_ROUTING_INDEX.md            <-- Token-Minimal On-Demand Router
│   ├── .cursorrules                   <-- Cursor AI IDE Adaptor Source
│   ├── .windsurfrules                 <-- Windsurf Cascade Flow Adaptor Source
│   ├── .clinerules                    <-- Cline / Roo Code Adaptor Source
│   ├── .aider.conf.yml                <-- Offline Open-Source Local Model (Ollama/Aider) Adaptor
│   ├── github-copilot-instructions.md <-- GitHub Copilot Workspace Instructions Source
│   ├── scripts\                       <-- Automated IDE Symlink, Governance CI & Reflector Scripts
│   ├── memory\                        <-- Auto-Updating AI Memory Buffers
│   ├── rules\                         <-- Security Deny-List, Schema Protocols & TDD Guardrails
│   ├── standards\                     <-- Universal Any-Stack Code Handbooks & Schema Contracts
│   └── scratch\                       <-- Ephemeral AI Debug Scratchpad
│
├── 🚀 projects\                       <-- Pillar 2: Dedicated Application Workspaces (Any Stack!)
│   ├── backend\                       <-- APIs, Cloud Microservices & DB Schemas
│   ├── frontend\                      <-- Web Applications & Interactive SaaS Portals
│   ├── admin\                         <-- Backoffice CRM & RBAC Dashboards
│   └── mobile\                        <-- Flutter, React Native, iOS & Android Apps
│
└── 📜 README.md                       <-- Master Repository Overview (This File!)
```

---

## 🛠️ Universal Plug-and-Play AI IDE Adaptors

In Version 3.0, AI IDE rules are dynamically linked to your workspace root via automated utilities, ensuring guaranteed AI adherence without polluting Git commits or working tree status:

### Step 1: Execute 1-Click IDE Activator
```bash
# For Windows / PowerShell Developers:
powershell -ExecutionPolicy Bypass -File ".\.brain\scripts\setup-ide-adaptors.ps1"

# For Linux / macOS / UNIX Developers & CI Pipelines:
bash ./.brain/scripts/setup-ide-adaptors.sh
```

| AI Tooling & Editor | Adaptor Source in `.brain/` | Local Linked Target (Git Ignored) | Key Features Unlocked |
| :--- | :--- | :--- | :--- |
| **Antigravity / Gemini IDE**| **[`.brain/AGENTS.md`](./.brain/AGENTS.md)** | Direct native scanning | Autonomous state machine, Q&A interview modals, subagent orchestration. |
| **Cursor AI IDE** | **[`.brain/.cursorrules`](./.brain/.cursorrules)** | Root `.cursorrules` | Token routing, modular drop-in diffing, automated memory sync. |
| **Windsurf (Codeium Flow)**| **[`.brain/.windsurfrules`](./.brain/.windsurfrules)** | Root `.windsurfrules` | Cascade multi-file refactoring under Zero-Regression CI verification. |
| **Cline / Roo Code**| **[`.brain/.clinerules`](./.brain/.clinerules)** | Root `.clinerules` / `.roorules` | Autonomous CLI coding agent guardrails enforcing TDD self-healing loops. |
| **Aider & Local Open-Source**| **[`.brain/.aider.conf.yml`](./.brain/.aider.conf.yml)**| Root `.aider.conf.yml` | 100% offline local LLM execution (*Ollama, Llama, DeepSeek*) reading pure markdown rules! |
| **GitHub Copilot Chat** | **[`.brain/github-copilot-instructions.md`](./.brain/github-copilot-instructions.md)**| `.github/copilot-instructions.md`| Domain-aware completion matching project vocabulary across any stack. |

---

## 🚀 Quick Start: Deploy Your Local Project Brain in 60 Seconds

You can instantly inject an autonomous memory cortex into **any** startup or legacy application repository using our plug-and-play starter kit:

```bash
# 1. Navigate to your existing software target application folder:
cd /path/to/my-saas-platform/

# 2. Copy the v2.1 Starter Kit directly into your root directory:
cp -r /path/to/AI-Developer-Brain/starter-kit/.ai-brain .
cp /path/to/AI-Developer-Brain/starter-kit/AGENTS.md .

# 3. Customize bracketed placeholders in .ai-brain/project-identity.md (e.g., {{TECH_STACK}}).
# 4. Open your project inside Cursor, Windsurf, Claude, or Gemini — your app now has intelligent memory!
```

> [!IMPORTANT]  
> **Want step-by-step guidance?** For our complete operational manual featuring ready-to-paste AI Prompting Payloads, Greenfield CLI scaffolding scripts, and JSON error contracts, read our definitive developer handbook:  
> **👉 [🚀 HOW_TO_WORK.md (Master Step-by-Step Execution Playbook)](./HOW_TO_WORK.md)**

---

## 🛠️ Supported AI Coding Tools

| AI Coding IDE / Platform | Configuration Method | Core Benefits |
| :--- | :--- | :--- |
| **Antigravity / Gemini IDE** | Native discovery; simply open workspace folder. | Autonomous multi-step planning, subagent task execution, and interactive modals. |
| **Cursor AI** | Symlink or copy root `AGENTS.md` to `.cursorrules`. | Precision context auto-completion, atomic multi-file edits, and TDD verification. |
| **Windsurf (Codeium)** | Reference master guidelines inside `.windsurfrules`. | Seamless cascade refactoring without breaking adjacent module interfaces. |
| **Claude Code (CLI)** | Run from root folder; natively reads `AGENTS.md`. | Deep architectural synthesis, structural refactoring, and ADR generation. |
| **GitHub Copilot / Aider** | Copy rules to `.github/copilot-instructions.md`. | Ubiquitous domain naming consistency and strict static type compliance. |

---

## 🐞 Found a Problem or Bug? Let Us Know!

> [!NOTE]  
> **We strive for bulletproof engineering perfection!** If you detect ANY problems, bugs, architectural edge cases, unclear formatting, or AI hallucination loops while utilizing this repository, **we want to fix it immediately!**

Please don't hesitate to report any problems directly to the repository maintainer:
* **📧 Direct Developer Email**: **[darshanghoghari5657@gmail.com](mailto:darshanghoghari5657@gmail.com)** *(Please subject your email: `[AI Brain Issue] - <Short Summary>`)*
* **🐛 GitHub Issues**: [Open a Bug Report or Feature Request](https://github.com/darshanghoghari/AI-Developer-Brain/issues) directly on GitHub!

Every problem detected helps us harden our rules, upgrade our standards, and improve autonomous engineering for developers around the globe!

---

## 🤝 Contributing & Community

We believe the future of software engineering is human architectural mastery combined with autonomous AI speed. Contributions from engineers, architects, and AI enthusiasts are deeply appreciated!

1. **Fork** the repository and create your custom feature branch (`git checkout -b feature/amazing-ai-rule`).
2. **Adhere** to our **Zero-Regression Shield** and clean formatting norms.
3. **Commit** your enhancements using conventional commits (`feat: add Rust concurrency standard`).
4. **Push** to your branch and submit a **Pull Request**!

### ⭐ Support the Mission
If this project saves you time, prevents AI bugs, or helps you ship production code faster:
* **⭐ Star this repository on GitHub**
* **🍴 Fork it for your personal engineering vault**
* **📢 Share it on X (Twitter), LinkedIn, and developers' communities!**

---

## 📜 License
This project is open-source and released under the **[MIT License](https://opensource.org/licenses/MIT)**. You are free to use, modify, and integrate this knowledge base into commercial, personal, or enterprise applications.

*Crafted with precision by **Darshan Ghoghari** & community contributors.*
