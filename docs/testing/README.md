# 🧪 Testing Strategies & Quality Assurance (`/docs/testing/`)

> **Engineering Standards for Test-Driven Development (TDD), Unit, Integration, and End-to-End (E2E) Automation.**

---

## 🎯 Core Objectives & Scope

Automated testing is the primary confidence safety net enabling rapid enterprise refactoring and continuous AI-driven deployment pipelines. This directory defines uniform testing methodologies, mock boundary isolation, and regression prevention rules.

---

## 🏛️ Key Testing Architectural Pillars

1. **The Testing Pyramid**: Structure codebase suites to reflect an optimal balance:
   - **70% Unit Tests (Fast & Isolated)**: Verify discrete functions, pure utility algorithms, and data transformation business logic in isolation without I/O calls or actual network databases (Jest, Vitest, PyTest).
   - **20% Integration & API Tests (Realistic Boundries)**: Spin up isolated in-memory or Docker-based database containers (Testcontainers) to prove controller routes, database repositories, and service orchestration interact without flaws.
   - **10% End-to-End (E2E) UI & Flow Automation (High Fidelity)**: Automate realistic cross-browser user journeys (Login flows, payment checkout, admin table creation) utilizing headless automation engines (Playwright, Cypress).
2. **Test-Driven Development (TDD) Bug Squash Rule**: When diagnosing reported software bugs or regressions, engineers and AI assistants must **FIRST create a reproducing, failing automated test case (Red State)** before amending any implementation source code. Only once the test passes (Green State) is the bug deemed resolved.

---

## 📂 Contributing Guidelines for this Folder
When adding specifications to this folder, utilize `../../templates/doc-template.md` with category set to `testing`.
