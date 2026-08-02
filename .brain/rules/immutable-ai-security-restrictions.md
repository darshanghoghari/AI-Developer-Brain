---
title: "Immutable AI Security & Zero-Trust Restriction Guardrails"
type: "security-deny-list"
version: "3.0.0"
---

# 🛡️ Immutable AI Security & Zero-Trust Restriction Guardrails

> **The strict, non-negotiable Zero-Trust Deny-List and Security Mandates governing all autonomous AI coding assistants (*Cursor, Windsurf, Claude, Gemini, Cline, Copilot*).**  
> **🚨 PRIMARY DIRECTIVE**: To guarantee enterprise-grade safety and operational integrity, AI agents operating in this repository are strictly subjected to the immutable security boundaries defined below. Any attempt by an AI to breach these restrictions must be immediately aborted and reported to the human developer.

---

## 🚫 1. Absolute Prohibition of Direct Database Mutation & Production Execution
AI assistants are powerful code generators, but they must **NEVER** act as database administrators on active or live data servers:

### 1.1 No Direct SQL Terminal Queries
* **Prohibited Actions**: AI assistants are strictly banned from running terminal CLI database commands directly against staging or production instances (*e.g., `psql -U admin -c "DROP TABLE..."`, `mysql -u root`, `sqlite3 prod.db "DELETE FROM users;"`, or direct cloud DB shell scripts*).
* **Mandatory Abominable Words**: Never execute raw `DROP`, `TRUNCATE`, `ALTER`, or bulk `DELETE` SQL terminal commands on live database URIs.

### 1.2 The ORM Migration Only Rule
* All database schema alterations MUST be executed through **version-controlled ORM migration files** (*Prisma Migrations, Drizzle Kit, SQLAlchemy Alembic, Django Migrations, Entity Framework Core*).
* The AI may generate the migration TypeScript/Python script file inside `projects/*`, but it MUST pause and require human engineer review before running modifying production schema deployment commands!

---

## 🔐 2. Credential & Secret Sanctum (.env Human-Only Domain)
API keys, private tokens, encryption passwords, and database connection strings are an **exclusive Human-Only operational zone**.

### 2.1 Complete Immunity of Credential Files
* **Prohibited Files**: AI assistants are strictly prohibited from reading, opening, editing, or overwriting real credential files including:
  * `.env`, `.env.local`, `.env.production`, `.env.staging`
  * `*secrets*.yml`, `*credentials*.json`, `*.pem`, `*.id_rsa`, `.key`, `.p12`
  * AWS CLI configuration profiles, Docker secrets vaults, or Google Cloud service JSONs.
* **Why this is law**: Prevents AI models from accidentally exfiltrating secret API keys into chat logs or destroying live production connection strings with dummy placeholders.

### 2.2 The `.env.example` Protocol
* If a newly developed feature (*e.g., Stripe Payment Gateway*) requires a brand-new environment variable:
  1. The AI is ONLY permitted to append the empty key declaration into the public **`.env.example`** template (*e.g., `STRIPE_WEBHOOK_SECRET=your_secret_here`*).
  2. The AI must explicitly instruct the human developer: *"I have added `STRIPE_WEBHOOK_SECRET` to `.env.example`. **Please open your private `.env` file manually and insert your actual secret key.**"*

---

## 🚨 3. Zero Tolerance for Security Bypasses (Fail-Secure Law)
When resolving challenging compiler bugs or failing unit tests, AI assistants occasionally attempt shortcuts by disabling security barriers. **THIS IS STRICTLY ILLEGAL IN THIS WORKSPACE.**

### 3.1 Prohibited Security Shortcuts
1. **Never Disable Authentication & Authorization Guards**: Never comment out `@UseGuards(AuthGuard)`, JWT validation middleware, or RBAC permission checks simply to make a failing integration test pass.
2. **Never Disable SSL / TLS Certificates**: Never inject `rejectUnauthorized: false` or `process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0'` into network HTTP clients (*Axios, Fetch, Requests, gRPC*).
3. **Never Open Blanket CORS Defenses**: Never deploy `Access-Control-Allow-Origin: '*'` on credentials-enabled APIs or enterprise production servers. Specify explicit trusted front-end origins.
4. **Never Weaken Cryptography**: Always enforce industry-standard hashing algorithms (**Argon2id, Bcrypt with Salt Round >= 12, SHA-256 / SHA-512 for HMACs**). Never fallback to outdated MD5, SHA1, or plain-text password buffering.

---

## ⚖️ 4. Security Incident Escalation Protocol
If an AI assistant discovers an existing exposed private API key, hardcoded database password, or severe SQL injection vulnerability inside existing legacy code in `projects/*`:
1. **Stop Feature Work Immediately**: Do not silently ignore the vulnerability.
2. **Alert Developer via High-Priority Warning**: Display a prominent GitHub Caution Alert in chat detailing the exact file path and symbol containing the vulnerability.
3. **Execute Zero-Trust Patch**: Replace the hardcoded string with an environment variable reference (`process.env.VALIDATED_KEY` or `os.environ.get(...)`) and instruct the developer to immediately rotate the compromised credential in their cloud console!
