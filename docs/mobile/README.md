# 📱 Cross-Platform & Native Mobile Architecture (`/docs/mobile/`)

> **Engineering Standards for Flutter, React Native, .NET MAUI, and Native (iOS/Android) Applications.**

---

## 🎯 Core Objectives & Scope

Mobile application engineering operates within constrained environments characterized by **unpredictable network latency, finite battery life, device storage limits, strict OS UI threading rules, and rigorous app store deployment policies**.

---

## 🏛️ Key Mobile Architectural Pillars

### 1. Offline-First Synchronization & Local Persistence
* **Local Single Source of Truth**: Mobile apps must maintain high responsiveness even without active connectivity. Use high-performance local engines (SQLite, Realm, Hive, WatermelonDB) as the primary data read model.
* **Asynchronous Sync Engine**: Implement queue-backed sync workers that detect network reconnection and replicate local mutations back to backend REST/GraphQL servers using idempotency tokens and timestamped vector clocks.

### 2. Zero-Text Token Security & Hardware Vaults
* **Secure Keystore Integration**: NEVER store authentication JWTs, OAuth tokens, personal health data, or financial details in cleartext shared storage (`UserDefaults` on iOS, plain `SharedPreferences` on Android, or AsyncStorage).
* **Hardware Vault Enforcement**: Always wrap credentials using OS-level encrypted vaults:
  * **React Native**: `react-native-keychain` / `react-native-encrypted-storage`
  * **Flutter**: `flutter_secure_storage`
  * **.NET MAUI / Android / iOS**: Android Keystore / Apple Keychain API

### 3. UI Frame Reliability & Background Compute (60/120 FPS)
* **Offloading Main Thread Work**: The main rendering thread must NEVER be blocked by CPU-heavy cryptographic operations, image transcoding, or synchronous JSON serialization of multi-megabyte payloads.
* **Threading Solutions**: Use Dart Isolates in Flutter, Web Workers / JSI bindings in React Native, or asynchronous background tasks in .NET MAUI / Kotlin / Swift.
* **Memory & Image Management**: Always utilize caching image loaders with downsampling (e.g., FastImage, CachedNetworkImage) to prevent Out of Memory (OOM) app crashes when rendering endless scrolling feeds.

### 4. App Store & Play Store Production Checklist
* Ensure strict compliance with App Store review guidelines regarding permissions explanations (e.g., specific rationale for Camera, GPS, Microphone requests).
* Ensure crash reporting and observability (Firebase Crashlytics, Sentry Mobile) are hooked directly into global uncaught error boundaries.

---

## 📂 Contributing Guidelines for this Folder
When adding specifications to this folder, utilize `../../templates/doc-template.md` with category set to `mobile`.
