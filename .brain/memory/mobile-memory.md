---
title: "Mobile Native & Offline-First Intelligence Memory Buffer"
type: "domain-memory-buffer"
targetProject: "projects/mobile/"
version: "3.0.0"
---

# 📱 Mobile Native & Offline-First Intelligence Memory Buffer

> **Token-Minimal Context Hub for `projects/mobile/`.**  
> *Autonomous AI assistants MUST consult this buffer before editing mobile application code and MUST autonomously update offline synchronization models, native device capabilities, and navigation stacks.*

---

## 🚀 Active Mobile Stack & Native Targets (Any-Stack Ready)
* **Framework / Language**: `[e.g., Flutter (Dart 3) / React Native (TypeScript + Expo) / Kotlin (Android Jetpack Compose) / Swift (iOS SwiftUI) / Capacitor / Kotlin Multiplatform (KMP)]`
* **Local Offline Database Engine**: `[e.g., SQLite / Drift / WatermelonDB / Realm / Hive / CoreData / Room]`
* **State Management**: `[e.g., Riverpod / Bloc / Zustand + AsyncStorage / MobX / Redux Toolkit]`
* **Native Bridges & Permissions**: `[e.g., Camera, Biometric Authentication (FaceID/TouchID), Push Notifications, Bluetooth LE]`

---

## 🔄 Offline-First Synchronization & Conflict Resolution Engine
Mobile apps built by our world-class AI brain must operate flawlessly offline without screen freezes or data corruption when network connectivity drops:

| Local Table / Collection | Server Sync Endpoint | Synchronization Strategy | Conflict Resolution Mechanism |
| :--- | :--- | :--- | :--- |
| `local_tasks` | `POST /api/sync/tasks` | Background batch upsert on network reconnection | Server timestamp wins (Last-Write-Wins with soft delete flag `is_deleted: true`) |
| `offline_analytics_queue` | `POST /api/telemetry` | Write-ahead WAL log, flush sequentially on Wi-Fi/4G | Discard log on successful HTTP 200 acknowledgment |
| `[Add Table]` | `[...]` | `[...]` | `[...]` |

---

## ⚡ 120 FPS UI Performance & Security Guardrails
1. **Worker Threads / Isolates**: Never parse > 1MB JSON payloads or execute heavy image compression directly on the main UI rendering thread. Dispatch heavy CPU tasks to secondary Web Workers / Dart Isolates / Kotlin Coroutines.
2. **Zero-Cleartext Storage Shield**: **NEVER store authentication JWTs, OAuth refresh tokens, or user encryption keys in standard plain AsyncStorage or SharedPreferences!** You MUST utilize platform-backed secure hardware storage (*Apple Keychain / Android Keystore* via `react-native-keychain` / `flutter_secure_storage`).

---

## 🔄 Self-Updating Memory Rules
1. Whenever a new native hardware capability, background sync worker, or secure screen router is integrated, append its specification in this document!
