---
title: "Master Architecture Decision Records (ADRs)"
type: "architecture-decisions-log"
version: "3.0.0"
---

# 🏛️ Master Architecture Decision Records (ADRs)

> **The immutable log of significant structural engineering trade-offs, technology evaluations, and design consensus across all target workspaces (`backend`, `frontend`, `admin`, `mobile`).**  
> *Consult this record before making structural changes to avoid violating historical engineering alignment. When new architectural choices are approved during an Interactive Q&A Session, agents MUST autonomously log the trade-off here.*

---

## 📋 Architectural Decision Registry Table (Token-Minimal Index)

| ADR ID | Date | Workspace Scope | Decision Summary | Rationale & Trade-Off | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **ADR-001** | 2026-08-02 | Global (`.brain`) | **v3.0 Token-Minimal On-Demand Routing Engine** | Replace bulky monolith system instructions with structured `.brain/memory/` buffers and on-demand micro-handbook routing via `AI_ROUTING_INDEX.md`. Cuts prompt token overhead by 70% while improving LLM coding accuracy. | `ACCEPTED` |
| **ADR-002** | 2026-08-02 | Global (`projects/*`) | **Unified Any-Stack Project Root Segregation** | Keep all intelligence and rules cleanly sealed inside `.brain/` at root, and isolate active codebases inside `projects/` (`backend`, `frontend`, `admin`, `mobile`). Ensures universal stack adaptability across any programming language. | `ACCEPTED` |
| **ADR-003** | 2026-08-02 | Global (Execution) | **One-Shot Zero-Regression & Greenfield Exemption** | Mandate baseline testing before any modification on established repos; auto-exempt brand-new repositories to prevent deadlock and immediately scaffold baseline test runners. | `ACCEPTED` |
| **ADR-004** | 2026-08-02 | Global (AI Assistants)| **Universal Plug-and-Play IDE Adaptors** | Provide root wrapper adaptors (`.cursorrules`, `.windsurfrules`, `.clinerules`, Copilot instructions) that invoke `.brain/` to guarantee zero setup friction across any AI development IDE. | `ACCEPTED` |

---

## 🔄 How Agents Record New ADRs (Self-Updating Rule)
When a developer makes a significant architecture decision during interactive Q&A or express feature development (*e.g., adopting Redis over RabbitMQ, choosing Drizzle over Prisma, selecting Auth0 over Clerk*), the autonomous AI assistant MUST append a new concise row to the table above before completing the session!
