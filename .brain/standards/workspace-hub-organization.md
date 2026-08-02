---
title: "Universal Workspace Hub Organization (.brain + projects)"
type: "workspace-architecture"
category: "standards"
version: "3.0.0"
---

# 🏛️ Universal Workspace Hub Organization (`.brain` + `projects/`)

> **The definitive structural architecture for organizing active project codebases, AI intelligence memories, and multi-stack engineering workflows cleanly at the repository root.**

---

## 🎯 Purpose: The Clean 2-Pillar Root Architecture

In v3.0, we eliminate fragmented subfolder sprawl and complex setup rituals. Your workspace root contains exactly two primary structural pillars:

```text
AI-Developer-Brain/                       <-- Your Master AI Engineering Workspace
│
├── 🧠 .brain\                            <-- Pillar 1: Universal AI Intelligence & Memory Hub
│   ├── memory\                           <-- Auto-updating context buffers (saves 70% tokens!)
│   ├── rules\                            <-- Token optimization, Q&A & zero-regression guardrails
│   ├── standards\                        <-- Any-stack engineering handbooks
│   ├── scratch\                          <-- Ephemeral AI debug scratchpad
│   └── AI_ROUTING_INDEX.md               <-- On-demand routing decision matrix
│
├── 🚀 projects\                          <-- Pillar 2: Ready-to-Use Application Workspaces
│   ├── backend\                          <-- Clone or build backend APIs / microservices here (Any Stack!)
│   ├── frontend\                         <-- Clone or build web frontends / SaaS portals here (Any Stack!)
│   ├── admin\                            <-- Clone or build internal admin dashboards here (Any Stack!)
│   └── mobile\                           <-- Clone or build iOS/Android/Cross-platform apps here (Any Stack!)
│
├── ⚙️ .cursorrules / .windsurfrules...   <-- Universal IDE root adaptors
├── 📜 AGENTS.md                          <-- Master AI Primary Directive (v3.0)
└── 📘 README.md / HOW_TO_WORK.md          <-- Human engineering playbooks
```

---

## ⚡ How Developers & AI Collaborate Across Stacks
1. **Any-Stack Flexibility**: Whether your team builds the backend in Python FastAPI or Node NestJS, the frontend in React or Svelte, and mobile in Flutter or Kotlin, simply clone or initialize your respective codebase inside the dedicated folder in **`projects/*`**.
2. **Automated AI Synchronization**: When an AI assistant (*Cursor, Windsurf, Claude, Gemini, Antigravity*) opens the workspace, it reads **`.brain/AI_ROUTING_INDEX.md`** and connects directly to the code in `projects/`, continuously auto-updating **`.brain/memory/`** as development advances!
