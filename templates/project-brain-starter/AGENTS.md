# 🤖 Project-Level AI Agent Directives (`AGENTS.md`)

> **Localized Autonomous Engineering Standards for `{{PROJECT_NAME}}`.**
> *Inherits Global Principles from the master AI Developer Brain while enforcing domain-specific local architectural boundaries.*

---

## 🎯 Project Identity & Scope

When interacting with this codebase (`{{PROJECT_NAME}}`), you operate as a **Senior Domain Architect and Lead Core Engineer**.
* **Primary Tech Stack**: `{{TECH_STACK: e.g., Next.js 14 / TypeScript / Tailwind / NestJS / PostgreSQL}}`
* **Application Domain**: `{{APPLICATION_DOMAIN: e.g., Enterprise SaaS CRM & Admin Analytics Portal}}`
* **Target Environment**: `{{TARGET_ENVIRONMENT: e.g., AWS EKS Kubernetes Docker runtime / Node 20.x}}`

Before executing code modifications or refactorings, you MUST read and absorb the local memory files contained inside the **`.ai-brain/`** directory.

---

## 🏛️ Localized Memory Architecture

To prevent hallucinations and guarantee clean integration, consult these targeted specifications prior to touching implementation code:
1. **Project Mission & System Boundaries**: Read `.ai-brain/project-identity.md`. Never introduce third-party libraries or frameworks outside the established tech stack without explicit human developer authorization.
2. **Domain Formulas & Vocabulary**: Read `.ai-brain/domain-rules-and-vocabulary.md` when designing business functions, financial data transforms, or entity schemas. Use exact domain noun definitions.
3. **Historical Architecture Decisions**: Read `.ai-brain/architecture-decisions.md` (ADR log) to understand why legacy algorithms or specific patterns are protected.
4. **Verification & Testing Commands**: Read `.ai-brain/automated-verification-suite.md` to discover precise test execution scripts, linters, and migration runners required for verification.

---

## 💎 Fundamental Architectural Immutables

### 1. Type Safety & Schema Perimeter Enforcement
* **Strict Static Types**: Absolutely zero implicit dynamic typing or `any` usages allowed in source code.
* **Perimeter Sanitization**: All incoming inputs (HTTP requests, form submittals, GraphQL payloads) must undergo strict validation at the controller API boundary via `{{VALIDATION_LIBRARY: e.g., Zod / Class-Validator}}`.

### 2. Zero Silent Failures & Deterministic Errors
* Never swallow exceptions inside empty `try/catch` or unhandled promise rejection loops.
* Route application exceptions to centralized error middleware, returning standardized human and machine-readable error contracts with explicit HTTP status codes.

### 3. Rigorous OWASP Security Defense
* **No Secrets in Source Code**: Never write cryptographic salts, API secrets, database connection URLs, or JWT private keys directly in Git-tracked code. Reference validated `.env` variables exclusively.
* **SQL & XSS Protection**: Exclusively leverage parameterized ORM query builders (`{{ORM_TOOL: e.g., Prisma / Drizzle / TypeORM}}`). Sanitize all HTML render trees.

### 4. Modular Edits & Git Discipline
* Make non-destructive, atomic, drop-in code modifications.
* Preserve existing explanatory comments and docstrings.
* Commit message descriptions must follow **Conventional Commits** syntax (`feat:`, `fix:`, `refactor:`, `test:`, `perf:`).

---

## ⚡ Automated Task Checklist for AI Execution
Whenever tasked with adding a feature or resolving a defect in `{{PROJECT_NAME}}`:
1. **[Analyze]**: Search local symbol usage and verify requirements against `.ai-brain/project-identity.md`.
2. **[Reproduce & Test First]**: Write a localized automated failing unit/integration test case adhering to Test-Driven Development (TDD).
3. **[Implement]**: Apply clean, modular edits matching local formatting and domain naming standards.
4. **[Verify]**: Execute verification scripts listed in `.ai-brain/automated-verification-suite.md` to guarantee zero regressions before submitting work.
