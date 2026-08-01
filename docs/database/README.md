# 🗄️ Database Design, Modeling & Optimization (`/docs/database/`)

> **Engineering Standards for Relational (PostgreSQL, MySQL), NoSQL (MongoDB, DocumentDB), and Caching Systems (Redis).**

---

## 🎯 Core Objectives & Scope

Database performance and data integrity determine the scalability limit of enterprise applications. This folder establishes standards for schema modeling, index maintenance, transactional guarantees, and query speed optimization.

---

## 🏛️ Key Database Architectural Pillars

1. **Schema Normalization & Pragmatic Denormalization**: Model transactional relational tables to 3rd Normal Form (3NF) by default to prevent data anomalies. Apply intentional denormalization (such as pre-calculating aggregate totals or caching user avatar URLs on posts) ONLY when read volume demands require bypassing heavy multi-table joins.
2. **Indexing Discipline (B-Tree, GIN, Composite)**:
   - Always index foreign key relationships, search target columns, and sorting criteria.
   - Utilize compound indexes matching the exact field order of common `.where().orderBy()` queries.
   - Avoid over-indexing high-write frequency tables (e.g., audit or logging sinks) to prevent write latency degradation.
3. **Safe Migration Management**: NEVER execute manual DDL statements directly against production environments. Enforce version-controlled migrations (using Prisma, TypeORM, Alembic, Knex) with verified backward compatibility and zero-downtime rollback capabilities.
4. **Caching Strategies with Redis**: Layer Redis caching over slow database reads using TTLs (Time-To-Live) and robust cache invalidation strategies (Cache-Aside, Write-Through). Never use an in-memory cache without defining an explicit expiration policy to prevent OOM memory consumption.

---

## 📂 Contributing Guidelines for this Folder
When adding specifications to this folder, utilize `../../templates/doc-template.md` with category set to `database`.
