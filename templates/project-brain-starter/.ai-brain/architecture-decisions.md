---
title: "Architecture Decision Records (ADR) Log"
type: "local-brain-decisions"
project: "{{PROJECT_NAME}}"
version: "1.0.0"
---

# 🏛️ Architecture Decision Records (ADR) Log

> **A chronological log capturing pivotal engineering design decisions, trade-offs, and historical rationale within `{{PROJECT_NAME}}`.**

---

## 🎯 Purpose of this Log
When an AI assistant inspects existing code, it often attempts to "refactor" unfamiliar paradigms that were actually implemented intentionally to solve complex production edge cases. 
By consulting this log prior to making structural alterations, engineers and AI assistants honor existing technical trade-offs!

---

## 📜 ADR #001: `{{ADR_TITLE_1: e.g., Adoption of BullMQ over RabbitMQ for Task Processing}}`
* **Date**: `{{DATE: 2026-08-01}}`
* **Status**: **ACCEPTED & ACTIVE**
* **Context & Problem**: Our backend REST APIs required background task queueing for invoice PDF rendering and batch notification dispatching without incurring extensive DevOps management overhead.
* **Decision**: We selected **BullMQ (backed by Redis v7)** rather than deploying a standalone RabbitMQ server cluster.
* **Consequences & Trade-offs**:
  * ✅ *Positive*: Zero extra server deployment costs; directly piggybacks on our existing production Redis caching infrastructure.
  * ⚠️ *Trade-off*: Memory consumption on Redis must be actively monitored with TTL eviction limits applied to completed job queues.
* **Architectural Command for AI Agents**: Do not suggest or install RabbitMQ client bindings; utilize the existing unified BullMQ producer pattern in `{{SERVICE_PATH: e.g., src/queues/email-queue.service.ts}}`.

---

## 📜 ADR #002: `{{ADR_TITLE_2: e.g., Server-Side Pagination Discipline for Admin Data Grids}}`
* **Date**: `{{DATE: 2026-08-01}}`
* **Status**: **ACCEPTED & ACTIVE**
* **Context & Problem**: Loading un-paginated user lists caused memory exhaustion on client browsers as table growth exceeded 10,000 records.
* **Decision**: Enforced mandatory **Cursor-based server pagination and debounced search parameter querying** across all backoffice endpoints.
* **Architectural Command for AI Agents**: Never generate an admin data grid or API endpoint that returns unbounded `findMany()` table arrays without offset/cursor pagination limits.

---

## ➕ Adding New ADRs
Whenever a major architectural pivot or library integration occurs, engineers and AI assistants must record a new numbered section (`ADR #00X`) in this document immediately.
