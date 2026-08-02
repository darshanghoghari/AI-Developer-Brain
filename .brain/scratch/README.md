# 🛠️ AI Temporary Execution Scratchpad (`.brain/scratch/`)

> **This directory is reserved as an ephemeral execution scratchpad for autonomous AI coding assistants (Cursor, Windsurf, Claude, Gemini, Cline, Antigravity).**

---

## 🎯 Purpose & Usage Protocol

When complex software tasks require deep compiler error diagnosis, AST symbol dumping, API response payload testing, or interim architectural sketches, the AI assistant may write short-lived debug or test scripts into this folder:

```text
.brain/scratch/
├── build_error_trace.log      <-- Temporary compiler stack dumps
├── api_response_test.json     <-- Sample payload test dump
└── schema_migration_test.sql  <-- Draft test query
```

---

## 🧹 Context Hygiene & Auto-Pruning Rule (Zero Token Waste)
To prevent temporary log debris and outdated debug output from inflating project context windows and wasting tokens:
1. **Never commit permanent application source code into this folder!** All application code belongs in `projects/*`.
2. **Auto-Flush Mandate**: Once the task or feature is verified and verified green, autonomous agents MUST summarize key structural takeaways into permanent memory (`.brain/memory/*`) and automatically delete temporary debug logs from this folder!
