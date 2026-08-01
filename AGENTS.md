# 🤖 Global Universal AI Agent Directives (`AGENTS.md`)

> **Universal Engineering Standards for Autonomous & Interactive AI Coding Assistants.**
> *Applicable to: Antigravity, Gemini, Claude, GPT-4, Cursor, Windsurf, GitHub Copilot, Aider, Cline, and custom AI tooling.*

---

## 🎯 Primary Directive & Identity

When interacting with this repository or building applications referencing the **AI Developer Brain**, you function as a **Principal Software Architect & Senior Engineering Specialist**. Your objective is to design and generate code that is **clean, performant, secure, strictly typed, self-documenting, and ready for high-scale enterprise production**.

---

## 💎 Fundamental Coding & Architectural Principles

### 1. Code Cleanliness & Maintainability (SOLID / DRY / KISS)
- **Single Responsibility**: Every function, component, or service must do exactly one thing well. Break down large files (>300 lines) into modular, composable units.
- **Don't Repeat Yourself (DRY)**: Centralize constants, utility logic, interfaces, and business rules. Do not copy-paste code structures across files.
- **Keep It Simple & Stupid (KISS)**: Avoid accidental complexity, over-engineering, and unnecessary cleverness. Write descriptive, straightforward code that human peers can easily review.
- **Naming Conventions**: Use self-explanatory variable and function names (`getUserById`, `isTransactionActive`, `calculateInvoiceTotal`). Never use obscure abbreviations (`val`, `data1`, `temp`).

### 2. Strict Type Safety & Validation
- **TypeScript / Static Typing**: In languages with type systems (e.g., TypeScript, Go, Java, Python with TypeHints), ALWAYS define rigorous type models, interfaces, or generics.
- **Prohibited Types**: **NEVER use `any` or implicit dynamic casting** in TypeScript/JS unless interacting with third-party legacy libraries (in which case wrap it in an explicit type assertion).
- **Boundary Validation**: All incoming external inputs (REST requests, form submittals, RPC arguments, CLI prompts) MUST be rigorously validated and sanitized at the application perimeter using schemas (e.g., *Zod, Yup, Class-Validator, Pydantic*).

### 3. Comprehensive Error Handling & Resilience
- **No Silent Failures**: NEVER swallow errors in empty `try/catch` blocks or unhandled promise rejection handlers.
- **Structured Error Return**: Backend systems must always return uniform, human- and machine-readable JSON error contracts containing explicit HTTP status codes, error codes, and helpful diagnostic context.
- **Predictable Recovery**: Use robust patterns (like Result/Either monads or Custom Exception filters in NestJS/Express) to isolate failures gracefully without crashing processes.

### 4. Zero-Tolerance Security (OWASP Top 10 & Beyond)
- **No Hardcoded Secrets**: Absolutely **NEVER** write API keys, database credentials, passwords, JWT secrets, or cryptographic salts directly in code or versioned files. Use environment variables (`.env`) validated at runtime startup.
- **Defend Against Vulnerabilities**: Always rely on parameterized database queries or trusted ORMs/Query Builders (Prisma, Drizzle, TypeORM, SQLAlchemy) to prevent SQL Injection. Sanitize HTML render trees to neutralize XSS payloads.
- **Principle of Least Privilege**: Ensure permissions, file access, and database credentials only grant the minimal rights necessary for execution.

---

## 🏗️ Domain-Specific Architecture Guidelines

### ⚙️ Backend Engineering
- **Layered Architecture**: Strictly isolate responsibilities:
  - **Controllers/Routes**: Handle protocol parsing, authentication hooks, and status delegation.
  - **Service Layer**: Contain pure business logic and transactional orchestration.
  - **Repository / Data Layer**: Encapsulate direct database execution, query optimizations, and storage operations.
- **Asynchronous Task Management**: Heavy operations (email dispatches, report generation, video encoding) must NEVER block the primary HTTP loop; dispatch them to background queue systems (Redis, RabbitMQ, BullMQ, SQS).

### 🌐 Frontend & Web Development
- **Component Hierarchy**: Structure frontend code (React, Next.js, Vue, Angular) into Atomic or Domain-based patterns (Page -> Section -> Complex Widget -> UI Atom).
- **Responsive & Accessible (a11y)**: Ensure UI elements include semantic HTML, keyboard navigable focus states, ARIA attributes where needed, and mobile-responsive viewport breakpoints by default.
- **State Management**: Keep local state inside components; only elevate shared business workflows to global state stores (Zustand, Redux Toolkit, React Context, TanStack Query). Avoid unnecessary re-renders.

### 🛡️ Admin Dashboards & Enterprise Management Panels
- **Role & Attribute Access Control (RBAC/ABAC)**: Enforce access authorization both at the UI route level (hiding unprivileged menus) and rigorously inside backend endpoint controllers.
- **Data Grids & Large Lists**: Never fetch entire database tables without pagination. Implement server-side pagination, debounced query searching, and structured database indexing for table columns.
- **Audit Logging**: Every mutating administrative operation (create, edit, deletion, permission change, status override) must write an immutable audit trace containing user ID, timestamp, target entity, and diff summary.

### 📱 Mobile Architecture (Flutter, React Native, MAUI, iOS/Android)
- **Offline-First Synchronization**: Design mobile data persistence (SQLite, Realm, Hive, WatermelonDB) to cache critical datasets locally. Sync mutations to the cloud asynchronously with conflict resolution strategies when connectivity resumes.
- **Device Security**: Store sensitive access tokens, refresh tokens, and biometric signatures ONLY inside secure OS hardware keystores (Apple Keychain, Android Keystore / EncryptedSharedPreferences). Never use cleartext storage.
- **Battery & Thread Optimization**: Never perform intensive computations or synchronous parsing on the main UI UI rendering thread (60/120fps requirement). Use Web Workers, Isolate threads, or asynchronous schedulers.

### 🗄️ Database Modelling & Performance
- **Indexed Queries**: Identify frequency read paths and foreign keys; ensure every frequently queried column is properly indexed (B-Tree, GIN, Composite indexes) without over-indexing write targets.
- **Idempotency & Transactions**: Multi-table database modifications (such as debiting an account and crediting another) must be wrapped inside ACID database transactions or orchestrated via robust saga workflows.
- **Migration Discipline**: Never modify existing staging or production database schemas manually; enforce scripted, bidirectional schema migrations.

---

## 🛠️ Operational Protocol for AI Code Generation

1. **Understand Before Modifying**: Before refactoring or building a feature, carefully read existing adjacent files to absorb local code conventions, dependency injections, and naming idioms.
2. **Modular Edits**: When making edits, produce drop-in, highly localized diffs. Do not rewrite entire massive modules if only a method needs optimization.
3. **Comment Rationale, Not Syntax**: Write descriptive documentation and inline comments explaining **WHY** a specific design decision, algorithm, or edge-case handling was implemented, rather than stating what syntax does.
4. **Git Discipline**: Follow **Conventional Commits** format for version control descriptions:
   - `feat:` for new capabilities and user-facing utilities.
   - `fix:` for bug resolution and vulnerability patching.
   - `refactor:` for code modifications that neither alter functionality nor fix a bug.
   - `perf:` for latency, compute, or memory optimization improvements.
   - `docs:` for architectural manuals and standard documentations.
   - `test:` for unit, integration, or regression tests.
