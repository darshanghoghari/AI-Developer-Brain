---
title: "Master Global Coding Guidelines & Idioms"
type: "coding-rules"
category: "rules-and-workflows"
version: "2.0.0"
---

# 💎 Master Global Coding Guidelines & Idioms

> **Universal programming rules enforcing high-scale readability, maintainability, architectural simplicity, and zero-hallucination discipline across any coding language.**

---

## 1. Clean Code Philosophy (SOLID / KISS / DRY)
* **Single Responsibility Principle (SRP)**: A class, module, or function must have exactly one reason to change. If a file exceeds 300 lines of code, decompose it into modular units.
* **Keep It Simple & Stupid (KISS)**: Reject unnecessary metaprogramming, complex nested abstractions, or architectural cleverness when standard conditional logic suffices.
* **Don't Repeat Yourself (DRY)**: Centralize application domain formulas, constants, and API interfaces into reusable services or shared types.

---

## 2. Universal Naming & Symbol Conventions
* **No Obscure Abbreviations**: Names must be self-documenting. Use `calculateInvoiceTotal`, `getUserByEmail`, or `isTransactionActive`. Never use cryptic shorthand (`val`, `data1`, `tmp`, `usr_chk`).
* **Boolean Identifiers**: Prefix boolean symbols with descriptive assertion verbs: `is`, `has`, `can`, or `should` (`isAuthenticated`, `hasPermission`, `canAccessAdmin`).

---

## 3. Structural Complexity & Guard Clauses
* **Eliminate Arrow Code**: Do not deeply nest sequential `if/else` conditional trees (>2 indentation levels).
* **Enforce Guard Clauses**: Return early upon detecting invalid argument predicates or failing pre-conditions to keep happy-path business logic at the root indentation level.

```typescript
// ❌ Bad (Anti-Pattern: Deeply nested, error-prone arrow code)
function processRefund(user: User | null, invoice: Invoice | null): Result {
  if (user != null) {
    if (user.isActive) {
      if (invoice != null && !invoice.isReconciled) {
        return executeRefundTransaction(user, invoice);
      } else {
        throw new Error("Invalid invoice state");
      }
    } else {
      throw new Error("User account suspended");
    }
  } else {
    throw new Error("User not found");
  }
}

// ✅ Good (Production Standard: Clean guard clauses, linear flow)
function processRefund(user: User | null, invoice: Invoice | null): Result {
  if (!user) throw new NotFoundException("User not found");
  if (!user.isActive) throw new ForbiddenException("User account suspended");
  if (!invoice || invoice.isReconciled) throw new BadRequestException("Invalid invoice state");

  return executeRefundTransaction(user, invoice);
}
```

---

## 4. Multi-Language Concurrency & Error Contracts
* **Asynchronous Await & Thread Health**: Always await Promises cleanly in TypeScript/JS or leverage async Coroutines in Python/Go. Never run synchronous heavy loop computations on primary HTTP UI loops.
* **Deterministic Structured Errors**: When handling exceptions, return standardized, machine-readable JSON error payloads containing an explicit HTTP status code, error string code, and descriptive debugging context. Never silence exceptions in empty `try/catch` handlers.
