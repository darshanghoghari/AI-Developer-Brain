---
title: "Database Modeling & Active Security Shield"
type: "domain-standard"
category: "standards"
version: "2.0.0"
---

# 🔒 Database Modeling & Active Security Shield

> **Consolidated high-density engineering standards for relational database optimization, index design, OWASP Top 10 immunity, and cryptographic credential defenses.**

---

## 1. Database Modeling & Query Optimization (PostgreSQL / ORM)

* **Relational Normalization (3NF)**: Design database tables in Third Normal Form to eliminate duplicate data replication. Rely on foreign key integrity constraints for associative relations.
* **Strategic Indexing**: Identify high-frequency reading query pathways and apply indexes:
  * **B-Tree Indexes**: Apply to primary lookup identifiers, foreign keys, and sorting columns (`createdAt`).
  * **GIN Indexes**: Apply to JSONB unstructured metadata payloads and full-text search document columns.
  * **Caution**: Do not over-index high-frequency transaction write tables (like logging tables), as excessive index re-balancing slows down insert speeds.
* **Safe Migration Discipline**: NEVER execute manual DDL schema alterations directly on live staging or production clusters. Generate automated, reproducible, bidirectional migration scripts (*e.g., via Prisma or Drizzle migration engines*).

---

## 2. Active OWASP Top 10 Security Defenses

### SQL & NoSQL Injection Immunity
Never format or concatenate raw string variables directly into database execution expressions:
```typescript
// ❌ Bad (Anti-Pattern: Severe SQL Injection vulnerability via string literal concatenation)
const results = await db.query(`SELECT * FROM accounts WHERE username = '${req.query.username}'`);

// ✅ Good (Production Standard: Type-safe ORM parameterized builder preventing code execution)
const results = await prisma.account.findUnique({
  where: { username: String(req.query.username) }
});
```

### Zero Hardcoded Secrets
* Never commit API keys, AWS IAM secrets, database connection strings, or cryptographic salts directly inside git-tracked code files. Reference runtime environment variables (`process.env.DATABASE_URL`) validated during system startup via schemas (*Zod*).

### Password & Credential Hashing
* Never store plain text passwords or use fast cryptographic digests like MD5 or SHA-256 for password storage. Exclusively employ compute-intensive, salt-injected memory-hard algorithms: **Argon2id** (Recommended) or **Bcrypt** (Cost factor `>= 12`).

```typescript
// ❌ Bad (Anti-Pattern: Using outdated fast SHA-256 digest or plain text for password storage)
const hash = crypto.createHash('sha256').update(req.body.password).digest('hex');

// ✅ Good (Production Standard: Memory-hard Argon2id with random salt for credential persistence)
const hash = await argon2.hash(req.body.password, { type: argon2.argon2id });
```

### Denial of Service (DDoS) & Brute-Force Rate Limiting
* Wrap public API authentication endpoints in token-bucket rate limiter middleware (*Redis-based limiter, AWS WAF, Cloudflare Turnstile*) to neutralize automated brute-force attacks!

```typescript
// ✅ Good (Production Standard: Redis-backed rate limiter on API authentication routes)
@UseGuards(ThrottlerGuard)
@Throttle({ default: { limit: 5, ttl: 60000 } }) // Max 5 login attempts per 60 seconds
@Post('/auth/login')
async login(@Body() credentials: LoginDto) { /* ... */ }
```
