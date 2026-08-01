---
title: "Automated Verification & Build Command Reference"
type: "local-brain-verification"
project: "{{PROJECT_NAME}}"
version: "1.0.0"
---

# 🧪 Automated Verification & Build Command Reference

> **The authoritative CLI command playbook enabling AI coding agents to autonomously compile, verify, unit-test, lint, and deploy `{{PROJECT_NAME}}`.**

---

## 🎯 Verification & Zero-Regression Mandate
An AI assistant operating inside this project MUST never declare a feature, refactor, or bug resolution task complete without executing the relevant verification commands listed in this document to prove zero regression.

---

## ⚡ Direct Execution Commands

### 1. Build & Type Checking (Static Analysis)
Before running functional test suites, verify that all static types and syntax compile cleanly without warnings or errors:
```bash
# Type checking / lint verification:
{{COMMAND_TYPECHECK: e.g., npm run tsc --noEmit && npm run lint}}

# Production asset bundle build:
{{COMMAND_BUILD: e.g., npm run build}}
```

### 2. Automated Test Execution (TDD Red-Green Pipeline)
Whenever amending source logic or creating bug fix regressions, execute targeted testing suites:
```bash
# Execute unit testing suite across modified modules:
{{COMMAND_TEST_UNIT: e.g., npm test -- --watchAll=false}}

# Execute isolated E2E / integration API verification suites:
{{COMMAND_TEST_E2E: e.g., npm run test:e2e}}
```

### 3. Database Schema Migrations & Seeding
When modifying ORM schema models (`{{SCHEMA_PATH: e.g., ./prisma/schema.prisma}}`), enforce safe database sync execution:
```bash
# Generate database migration diff files:
{{COMMAND_MIGRATION: e.g., npx prisma migrate dev --name <descriptive-migration-name>}}

# Seed local development database with benchmark data:
{{COMMAND_SEED: e.g., npx prisma db seed}}
```

### 4. Local Development Server & Container Management
To spin up local server loops or Docker infrastructure for interactive human testing:
```bash
# Start containerized background services (Redis, PostgreSQL):
{{COMMAND_DOCKER_UP: e.g., docker-compose -f docker-compose.dev.yml up -d}}

# Launch interactive local development server:
{{COMMAND_DEV_SERVER: e.g., npm run dev}}
```

---

## 🛠️ Automated CI/CD Pre-Commit Rules
Ensure local Git staging cleanliness by running:
```bash
# Run Husky pre-commit format and verification hooks:
{{COMMAND_PRE_COMMIT: e.g., npm run format && npm run test:coverage}}
```
