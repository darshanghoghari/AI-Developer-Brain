# 🔒 Cyber Security & Vulnerability Prevention (`/docs/security/`)

> **Engineering Standards for OWASP Top 10 Mitigation, Authentication/Authorization, Data Encryption, and Threat Defense.**

---

## 🎯 Core Objectives & Scope

Security is an immutable principle across every engineering stack. This directory provides hard architectural constraints designed to prevent vulnerabilities, protect consumer privacy, and ensure regulatory resilience (GDPR, HIPAA, SOC 2).

---

## 🏛️ Key Security Architectural Pillars

1. **OWASP Top 10 Active Prevention**:
   - **SQL Injection**: Exclusively utilize parameterized query builders or modern ORMs. Never concatenate untrusted strings directly into database statements.
   - **Cross-Site Scripting (XSS)**: Automatically encode all variables rendered in HTML markup. Implement rigorous Content Security Policy (CSP) HTTP response headers.
   - **Insecure Direct Object References (IDOR)**: When fetching resource IDs via APIs (e.g., `/orders/1042`), explicitly verify that the requesting user's JWT credentials hold legitimate ownership or administrative rights over object ID 1042 before returning details.
2. **Cryptographic Standard Discipline**:
   - Never roll proprietary encryption or hashing algorithms.
   - Use **Argon2id** or **Bcrypt (cost factor >= 12)** for user password hashing.
   - Employ **AES-256-GCM** for symmetric encryption of sensitive data at rest with authenticated checksum verification.
3. **Transport Layer Security & Rate Limiting**: Ensure 100% of external network communication is wrapped in TLS 1.3 / HTTPS. Protect public-facing API gateways using sliding window rate limiters (Redis or Cloudflare WAF) to defend against credential brute-forcing and denial of service (DDoS) attempts.

---

## 📂 Contributing Guidelines for this Folder
When adding specifications to this folder, utilize `../../templates/doc-template.md` with category set to `security`.
