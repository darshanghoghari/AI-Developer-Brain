---
title: "Global Multi-Language Coding Guidelines"
category: "rules"
domain: "universal"
tags: ["clean-code", "solid", "naming", "formatting"]
version: "1.0.0"
---

# 🌐 Global Multi-Language Coding Guidelines

This document serves as the extended deep-dive handbook for syntax cleanliness, architectural boundaries, and code readability across all programming frameworks within the **AI Developer Brain**.

---

## 1. Universal Naming Conventions & Semantics

Clear naming eliminates the necessity for redundant explanations and prevents AI hallucinations during code completions.

| Concept / Construct | Convention / Standard | Examples (Good) | Examples (Bad / Avoid) |
| :--- | :--- | :--- | :--- |
| **Variables & Properties** | Descriptive Nouns, camelCase / snake_case per language idiom | `customerInvoiceList`, `user_account_balance` | `lst`, `data`, `x`, `val1` |
| **Functions & Methods** | Verb-Noun combination representing action performed | `calculateTaxTotal()`, `fetchUserById()`, `renderGrid()` | `calc()`, `user()`, `doTask()` |
| **Boolean Flags** | Prefix with verbs like `is`, `has`, `should`, `can` | `isActive`, `hasPermission`, `canExecute` | `active`, `flag`, `status` |
| **Classes & Types** | PascalCase noun phrases representing domain concepts | `PaymentProcessor`, `UserAuthGuard`, `CustomerRepository` | `Processor`, `Helper`, `Manager1` |
| **Constants & Env Vars** | UPPER_SNAKE_CASE for unchanging environment or static literals | `MAX_LOGIN_ATTEMPTS`, `DATABASE_POOL_SIZE` | `maxAttempts`, `dbPool` |

---

## 2. Function & Method Complexity Limits

To maintain predictability for both human engineers and AI code assistants, strict complexity limits apply:
* **Line Limit**: A standard business logic function should ideally fit on a single screen (20-50 lines). If a function exceeds 80 lines, extract standalone calculations or data transformations into helper functions.
* **Parameter Count**: Limit function parameters to **4 or fewer**. If an operation requires more than 4 arguments, encapsulate them within an input Object/Interface (e.g., `UserCreateDTO`, `GridQueryOptions`).
* **Nesting & Guard Clauses**: Avoid deep nested `if / else` indentation ("Arrow Anti-Pattern"). Employ **Guard Clauses** to validate conditions and exit early at the top of the function:

```typescript
// ❌ BAD: Deeply nested conditions
function processPayment(account, amount) {
  if (account) {
    if (account.isActive) {
      if (amount > 0 && account.balance >= amount) {
        // ... Execute transaction ...
        return true;
      } else {
        throw new Error("Insufficient funds or invalid amount");
      }
    } else {
      throw new Error("Account suspended");
    }
  } else {
    throw new Error("Invalid account");
  }
}

// ✅ GOOD: Guard clauses with early returns
function processPayment(account: Account, amount: number): boolean {
  if (!account) throw new InvalidAccountException("Invalid account");
  if (!account.isActive) throw new AccountSuspendedException("Account suspended");
  if (amount <= 0 || account.balance < amount) {
    throw new InsufficientFundsException("Insufficient funds or invalid amount");
  }

  // ... Execute transaction cleanly at root indentation level ...
  return true;
}
```

---

## 3. Comments, Docstrings & Self-Documenting Code

* **Explain WHY, NEVER What**: Avoid useless comments that merely restate standard language syntax.
  ```python
  # ❌ BAD: Restates code
  counter += 1  # Increment counter by 1

  # ✅ GOOD: Explains engineering design rationale
  # Offset index by 1 to accommodate 1-based row header indexing in third-party Excel export library
  row_index += 1
  ```
* **API Documentation**: Every exposed library helper, REST controller, or service method MUST include standard structured docstrings (`JSDoc`, `Docstring`, `XMLDoc`) describing parameters, returned structures, and thrown exception types.
* **TODO Disciplined Triggers**: Never leave open-ended `// TODO: fix this` comments in staging or production. Annotate TODOs with an owner or issue tracker reference: `// TODO(#245): Deprecate legacy SHA-1 hashing algorithm before v2.0 release`.

---

## 4. Concurrency & Asynchronous Programming

* **Explicit Async Handling**: Never allow floating or uncaught Promises in asynchronous runtimes (Node.js, Deno, Python asyncio). Always wrap awaitable chains in appropriate error boundary guards or top-level task schedulers.
* **Deadlock & Race Condition Avoidance**: When querying and updating shared state (such as inventory count or account balance), utilize appropriate database-level locking (`SELECT FOR UPDATE`), atomic increment queries, or distributed locks (Redis Redlock). Never calculate financial increments solely in memory before overriding database rows.
