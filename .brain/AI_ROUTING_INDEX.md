---
title: "AI On-Demand Context & Skill Routing Index"
type: "token-minimal-routing-engine"
version: "3.0.0"
---

# 🎯 AI On-Demand Context & Skill Routing Index (`AI_ROUTING_INDEX.md`)

> **The Token-Minimal Navigation Core for Autonomous AI Assistants.**  
> **🚨 AI CRITICAL INSTRUCTION**: To maximize coding precision and maintain absolute minimum token consumption (**saving up to 70% prompt tokens**), you MUST NEVER load all domain rules or standards into your context window simultaneously. Instead, reference the intelligent routing table below and dynamically inspect **ONLY** the precise micro-handbook or memory buffer matching the developer's immediate task!

---

## 🗺️ Master Routing Decision Matrix

When processing a user prompt or analyzing an engineering bug, check the keywords and file targets in the table below. Invoke your local file viewer tool (*e.g., `view_file`*) to load ONLY the corresponding required reference:

### 1️⃣ Active Memory Buffers (Load Before Modifying Any Code)
| Target Workspace / Feature Scope | Trigger Keywords & File Match | Required Memory Buffer to Read & Update |
| :--- | :--- | :--- |
| **All Workspaces / Initialization** | "stack", "what framework", "dependency", setup, new project | [global-stack-state.json](./memory/global-stack-state.json) |
| **Backend / API / Cloud** | `projects/backend/*`, server, API endpoint, Database, ORM, Auth, Docker, Route, Controller | [backend-memory.md](./memory/backend-memory.md) |
| **Frontend / SaaS Portal** | `projects/frontend/*`, UI, component, styling, CSS, Tailwind, state, hooks, page router | [frontend-memory.md](./memory/frontend-memory.md) |
| **Enterprise Admin & Analytics** | `projects/admin/*`, RBAC, permissions, dashboard, DataGrid, audit logs, KPIs, admin tier | [admin-memory.md](./memory/admin-memory.md) |
| **Mobile Native / Cross-Platform**| `projects/mobile/*`, iOS, Android, Flutter, React Native, offline sync, SQLite, 120 FPS | [mobile-memory.md](./memory/mobile-memory.md) |
| **Architectural Trade-offs** | design decision, library evaluation, schema refactor, migration, why did we choose X | [architecture-decisions.md](./memory/architecture-decisions.md) |

---

### 2️⃣ Action Rules & Execution Workflows (Load Based on Task Type)
| Operational State / Requirement | When to Load This Rule Book | Targeted Rule File |
| :--- | :--- | :--- |
| **Token Optimization & Hygiene**| When searching codebases, drafting drop-in diffs, or clearing scratch logs | [token-optimization-and-context-hygiene.md](./rules/token-optimization-and-context-hygiene.md) |
| **Zero-Trust AI Security Deny-List**| Before running terminal commands, handling database schemas, or working near credentials/secrets | [immutable-ai-security-restrictions.md](./rules/immutable-ai-security-restrictions.md) |
| **Multi-Agent & TDD Healing** | When breaking complex tasks into subagent workflows or autonomously fixing bug regressions | [agentic-orchestration-and-tdd-healing.md](./rules/agentic-orchestration-and-tdd-healing.md) |
| **Interactive Q&A Planning** | When requirement ambiguity exists or trade-offs require user interview ("Grill-Me" loop) | [interactive-qna-planning.md](./rules/interactive-qna-planning.md) |
| **Zero-Regression Execution** | Before running terminal build commands, pre-flight baseline tests, or atomic diffs | [zero-regression-execution.md](./rules/zero-regression-execution.md) |
| **Clean Code & Variable Rules**| When structuring methods, classes, error handling structures, or SOLID guard clauses | [global-coding-guidelines.md](./rules/global-coding-guidelines.md) |
| **Schema-First Interface Protocol**| When establishing API endpoint contracts, Zod validators, or cross-stack fetch hooks | [schema-first-interface-agreement.md](./rules/schema-first-interface-agreement.md) |
| **Model-Agnostic Portability** | When configuring open-source CLI models (Aider, Roo, Ollama) or portable text memory | [model-agnostic-portability.md](./rules/model-agnostic-portability.md) |

---

### 3️⃣ Any-Stack Engineering Standards (Load for Production Snippets)
| Technical Domain | Applicable Technologies (Universal Any-Stack Engine) | Targeted Domain Handbook |
| :--- | :--- | :--- |
| **Backend & Cloud Services** | Node, Python, Go, Rust, Java, NestJS, FastAPI, Docker, Kubernetes, Redis Queues | [backend-and-cloud.md](./standards/backend-and-cloud.md) |
| **Frontend UI/UX Systems** | React, Next.js, Vue, Angular, Svelte, Tailwind, State Stores, Glassmorphism, Animations | [frontend-and-admin.md](./standards/frontend-and-admin.md) |
| **Mobile & Offline Engines** | Flutter, React Native, iOS SwiftUI, Android Kotlin, SQLite Sync, Secure Key Vaults | [mobile-and-offline.md](./standards/mobile-and-offline.md) |
| **Database & Cyber Security** | PostgreSQL, MySQL, MongoDB, ORMs, OWASP Top 10, SQL Injection Defense, DDoS limiters| [database-and-security.md](./standards/database-and-security.md) |
| **Testing & Quality Assurance** | Jest, Vitest, Pytest, Cypress, Playwright, TDD Bug Hunting, 70/20/10 Test Pyramid | [testing-and-qa.md](./standards/testing-and-qa.md) |

---

## ⚡ Token Optimization Golden Principle
> **"Read Only What You Need; Execute Systematically in One-Shot; Clean Up Your Footprint; Save Context Memories Immediately!"**
