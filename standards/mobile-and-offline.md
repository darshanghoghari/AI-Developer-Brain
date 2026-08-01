---
title: "Mobile Architecture & Offline-First Engineering Standards"
type: "domain-standard"
category: "standards"
version: "2.0.0"
---

# 📱 Mobile Architecture & Offline-First Engineering Standards

> **Consolidated design patterns for high-performance cross-platform (Flutter, React Native) and native mobile apps featuring local SQLite sync engines and OS hardware keystores.**

---

## 1. Offline-First Local Data Persistence & Synchronization

Enterprise mobile applications MUST continue functioning across unstable cellular connections by implementing an **Offline-First Caching Architecture**:
* **Local Master Persistence**: Store critical daily user datasets locally inside embedded relational or object databases (*SQLite, WatermelonDB, Realm, Hive*). The UI rendering view reads EXCLUSIVELY from this local persistence store.
* **Asynchronous Background Synchronization**: When offline mutations occur (*e.g., drafting a customer order in a field app*), write the transaction to an internal local outbox queue. When cellular connectivity resumes, process the outbox against cloud API servers with timestamps to resolve optimistic update conflicts.

```typescript
// ✅ Good (Production Standard: Offline-first mutation queue in React Native / WatermelonDB)
async function submitOfflineOrder(orderPayload: OrderInput): Promise<void> {
  await database.write(async () => {
    // 1. Instantly save locally so UI displays success without network latency:
    const localOrder = await database.collections.get<Order>('orders').create((order) => {
      order.title = orderPayload.title;
      order.syncStatus = 'PENDING_SYNC';
    });
    // 2. Dispatch background connectivity sync job:
    await backgroundSyncQueue.enqueue('SYNC_ORDER', { orderId: localOrder.id });
  });
}
```

---

## 2. Zero-Cleartext Hardware Keystore Security

* **Prohibited Storage**: Never store JWT access tokens, OAuth2 refresh tokens, user passwords, or biometric unlock keys inside cleartext storage engines (*AsyncStorage, SharedPreferences, LocalStorage, SQLite raw strings*).
* **Hardware Vault Enforceability**: Store sensitive credentials EXCLUSIVELY inside OS hardware encryption keystores (*Apple iOS Keychain, Android Keystore / EncryptedSharedPreferences via libraries like `react-native-keychain` or Flutter `flutter_secure_storage`*).

```typescript
// ❌ Bad (Anti-Pattern: Saving sensitive auth tokens in cleartext unencrypted storage)
await AsyncStorage.setItem('access_token', token);

// ✅ Good (Production Standard: Using hardware keychain encryption for credentials)
await Keychain.setGenericPassword('auth', token, { accessControl: Keychain.ACCESS_CONTROL.BIOMETRY_ANY });
```

---

## 3. Battery & Thread Optimization (60 / 120 FPS Guarantee)

* **UI Thread Isolation**: Never execute heavy synchronous image resizing, cryptographic hashing, or massive JSON payload parsing directly on the primary mobile UI rendering thread. 
* **Worker Offloading**: Spawn Web Workers, React Native background threads, or Flutter Isolate worker loops for computationally intensive processing to guarantee butter-smooth 60/120 FPS animations without interface jitter!

```dart
// ❌ Bad (Anti-Pattern: Blocking primary UI rendering thread with heavy JSON parsing)
final result = jsonDecode(massiveJsonPayload);

// ✅ Good (Production Standard: Offloading computation to Flutter background Isolate worker)
final result = await Isolate.run(() => jsonDecode(massiveJsonPayload));
```
