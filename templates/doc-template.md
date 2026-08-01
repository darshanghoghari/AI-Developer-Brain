---
title: "[Standard Title: e.g., REST API Error Handling Protocol]"
category: "backend"          # Choose from: architecture | backend | frontend | mobile | admin | database | devops | security | performance | testing
domain: "node, typescript"  # Applicable languages, libraries, or frameworks (or 'universal')
tags: ["error-handling", "api", "http", "exceptions"]
version: "1.0.0"
author: "AI Developer Brain"
last_updated: "2026-08-01"
---

# 📖 [Standard Title]

> **Executive Summary**: A crisp, 1-2 sentence high-level definition of what this engineering standard dictates and why it is essential for production applications.

---

## 🎯 Architectural Rationale & Why This Matters

Explain *why* this practice exists. What common failures, architectural debt, or security vulnerabilities arise when developers or AI assistants ignore this rule?

* **Reliability & Uptime**: [How this prevents crashes or race conditions]
* **Maintainability**: [Why this lowers cognitive load for peer reviews and scaling]
* **Security & Performance**: [How this eliminates bottlenecks or attack surfaces]

---

## 📐 The Standard Rules

1. **Rule 1 Title (Unambiguous Command)**: Precise instruction explaining what must be done.
2. **Rule 2 Title (Unambiguous Command)**: Provide concrete constraints (e.g., limits, conventions, pattern names).
3. **Rule 3 Title (Unambiguous Command)**: Address edge-case handling or boundary validation.

---

## 💻 Code Proof: Good vs. Bad Implementation

Every standard in the **AI Developer Brain** MUST provide clear comparative implementation snippets to guide human engineers and prevent LLM hallucinations.

### ❌ Anti-Pattern (Bad / Vulnerable / Unscalable)
Explain why the following snippet is risky or anti-pattern:

```typescript
// BAD: Uncaught asynchronous errors and obscure generic HTTP statuses
app.get('/api/users/:id', async (req, res) => {
  const user = await db.users.findOne({ id: req.params.id });
  if (!user) {
    res.status(500).send("Error occured");
  }
  res.send(user);
});
```

### ✅ Production Standard (Good / Secure / Performant)
Explain how the standardized implementation fixes the drawbacks:

```typescript
// GOOD: Explicit validation, strongly-typed errors, and graceful delegation to exception middleware
app.get('/api/users/:id', async (req: Request, res: Response, next: NextFunction) => {
  try {
    const userId = z.string().uuid().parse(req.params.id);
    const user = await userRepository.findObeById(userId);
    
    if (!user) {
      throw new NotFoundException(`User with ID ${userId} not found`);
    }
    
    return res.status(200).json({ status: 'success', data: user });
  } catch (error) {
    next(error); // Delegate to centralized structured Error Handler
  }
});
```

---

## 🧪 Testing & Verification Protocol

How should an engineer or AI assistant test and prove that this standard has been satisfied?
* **Unit Testing Command / Approach**: Check that appropriate mocks or assertion boundaries are applied.
* **Lint / CI Verification**: Specify any ESLint, SonarQube, or security linter rules that govern this standard.
