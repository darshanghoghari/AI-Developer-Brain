---
title: "Backend Engineering & Cloud Infrastructure Standards"
type: "domain-standard"
category: "standards"
version: "2.0.0"
---

# ⚙️ Backend Engineering & Cloud Infrastructure Standards

> **Consolidated architectural principles for high-performance API microservices, serverless compute, asynchronous event queue processing, and containerized deployment pipelines.**

---

## 1. Strict Layered Architectural Decoupling

Backend applications in Node.js (NestJS, Express), Python (FastAPI, Django), or Go MUST rigidly enforce separation of concerns across three boundaries:
1. **Controllers / API Routing**: Restructure external HTTP/GraphQL requests, execute authentication guards, and return standard JSON HTTP codes. Never execute database calls directly inside controllers.
2. **Service Layer**: Contains pure domain calculations and transactional business orchestration. Completely ignorant of transport protocols (HTTP vs WebSocket vs CLI).
3. **Repository / Data Layer**: Encapsulate ORM execution (*Prisma, TypeORM, Drizzle*) and raw database transaction sessions.

```typescript
// ❌ Bad (Anti-Pattern: Fat Controller mixing routing, raw SQL database queries, and business math)
app.post('/api/invoices', async (req, res) => {
  const user = await db.query('SELECT * FROM users WHERE id = ' + req.body.userId);
  if (user && user.balance >= req.body.amount) {
    await db.query(`INSERT INTO invoices (total) VALUES (${req.body.amount * 1.18})`);
    res.status(200).send("Created");
  }
});

// ✅ Good (Production Standard: Controller delegating to validated domain services and type-safe ORM repos)
@Post('/invoices')
async createInvoice(@Body(new ZodValidationPipe(InvoiceSchema)) payload: CreateInvoiceDto): Promise<InvoiceResponse> {
  const invoice = await this.invoiceService.createValidatedInvoice(payload.userId, payload.amount);
  return { status: 201, data: invoice };
}
```

---

## 2. Asynchronous Task Queue Offloading (Redis / BullMQ)

Never perform blocking synchronous input/output or computationally intensive workloads inside user-facing API request threads:
* **Offloaded Workloads**: Batch email notification dispatching, invoice PDF document rendering, video/media transcoding, and webhooks MUST be pushed to asynchronous queues (*BullMQ, RabbitMQ, AWS SQS*).

```typescript
// ✅ Good (Production Standard: Pushing heavy report rendering to Redis job queues)
async generateFinancialReport(tenantId: string): Promise<{ jobId: string }> {
  const job = await this.reportQueue.add('render-yearly-report', { tenantId, timestamp: Date.now() });
  return { jobId: job.id };
}
```

---

## 3. Cloud Containerization & DevOps Best Practices

* **Multi-Stage Docker builds**: Always employ multi-stage compilation in Dockerfiles to isolate source build toolchains from final minimal production runtimes (*e.g., node:20-alpine or distroless images*), keeping container footprints under 150MB.
* **Health Check Probing**: Provide explicit `/healthz` and `/readyz` endpoints for Kubernetes readiness and liveness probe monitors to verify active database pool connectivity.
