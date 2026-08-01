# 🌐 Frontend Web & Styling Standards (`/docs/frontend/`)

> **Engineering Standards for React, Next.js, Vue, Angular, TypeScript, and Tailwind CSS.**

---

## 🎯 Core Objectives & Scope

Modern frontend engineering requires balancing **responsive component design, accessibility (a11y), server-side rendering performance (SSR/SSG), intuitive state management, and asset bundle optimization**.

---

## 🏛️ Key Frontend Architectural Pillars

1. **Component Modularity & Design Systems**: Build reusable, self-contained UI components adhering to clear Atomic Design or feature-folder structures. Avoid monolithic component files exceeding 300 lines of JSX/TSX.
2. **Predictable State Hierarchy**: Keep UI interactions local within components. Escalate server domain data to asynchronous cache managers (TanStack Query, SWR) and app-wide state to lightweight global stores (Zustand, Redux Toolkit). Avoid excessive re-render cascades.
3. **Accessibility (a11y) by Default**: Ensure semantic HTML5 tag hierarchy (`<main>`, `<nav>`, `<aside>`, `<button>` vs `<div>`), proper ARIA labels, and keyboard navigability across all modal dialogs and form elements.
4. **Performance & Core Web Vitals (LCP, FID/INP, CLS)**: Optimize JavaScript bundle slicing via code-splitting and dynamic lazy imports. Leverage next-gen optimized image delivery (WebP/AVIF) and explicit dimension placeholders to eliminate Layout Shifts.

---

## 📂 Contributing Guidelines for this Folder
When adding specifications to this folder, utilize `../../templates/doc-template.md` with category set to `frontend`.
