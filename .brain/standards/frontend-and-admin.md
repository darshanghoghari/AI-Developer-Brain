---
title: "Frontend Engineering & Enterprise Admin Dashboard Standards"
type: "domain-standard"
category: "standards"
targetProject: "projects/frontend/ & projects/admin/"
version: "3.0.0"
---

# 🎨 Frontend Engineering & Enterprise Admin Dashboard Standards (Any-Stack Universal Engine)

> **Consolidated architectural standards for scalable web UI component hierarchies, modern design systems, dual-layer RBAC administrative portals, and paginated data grids inside `projects/frontend/` and `projects/admin/`.**  
> **🌐 Any-Stack Compatibility**: Validated for React, Next.js (App Router), Vue 3, Nuxt, SvelteKit, Angular, and Blazor web suites.

---

## 1. Web Architecture & State Hierarchy

* **Atomic UI Composition**: Structure client codebases into composable component trees (Page -> Domain Section -> Feature Widget -> UI Atom).
* **State Scope Discipline**: Store ephemeral form inputs inside local component state. Elevate shared async network cache data exclusively to standardized engines (*TanStack Query, SWR, Pinia, Apollo*) and global UI themes/auth tokens to lightweight stores (*Zustand / Jotai*). Never introduce redundant state boilerplate without explicit team consensus.
* **Design Systems (Vanilla CSS / Tailwind CSS v4)**: Exclusively reference structured design token variables (*e.g., `bg-slate-900`, `text-primary-400`, or CSS variables `--surface-card`*); reject ad-hoc inline CSS hacks or hardcoded hex strings.
* **World-Class Visual Excellence**: Create stunning first impressions utilizing modern Google fonts (Inter, Outfit), smooth HSL gradients, subtle micro-animations, and glassmorphism.

---

## 2. Admin Dashboards (`projects/admin/`): Dual-Layer RBAC Authorization

Never hide administrative menus in client UI without identically securing backend API endpoints:
* **Layer 1 (UI Routing Guard)**: Suppress unauthorized navigation links and button renders based on user JWT claims or role attribute payloads.
* **Layer 2 (API Controller Guard)**: Enforce strict cryptographic role verification inside API controller interceptors.

```typescript
// ✅ Good (Production Standard: Dual-layer backend RBAC interceptor protecting admin mutations)
@Post('/admin/users/:id/ban')
@UseGuards(JwtAuthGuard, RolesGuard)
@RequiredRoles(UserRole.SUPER_ADMIN, UserRole.COMPLIANCE_OFFICER)
async banUserAccount(@Param('id') userId: string, @Request() req: AuthenticatedRequest) {
  return this.adminService.executeAccountSuspension(userId, req.user.id);
}
```

---

## 3. Server-Side Paginated Data Grids & Immutable Audit Logging

* **Server-Side Pagination Mandate**: Never execute un-paginated database list lookups (`findMany()`, `SELECT * FROM users`) for admin UI tables. Always enforce **cursor-based or offset limit pagination** combined with debounced backend column searching (*TanStack Table v8, AG-Grid, MUI X DataGrid*).
* **Immutable Audit Trails**: Every mutating administrative operation (*account deletion, permission escalation, status override, balance modification*) MUST asynchronously insert an immutable log record capturing:
  * `timestamp`: ISO-8601 UTC timestamp.
  * `operatorId`: UUID of the acting administrator.
  * `actionType`: Enumerated action constant (*e.g., `PERMISSION_OVERRIDE`*).
  * `targetEntityId`: UUID of affected customer/resource.
  * `diffSummary`: JSON serialization of previous vs. new field states.

---

## 🔄 Memory Synchronization Mandate
When building UI layouts in `projects/frontend/` or RBAC controls in `projects/admin/`, update design tokens and role tables in **[frontend-memory.md](../memory/frontend-memory.md)** and **[admin-memory.md](../memory/admin-memory.md)**!
