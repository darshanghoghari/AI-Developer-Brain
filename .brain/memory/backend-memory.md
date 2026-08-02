---
title: "Backend Core & API Intelligence Memory Buffer"
type: "domain-memory-buffer"
targetProject: "projects/backend/"
version: "3.0.0"
---

# ⚙️ Backend Core & API Intelligence Memory Buffer

> **Token-Minimal Context Hub for `projects/backend/`.**  
> *Autonomous AI assistants MUST consult this buffer before editing backend code and MUST autonomously append new schema models, API routes, or environment keys immediately upon implementation.*

---

## 🚀 Active Stack & Architecture (Any-Stack Ready)
* **Language & Runtime**: `[e.g., Node.js 22 / Python 3.12 / Go 1.22 / Rust / Java / C# .NET]`
* **Framework**: `[e.g., NestJS / Express / FastAPI / Django / Gin / Spring Boot / ASP.NET]`
* **Database & ORM/Query Builder**: `[e.g., PostgreSQL + Drizzle ORM / Prisma / SQLAlchemy / GORM / SQLx]`
* **API Protocol**: `[e.g., REST OpenAPI 3.0 / GraphQL / gRPC / tRPC / WebSockets]`

---

## 🏛️ Ubiquitous Domain Dictionary & Entity Mapping
To prevent database hallucination and maintain zero-regression typing across microservices, reference these authoritative entity mappings:

| Domain Term / Concept | Actual Code Symbol / Interface | Database Table / Collection | Primary Identifier & Constraints |
| :--- | :--- | :--- | :--- |
| *Example: Corporate Tenant* | `TenantAccount` | `tenant_accounts` | `id (UUID v4), tenant_slug (UNIQUE INDEX)` |
| *Example: API Access Token* | `ServiceApiKey` | `service_api_keys` | `id (UUID v4), hashed_secret (Argon2id)` |
| *[Add Entity]* | `[...]` | `[...]` | `[...]` |

---

## 🛡️ Authoritative Environment Perimeter (`.env` Registry)
*Never hardcode secrets. All external API keys and database connections MUST be validated through structured schemas (Zod/Pydantic/Config Structs) before boot.*

```yaml
# Environment Variable Inventory (Record descriptions, never literal values!)
DATABASE_URL: "PostgreSQL connection string with pooled SSL mode"
JWT_ACCESS_SECRET: "Asymmetric RSA private key or 512-bit HS512 cryptographic secret"
REDIS_BROкер_URI: "Redis server endpoint for background async queues and worker pub/sub"
```

---

## 🔄 Self-Updating Memory Rules
1. Whenever a new entity table, migration, or authentication middleware is generated during a session, the AI must record the structural mapping above.
2. Maintain table formatting and prune obsolete temporary debug notes to preserve minimum token footprint!
