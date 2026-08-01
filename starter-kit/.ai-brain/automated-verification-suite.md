---
title: "Automated Verification & Build Command Reference"
type: "local-brain-verification"
project: "{{PROJECT_NAME}}"
version: "2.0.0"
---

# 🧪 Automated Verification & Build Command Reference

> **The authoritative CLI command playbook enabling AI assistants to autonomously execute Pre-Flight and Post-Edit zero-regression verification suites for `{{PROJECT_NAME}}`.**

---

## ⚡ Zero-Regression CLI Verifiers

### 1. Static Analysis & Type Checking
Execute before running functional tests to confirm zero syntax or type casting errors:
```bash
# Type checking / lint verification:
{{COMMAND_TYPECHECK: e.g., npm run tsc --noEmit && npm run lint}}

# Production build test:
{{COMMAND_BUILD: e.g., npm run build}}
```

### 2. Automated Test Execution (Pre-Flight & Post-Edit)
Execute during the Zero-Regression Execution loop to verify zero feature breakage:
```bash
# Execute unit test suites across modified modules:
{{COMMAND_TEST_UNIT: e.g., npm test -- --watchAll=false}}

# Execute integration API verification suites:
{{COMMAND_TEST_E2E: e.g., npm run test:e2e}}
```

### 3. Database Schema Migrations & Containers
```bash
# Generate safe bidirectional database migration scripts:
{{COMMAND_MIGRATION: e.g., npx prisma migrate dev --name <migration-name>}}

# Start local Docker container infrastructure:
{{COMMAND_DOCKER_UP: e.g., docker-compose -f docker-compose.dev.yml up -d}}
```
