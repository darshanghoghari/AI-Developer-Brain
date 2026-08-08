# 🤖 Autonomous AI TDD Guardrails

These rules strictly govern the behavior of the headless background AI loop (e.g., Aider, Roo Code) when executing automatically.

## 1. Zero Broken Builds Rule
- Before terminating a session, YOU MUST run `npm test` or the appropriate test script for the project.
- If the test fails, YOU MUST read the error output and iteratively fix the code until the test passes.
- YOU MAY NOT leave the workspace with a failing test or broken syntax.

## 2. Test-Driven Development (TDD) Enforcement
- For every new function or route you detect in the diff, you MUST write an accompanying Unit Test.
- Place tests in the standard testing directory for the framework (e.g., `__tests__/`, `test/`, or adjacent `.spec.ts` files).

## 3. Documentation Auto-Sync
- If you modify an API route or a data schema, YOU MUST automatically update the corresponding documentation files (e.g., `.brain/standards/API_DOCS.md` or Swagger docs).
- Do not add conversational fluff to documentation.

## 4. No Git Push Allowed!
- You may run `git add` and `git commit` to checkpoint your fixes.
- YOU ARE STRICTLY FORBIDDEN from running `git push`. The human developer will review and manually push the code.

## 5. Token Optimization
- Try to fix bugs in as few iterations as possible. Avoid rewriting entire files if a 2-line change suffices.
