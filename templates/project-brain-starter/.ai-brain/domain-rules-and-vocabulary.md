---
title: "Domain Rules, Vocabulary & Business Calculations"
type: "local-brain-domain"
project: "{{PROJECT_NAME}}"
version: "1.0.0"
---

# 📖 Domain Rules & Business Vocabulary

> **A specialized domain encyclopedia bridging the Ubiquitous Language shared between human engineers, domain specialists, and autonomous AI coding assistants.**

---

## 🌐 Ubiquitous Domain Vocabulary

When writing variable names, database column schemas, interface definitions, or REST endpoints, AI assistants MUST strictly employ these exact domain terminology mappings:

| Domain Noun / Term | Precise Definition within `{{PROJECT_NAME}}` | Permitted Symbol Names | Prohibited / Misleading Terms |
| :--- | :--- | :--- | :--- |
| **`{{TERM_1: e.g., Account Tenant}}`** | `{{DEF_1: A corporate enterprise customer billing entity subscribing to our platform.}}` | `tenant`, `accountTenant`, `tenantId` | `userGroup`, `company`, `clientOrganization` |
| **`{{TERM_2: e.g., Active Subscription}}`** | `{{DEF_2: A billing contract currently yielding revenue without past-due payment holds.}}` | `activeSubscription`, `subscriptionContract` | `activePlan`, `paidTier`, `memberStatus` |
| **`{{TERM_3: e.g., Reconciled Invoice}}`** | `{{DEF_3: An invoice where general ledger debit matches total credit payments received.}}` | `reconciledInvoice`, `isReconciled` | `paidBill`, `clearedReceipt`, `settledOrder` |

---

## 📐 Business Logic & Calculation Formulas

To ensure mathematical consistency across frontend displays, analytical admin tables, and backend invoicing engines, follow these validated calculation formulas:

### 1. `{{FORMULA_1: e.g., Net Revenue Retention (NRR) Calculation}}`
* **Formula**: `(($CurrentPeriodRecurringRevenue + $ExpansionRevenue - $DowngradeLosses - $ChurnLosses) / $BaseRecurringRevenue) * 100`
* **Implementation Constraint**: Always execute currency math using zero-decimal fractional integer representations (`in cents / paise`, e.g., `$10.50` stored as `1050`) to avoid floating-point binary rounding errors in Javascript or Python.

### 2. `{{FORMULA_2: e.g., User Password Retry Lockout Threshold}}`
* **Formula**: Lock account for **{{LOCKOUT_MINUTES: e.g., 15 minutes}}** upon reaching **{{MAX_RETRIES: e.g., 5 consecutive failed login authentication challenges}}** within a 10-minute sliding window.

---

## 🛡️ Specific Domain Validation Constraints
* **Age & Jurisdiction Limit**: Users must be validated as `>= 18` years of age during profile onboarding via validated ISO Date parsing.
* **Email & Phone Sanitization**: Trim whitespace and lowercase email addresses before evaluating indexing lookups in database repositories.
