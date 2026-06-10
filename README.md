# AKS & GitOps Platform Engineering Portfolio

This repository contains a progressive series of production-grade Kubernetes deployments and Infrastructure-as-Code setups on Azure Kubernetes Service (AKS), built to showcase platform engineering capabilities.

## 🗺️ Project Catalog & Status

| Project | Focus | Status | Tech Stack | Key Deliverables |
|---|---|---|---|---|
| **[P1 — Voting App](./projects/p1-voting-app)** | Multi-tier K8s wiring & storage | ✅ Complete | K8s, Redis, PostgreSQL | Multi-tier routing, PersistentVolumes, Pod affinity, Readiness/Liveness probes |
| **[P2 — IaC Rebuild](./terraform)** | Terraform AKS infrastructure provisioning | ✅ Complete | Terraform, Azure AKS, ACR | Modular infrastructure, Azure VNet, remote state, workspace environment separation (Dev/Prod) |
| **[P3 — Observability](./projects/p3-observability)** | Prometheus, Grafana & traffic shaping | ✅ Complete | Prometheus, Grafana, K6 | ServiceMonitor CRDs, custom latency/RPS dashboard, K6 load testing, Alertmanager alerting |
| **[P4 — Autoscaling](./projects/p3-observability)** | Cost-optimization & scale-out resilience | ✅ Complete | HPA, Spot Nodes, PDB | Horizontal Pod Autoscalers, Azure Spot VM node pools, Pod Disruption Budgets, Spot tolerations |
| **[P5 — Helm & GitOps](./charts/podinfo)** | Packaging, OIDC pipelines & ArgoCD | ✅ Complete | Helm, ArgoCD, GitHub Actions | Modular Helm charts, GitHub Actions CI/CD with Azure Federated Credentials (OIDC), Dev/Prod ArgoCD sync gates |
| **[P6 — Zero Trust Security](./projects/p6-security)** | Network policies, RBAC & secure secrets | ✅ Complete | Calico NetPol, Azure Key Vault | Namespace default-deny policies, microservice ingress/egress whitelisting, Key Vault CSI Driver |
| **[P7 — Stateful & DR](./projects/p7-stateful)** | Redis StatefulSet & Velero backup/restore | ✅ Complete | K8s StatefulSet, Velero, Azure Blob | 3-node Redis cluster with dedicated disks, Velero File System Backup (FSB), complete restore verification |
| **[P8 — Canary Rollouts](./projects/p8-canary)** | Canary deployment & traffic shaping | 🔄 In progress | Nginx Ingress, Locust, cert-manager | 10% traffic split, cert-manager self-signed certificates, Locust load testing, Grafana metrics decision |
---
