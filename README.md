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


---

## 🛠️ Repository Structure

```directory
k8s-terraform-miniprojects/
├── .github/
│   └── workflows/
│       ├── ci.yml               # PR validation (Helm linting)
│       └── cd.yml               # CD build, ACR push (OIDC), values tag update & Git push
├── charts/
│   └── podinfo/                 # Configurable Helm chart for Podinfo
│       ├── templates/           # Deployment, Service, HPA, PDB, ServiceMonitor templates
│       ├── values.yaml          # Base default values
│       ├── values-dev.yaml      # Cost-optimized Dev values (Spot nodes)
│       └── values-prod.yaml     # HA-optimized Prod values (Stable nodes, 4 replicas)
├── projects/
│   ├── p1-voting-app/           # Raw manifests for the multi-tier voting app
│   └── p3-observability/        # Custom Prometheus alerts and load testing configs
├── terraform/
│   ├── modules/                 # Modularized AKS, ACR, and Network resources
│   ├── main.tf                  # Infrastructure wiring, OIDC Federated Credentials & Role Assignments
│   ├── variables.tf             # Node VM sizes and scaling parameters
│   └── aks_kubeconfig           # (Locally generated & ignored by Git)
├── argocd-app.yml               # ArgoCD Dev Application manifest (Auto-sync)
└── argocd-app-prod.yml          # ArgoCD Prod Application manifest (Manual sync gate)
```

---

## 🚀 Key Achievements in Project 05

1. **Self-Authored Helm Chart:** Converted raw Kubernetes manifests into a modular Helm chart with parameterization for CPU, Memory, ReplicaCount, Autoscaling, PDB, and Monitoring.
2. **True GitOps Flow (ArgoCD):** Implemented automated synchronization using ArgoCD with namespace auto-creation.
3. **Azure Federated Credentials (OIDC):** Configured GitHub Actions to authenticate securely to Azure using short-lived tokens, eliminating the need to store static client secrets in GitHub.
4. **CI/CD Automation:** Set up automated PR validation (Helm linting) and merge-to-main automation (Docker build -> ACR push -> `values.yaml` image tag rewrite -> Git commit).
5. **Dev/Prod Isolation & Gates:** 
   * **Dev:** Auto-syncs changes immediately, optimized for cost on Azure Spot instances.
   * **Prod:** Manual sync gate requiring human approval via the ArgoCD dashboard, optimized for high availability (4 replicas on stable nodes, PDB active).
