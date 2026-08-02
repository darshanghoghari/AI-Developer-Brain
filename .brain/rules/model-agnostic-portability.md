---
title: "Zero-Model Vendor Lock-In & Model-Agnostic Portability Rules"
type: "strategic-governance"
version: "3.0.0"
---

# 🔓 Zero-Model Vendor Lock-In & Model-Agnostic Portability Rules

> **The strategic directives ensuring our engineering repository remains completely immune to AI tool vendor lock-in, commercial licensing alterations, or model obsolescence.**  
> **🚨 PRIMARY DIRECTIVE**: Over a 5-10 year corporate software lifecycle, specific IDEs (*Cursor, Windsurf*) and cloud models (*GPT, Claude, Gemini*) will evolve, merge, or become replaced by localized Open-Source offline models (*Llama, DeepSeek, Mistral*). All workspace intelligence MUST be designed for instant, universal portability across ALL models and execution engines.

---

## 1. The Open Standard Data Exaltation Law
To guarantee that organizational knowledge is never trapped inside a proprietary vector database or closed IDE config file:
1. **UTF-8 Markdown & JSON Sanctum**: All architectural rules, routing indexes, project state buffers (`.brain/memory/`), and code handbooks MUST remain stored as open, readable UTF-8 text files inside **`.brain/`**.
2. **Prohibition of Proprietary Cache Dependency**: AI assistants are strictly forbidden from recording vital business domain logic exclusively in local IDE chat histories, private cloud user accounts, or undocumented IDE metadata folders. If it is not written in **`.brain/memory/`**, the knowledge does not exist!

---

## 2. Universal Model & Hardware Execution Matrix
Our AI Developer Brain is engineered to execute flawlessly across three distinct hardware and software execution paradigms without altering a single line of project code in `projects/*`:

| Execution Tier | Example Models & Tools | Connectivity & Token Profile | Adaptor Integration |
| :--- | :--- | :--- | :--- |
| **Tier 1: Cloud Flagship IDEs** | Cursor Composer, Windsurf Flow, Gemini IDE, GitHub Copilot | High reasoning, cloud API connected, tokens optimized via router. | Via symlinked `.cursorrules`, `.windsurfrules`, `.clinerules`, Copilot docs. |
| **Tier 2: Autonomous CLI Swarms**| Cline, Roo Code, Aider Terminal, Devin, Sweep CI | Autonomous multi-file terminal orchestration with TDD self-healing. | Via symlinked `.clinerules`, `.roorules`, `.aider.conf.yml`. |
| **Tier 3: Local Offline Open-Source** | Ollama, Llama 3/4, DeepSeek-Coder, Mistral on local Apple Silicon / NVIDIA GPU | 100% Offline, Zero API billing, maximum data confidentiality & IP privacy. | Reads `.brain/AGENTS.md` and domain micro-handbooks directly via CLI flags. |

---

## 3. Designing Prompts for Model Diversity
Because different LLMs exhibit varying context processing capabilities:
1. **Clear Explicit Constraints**: Never use subtle sarcasm or complex idiomatic phrasing in project instructions. Enforce numbered bullet points with explicit positive (*"ALWAYS do X"*) and negative (*"NEVER do Y"*) guardrails.
2. **Deterministic Examples**: When documenting complex requirements in `projects/*`, provide concise input/output JSON schemas or concrete code snippets rather than abstract prose, allowing smaller localized 7B/8B parameter models to succeed with 100% accuracy.
3. **Graceful Degradation**: If an offline local model struggles to execute multi-step tool orchestration, the human engineer relies on our modular micro-handbooks in `.brain/standards/` as standard peer-to-peer engineering reference guides!
