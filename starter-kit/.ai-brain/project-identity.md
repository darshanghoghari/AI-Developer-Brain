---
title: "Project Identity & Architecture Scope"
type: "local-brain-identity"
project: "{{PROJECT_NAME}}"
version: "2.1.0"
---

# 🎯 Project Identity & Architecture Scope

> **The primary single source of truth defining application objectives, technological boundaries, and operational constraints for `{{PROJECT_NAME}}`.**

---

## 🏛️ System Core Overview
* **Application Name**: `{{PROJECT_NAME: e.g., Apex CRM & Finance Portal}}`
* **Primary Objective**: `{{OBJECTIVE_SUMMARY: e.g., Handle customer invoicing, subscription billing, and real-time enterprise management dashboards.}}`
* **Current Lifecycle State**: `{{STATE: e.g., Active Production MVP / Scaling Stage / Legacy Maintenance}}`

---

## 🛠️ Approved Technology Stack & Constraints

To prevent dependency hallucination, AI assistants must restrict implementations exclusively to the following approved stack:

| Component Category | Approved Technology & Version | Strict Usage Constraints |
| :--- | :--- | :--- |
| **Frontend Framework** | `{{FRONTEND: e.g., Next.js 14 (App Router) / TypeScript 5.x}}` | Use Functional Components and Server Components by default. |
| **Styling & Design** | `{{STYLING: e.g., Tailwind CSS v3.4 / Radix UI / Shadcn}}` | Rely strictly on centralized design token colors; avoid raw CSS hacks. |
| **Backend API Runtime** | `{{BACKEND: e.g., Node.js v20.x / NestJS v10.x / Express}}` | Enforce Dependency Injection and Controller/Service/Repository separation. |
| **Database & ORM** | `{{DATABASE: e.g., PostgreSQL v16 / Prisma ORM v5}}` | Never execute raw un-parameterized SQL queries; rely on typed ORM contracts. |
| **Caching & Queues** | `{{CACHING: e.g., Redis v7 / BullMQ Task Engine}}` | Offload all bulk operations and email dispatches to async queues. |
| **Authentication** | `{{AUTH: e.g., JWT Short-lived tokens / OAuth2 / Bcrypt}}` | Never store tokens in unencrypted local storage or cleartext cookies. |
| **Utility & Validation Tooling** | `{{UTILITIES: e.g., Zod v3 / date-fns / Lucide Icons / clsx}}` | Rely on standardized helper methods; never reinvent common regex or formatting logic. |
| **Domain SDKs & Tooling** | `{{SDKS: e.g., Recharts / Stripe SDK / AWS SDK / Multer}}` | Verify SDK static typing contracts before integration; wrap calls in structured error handlers. |

* **Standard Library Exemption**: Standard helper packages matching the core tech ecosystem (*e.g., Zod, date utilities, iconography, UI charting*) may be installed autonomously with a post-installation notification. Only structural architectural pivots (*e.g., switching database engines or state management frameworks*) require explicit interactive Q&A authorization.

---

## 📂 Target Directory Structural Conventions

To maintain uniform codebase organization across multi-turn autonomous AI sessions, place source files exclusively within this approved directory hierarchy:

```text
{{SOURCE_ROOT: e.g., src/}}/
├── components/         # Reusable atomic UI elements and styling widgets
├── features/           # Domain-centric business components and modular feature slices
├── schemas/            # Zod validation schemas and static perimeter interface boundaries
├── services/           # Backend API interaction logic and external third-party SDK clients
└── utils/              # Pure functional helper math, formatters, and global constants
```
