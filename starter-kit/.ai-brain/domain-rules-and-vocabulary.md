---
title: "Domain Rules, Vocabulary & Business Calculations"
type: "local-brain-domain"
project: "{{PROJECT_NAME}}"
version: "2.0.0"
---

# 📖 Domain Rules & Business Vocabulary

> **A specialized domain encyclopedia bridging the Ubiquitous Language shared between human engineers and autonomous AI coding assistants.**

---

## 🌐 Ubiquitous Domain Vocabulary

When writing variable names, database column schemas, or REST endpoints, AI assistants MUST strictly employ these terminology mappings:

| Domain Noun / Term | Precise Definition within `{{PROJECT_NAME}}` | Permitted Symbol Names | Prohibited / Misleading Terms |
| :--- | :--- | :--- | :--- |
| **`{{TERM_1: e.g., Account Tenant}}`** | `{{DEF_1: A corporate enterprise customer billing entity subscribing to our platform.}}` | `tenant`, `accountTenant`, `tenantId` | `userGroup`, `company`, `clientOrganization` |
| **`{{TERM_2: e.g., Active Subscription}}`** | `{{DEF_2: A billing contract currently yielding revenue without past-due payment holds.}}` | `activeSubscription`, `subscriptionContract` | `activePlan`, `paidTier`, `memberStatus` |
| **`{{TERM_3: e.g., Reconciled Invoice}}`** | `{{DEF_3: An invoice where general ledger debit matches total credit payments received.}}` | `reconciledInvoice`, `isReconciled` | `paidBill`, `clearedReceipt`, `settledOrder` |

---

## 📐 Business Logic & Calculation Formulas

To ensure mathematical consistency across UI displays and backend calculations:
* **Currency Math Mandate**: Always execute currency math using zero-decimal fractional integer representations (*in cents / paise, e.g., `$10.50` stored as `1050`*) to avoid binary floating-point rounding errors in Javascript or Python!
* **Formula 1**: `{{FORMULA_1: e.g., Net Revenue Retention (NRR) = ((CurrentARR + Expansion - Downgrade - Churn) / BaseARR) * 100}}`
