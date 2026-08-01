---
title: "Frontend Engineering & Enterprise Admin Dashboard Standards"
type: "domain-standard"
category: "standards"
version: "2.0.0"
---

# 🛡️ Frontend Engineering & Enterprise Admin Dashboard Standards

> **Consolidated architectural standards for scalable web UI component hierarchies, modern design systems, dual-layer RBAC administrative portals, and paginated data grids.**

---

## 1. Web Architecture & State Hierarchy (React / Next.js)

* **Atomic UI Composition**: Structure React, Next.js (App Router), or Vue codebases into composable component trees (Page -> Domain Section -> Feature Widget -> UI Atom).
* **State Scope Discipline**: Store ephemeral form inputs inside local component state. Elevate shared async network cache data exclusively to standardized engines (*TanStack Query, SWR*) and global UI themes/auth tokens to lightweight stores (*Zustand*). Never introduce Redux boilerplate without explicit team consensus.
* **Design Systems (Tailwind CSS)**: Exclusively reference structured design token variables (*e.g., `bg-slate-900`, `text-primary-400`*); reject ad-hoc inline CSS hacks or hardcoded hex strings.

---

## 2. Admin Dashboards: Dual-Layer RBAC Authorization

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

* **Server-Side Pagination Mandate**: Never execute un-paginated database list lookups (`findMany()`, `SELECT * FROM users`) for admin UI tables. Always enforce **cursor-based or offset limit pagination** combined with debounced backend column searching.
* **Immutable Audit Trails**: Every mutating administrative operation (*account deletion, permission escalation, status override, balance modification*) MUST asynchronously insert an immutable log record capturing:
  * `timestamp`: ISO-8601 UTC timestamp.
  * `operatorId`: UUID of the acting administrator.
  * `actionType`: Enumerated action constant (*e.g., `PERMISSION_OVERRIDE`*).
  * `targetEntityId`: UUID of affected customer/resource.
  * `diffSummary`: JSON serialization of previous vs. new field states.
