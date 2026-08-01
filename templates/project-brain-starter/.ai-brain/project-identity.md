---
title: "Project Identity & Architecture Scope"
type: "local-brain-identity"
project: "{{PROJECT_NAME}}"
version: "1.0.0"
---

# 🎯 Project Identity & Architecture Scope

> **The primary single source of truth defining application objectives, technological boundaries, and operational constraints for `{{PROJECT_NAME}}`.**

---

## 🏛️ System Core Overview
* **Application Name**: `{{PROJECT_NAME: e.g., Apex CRM & Finance Portal}}`
* **Primary Objective**: `{{OBJECTIVE_SUMMARY: e.g., Handle customer invoicing, subscription billing, and real-time enterprise management dashboards.}}`
* **Current Lifecycle State**: `{{STATE: e.g., Active Production MVP / Scaling Stage / Legacy Maintenance}}`

---

## 🛠️ Approved Technology Stack

To prevent AI hallucination and unauthorized dependency sprawl, AI coding agents must restrict their implementations exclusively to the following approved frameworks and versions:

| Component Category | Approved Technology & Version | Strict Usage Constraints |
| :--- | :--- | :--- |
| **Frontend Framework** | `{{FRONTEND: e.g., Next.js 14 (App Router) / TypeScript 5.x}}` | Use Functional Components and Server Components by default. |
| **Styling & Design** | `{{STYLING: e.g., Tailwind CSS v3.4 / Radix UI / Shadcn}}` | Rely strictly on centralized design token colors; avoid raw CSS hacks. |
| **Backend API Runtime** | `{{BACKEND: e.g., Node.js v20.x / NestJS v10.x / Express}}` | Enforce Dependency Injection and Controller/Service/Repository layer separation. |
| **Database & ORM** | `{{DATABASE: e.g., PostgreSQL v16 / Prisma ORM v5}}` | Never execute raw un-parameterized SQL queries; rely on typed ORM contracts. |
| **Caching & Queues** | `{{CACHING: e.g., Redis v7 / BullMQ Task Engine}}` | Offload all bulk operations and email dispatches to async queues. |
| **Authentication** | `{{AUTH: e.g., JWT Short-lived tokens / OAuth2 / Bcrypt}}` | Never store tokens in unencrypted local storage or cleartext cookies. |

---

## 🚫 Architectural Prohibited Actions (Don'ts)
1. **DO NOT** modify existing production staging database schemas without writing a structured bidirectional migration script in `{{MIGRATION_PATH: e.g., ./prisma/migrations}}`.
2. **DO NOT** introduce state management libraries (Redux, MobX) if lightweight localized state via `{{STATE_TOOL: e.g., Zustand or TanStack Query}}` is already specified as the default project standard.
3. **DO NOT** execute blocking network calls or third-party webhooks inside synchronous user-facing request endpoints without wrapping in timeout guards or asynchronous job queues.
