---
title: "Architecture Decision Records (ADR) Log"
type: "local-brain-decisions"
project: "{{PROJECT_NAME}}"
version: "2.0.0"
---

# 🏛️ Architecture Decision Records (ADR) Log

> **A chronological log capturing pivotal engineering design decisions, trade-offs, and historical rationale within `{{PROJECT_NAME}}`.**

---

## 🎯 Purpose of this Log
When an AI assistant inspects existing code, it often attempts to "refactor" paradigms that were implemented intentionally to solve complex production edge cases. By consulting this log, AI agents honor established trade-offs!

---

## 📜 ADR #001: `{{ADR_TITLE_1: e.g., Adoption of BullMQ over RabbitMQ for Task Processing}}`
* **Date**: `{{DATE: 2026-08-01}}`
* **Status**: **ACCEPTED & ACTIVE**
* **Context**: Our backend APIs required background task queueing for invoice PDF rendering and notifications without adding extensive DevOps overhead.
* **Decision**: We selected **BullMQ (backed by Redis v7)** rather than deploying a standalone RabbitMQ cluster.
* **Architectural Command for AI Agents**: Do not suggest or install RabbitMQ bindings; utilize the existing unified BullMQ producer pattern in `{{SERVICE_PATH: e.g., src/queues/email-queue.service.ts}}`.

---

## ➕ Adding New ADRs
Whenever a major architectural pivot or dependency adoption occurs, engineers and AI assistants must record a new numbered section (`ADR #00X`) in this document immediately.
