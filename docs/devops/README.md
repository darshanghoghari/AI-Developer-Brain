# ☁️ DevOps, Cloud & CI/CD Pipelines (`/docs/devops/`)

> **Engineering Standards for Docker Containerization, Kubernetes, AWS Cloud Infrastructure, Nginx, and GitHub Actions.**

---

## 🎯 Core Objectives & Scope

DevOps engineering automates the pathway from code git commits to production availability. Standards in this directory enforce reproducible environments, zero-downtime rolling deployments, robust secrets management, and proactive system observability.

---

## 🏛️ Key DevOps Architectural Pillars

1. **Multi-Stage Containerization (Docker)**: Build lean production Docker images by compiling binaries/bundles in ephemeral builder stages and copying strictly required production artifacts into slim OS runtime bases (Alpine, Distroless). Avoid shipping dev-dependencies or secrets inside image layers.
2. **Infrastructure as Code & Immutable Deployments**: Avoid manual server configurations via SSH. Treat server configurations, networking routes, and orchestration configurations (Kubernetes Helm, AWS CloudFormation, Terraform) as immutable versioned code.
3. **Automated CI/CD Verification Pipelines**: Every Pull Request must undergo mandatory GitHub Actions / GitLab CI execution workflows that spin up test databases, execute unit/integration test suites, and perform automated security dependency auditing (Snyk, Trivy) prior to merge approval.
4. **Observability & Health Checks**: Deploy standardized `/healthz` or `/status` probe endpoints on all services for liveness and readiness monitoring (Kubernetes probes, PM2 watchdogs, Uptime monitoring). Ensure real-time centralized log shipping (ELK, Datadog, CloudWatch).

---

## 📂 Contributing Guidelines for this Folder
When adding specifications to this folder, utilize `../../templates/doc-template.md` with category set to `devops`.
