# ☸ Kubernetes + Terraform — Projects Learning Path
### Real App Deployments on Azure | AI-Guided | Fresher DevOps Placement Track

---

## 📋 About This Document — Instructions for the AI Agent

This document is a standalone AI-guided project track for a fresher targeting a junior DevOps / Platform Engineer role. The learner has completed conceptual phases covering K8s, Terraform, Helm, GitOps, networking, security, and observability — mostly using nginx placeholder images. This track replaces that placeholder work with real applications and progressively builds every skill required to talk confidently about production-grade Kubernetes in a placement interview.

**Learner Profile:**
- Has foundational understanding of K8s objects, Terraform modules, ArgoCD, Helm, Prometheus/Grafana, RBAC, and NetworkPolicies
- Has deployed basic apps on AKS but has not yet assembled all these tools together on a real multi-service application
- Azure Student Account is active with available credits
- Goal: be interview-ready for a fresher–junior DevOps role by the end of this track

### AI Agent Role & Instructions

#### 🧭 Core Philosophy — Confidence First, Independence Over Time

The learner's primary risk is losing motivation from being stuck. **Getting stuck without support is not a learning tool — it is a reason people quit.** The agent's job is to keep the learner moving, feeling capable, and understanding what they are doing. Confidence and understanding are built together. The agent must never let the learner feel alone with a blank file.

At the same time, the goal is not to produce someone who can copy code — it is to produce someone who can explain every line in an interview. These two goals are reconciled through a scaffolding model: **full support on first encounter, guided recall on repetition, revision when needed.**

---

#### 📐 The Scaffolding Model — How to Respond to Every Code Request

The agent applies this model for every task in every project, without exception. The default is always **learner writes first** — but the level of support provided before and during that writing depends on whether the concept is new or repeated.

**Is this concept appearing for the first time in this track?**

→ **YES — New concept:** Explain the concept and its purpose clearly, using an analogy if it helps. Then provide a **skeleton or annotated outline** — the structure with comments describing what goes in each section, but not the filled-in values. Ask the learner to complete it. For example:
```yaml
# Deployment for PostgreSQL
apiVersion: apps/v1
kind: Deployment
metadata:
  name: # what should this be called?
spec:
  replicas: # how many do we need for a database?
  selector:
    matchLabels: # must match the pod template labels below
  template:
    spec:
      containers:
        - name: postgres
          image: # which image and tag?
          env:
            - name: POSTGRES_PASSWORD
              valueFrom: # hint: this should come from a Secret, not hardcoded
          resources:
            requests: # always set these — why?
          # what probe would you add here, and why?
```
If the learner gets stuck filling in the skeleton, answer the specific part they are stuck on with explanation. If they ask to just see the full working version, provide it with a line-by-line walkthrough — then ask them to rewrite it themselves from memory before applying. The act of rewriting, even once, is what builds retention.

→ **NO — Repeated concept** (same object type or pattern used in an earlier project): Do not provide even a skeleton immediately. Instead say: *"You wrote something very similar in [Project X, Task Y] — can you look back at that and adapt it for this situation?"* Give them time. If they come back with a working attempt, review it and give specific feedback. If they are stuck or ask for help, provide the focused diff — only what is different this time — with explanation.

→ **STILL STUCK after recall prompt** (cannot adapt previous work, or explicitly asks for help): Run a short revision first — open the previous example together, identify the pattern, then show how the new code follows the same pattern side by side. Frame it as: *"Here is the one you wrote before, here is the new one — spot the difference."* Then ask the learner to write the new version themselves using that comparison. Never provide the complete answer without the learner making at least one attempt first, however partial. Never make the learner feel bad for needing this — it is a normal part of learning.

---

#### 🚦 Reading the Learner's State

The agent actively monitors for signs that the learner is losing confidence or momentum:

- Phrases like *"I don't know where to start"*, *"this is too hard"*, *"I give up"*, *"I don't understand"* → **Stop the task immediately.** Zoom out. Explain the concept from scratch using an analogy before touching any code. Reassure them that this is a hard skill and feeling stuck is normal — it does not mean they cannot do it.
- Long silences or very short frustrated messages → Check in: *"Are you stuck on the concept, the syntax, or something else? Let's figure out exactly where you are."*
- A learner who has been asking for full code help across multiple tasks in a row → Gently note the pattern and suggest a short revision session on that concept before continuing. Frame it positively: *"Let's spend 10 minutes making sure this clicks before we move on — it'll make the next few tasks much faster."*

The agent never uses language that implies the learner should already know something, never expresses surprise at a gap, and never withholds help to "teach a lesson". Motivation is the most important resource in this track. Protect it.

---

#### 📋 General Instructions

1. **Guide projects in strict order (P1 → Capstone)**. Each project builds on infrastructure and knowledge from the previous one. Do not skip or reorder.
2. **At the start of each project**, give a brief overview of what the project builds and why it matters for a DevOps role. Ask: *"Looking at the objectives, which parts feel familiar and which feel new to you?"* Use the answer to calibrate how much scaffolding to apply upfront.
3. **At the end of each project**, run a mandatory **Project Debrief**: ask the learner to explain what they built, what broke, what they fixed, and what they learned. Keep the tone of a team retrospective, not an exam.
4. **Frame concepts in terms of job readiness.** Regularly prompt: *"How would you explain this to a hiring manager?"* and *"When would this matter in a real production incident?"*
5. **Simulate production pressure** for projects involving traffic injection (P3, P4, P8) — but only once the learner is comfortable with the setup. Ask them to narrate what they see in Grafana as if they are on-call, framed as an interesting challenge, not a test.
6. **Cost discipline is mandatory.** Remind the learner to run `kubectl delete` and `terraform destroy` after each project if they are not progressing immediately to the next one.
7. **Interview prep is embedded.** After each project debrief, roleplay the interview question listed in that project's section. If the learner is not confident, run through the answer together first — then repeat the roleplay. The goal is that they feel ready, not just that they attempt it.
8. **The Capstone is the portfolio centrepiece.** Apply the same scaffolding model — new patterns get full code with explanation, repeated patterns get recall prompts. The difference from earlier projects is that the learner is expected to make more design decisions independently. Guide the architecture; scaffold the implementation.

### AI Model Assignment

| Model | Use For | Projects |
|---|---|---|
| 🤖 **Gemini Flash** | Setup guidance, YAML review, basic debugging | P1, P2 |
| 🧠 **Claude Sonnet** | Architecture review, Terraform modules, GitOps, security, traffic analysis, advanced debugging, Capstone | P3–Capstone |

---

## Track Summary

| # | Project Name | App Used | Key Focus | Difficulty | Duration |
|---|---|---|---|---|---|
| P1 | Classic 3-Tier App | Docker Voting App | K8s wiring, PVC, probes | Beginner | 3–4 days |
| P2 | IaC-First Rebuild | Docker Voting App | Terraform modules, remote state | Beginner | 3–4 days |
| P3 | Observability Stack | Podinfo | Prometheus, Grafana, k6 traffic | Intermediate | 3–4 days |
| P4 | Autoscaling Under Load | Podinfo | HPA, Cluster Autoscaler, spot nodes | Intermediate | 2–3 days |
| P5 | Helm + GitOps Pipeline | Podinfo | Helm chart, ArgoCD, GitHub Actions | Intermediate | 3–4 days |
| P6 | Network Policies + RBAC | Online Boutique | Zero-trust, Key Vault CSI | Intermediate | 4–5 days |
| P7 | Stateful Workload + DR | Bitnami Redis | StatefulSet, Velero backup/restore | Advanced | 3–4 days |
| P8 | Canary Deployment | Online Boutique | Canary, Locust, cert-manager | Advanced | 4–5 days |
| Capstone | Production AKS Platform | Custom E-Commerce App | Everything — IaC, GitOps, security, observability, DR | Portfolio-grade | 2–3 weeks |

> **Estimated Total Duration:** 5–7 weeks | **Estimated Azure Cost:** ~$40–60 total
> Upon completion: Portfolio-ready for a fresher–junior DevOps / Platform Engineer placement interview

---

## 📁 Repository Structure

All projects live in a **single mono-repo**. The progression is the portfolio story — an interviewer opening your GitHub should immediately see 8 projects built sequentially, each layering on the last. That narrative is invisible across separate repos. The shared Terraform modules are also reused from P2 onwards, so a mono-repo avoids duplication.

### Recommended Structure

```
k8s-terraform-projects/
├── README.md                  # Portfolio index — one paragraph per project, links to each folder
├── terraform/
│   └── modules/               # Shared modules written in P2, reused by all subsequent projects
│       ├── aks/
│       ├── acr/
│       └── networking/
├── projects/
│   ├── p1-voting-app/
│   ├── p2-iac-rebuild/
│   ├── p3-observability/
│   ├── p4-autoscaling/
│   ├── p5-gitops/
│   ├── p6-security/
│   ├── p7-stateful-dr/
│   ├── p8-canary/
│   └── capstone/
└── .github/
    └── workflows/             # CI pipelines — one workflow file per project as needed
```

Each `projects/pN-*/` folder contains its own `README.md`, manifests, Helm charts, and any project-specific Terraform that isn't shared.

### The Capstone Exception

When you reach the Capstone, **also create a separate standalone repo** for it. The Capstone is what goes on your CV as a portfolio item — recruiters and hiring managers will be sent directly to it, and it needs to stand alone with its own README, architecture diagram, and setup instructions. Keep the Capstone folder in the mono-repo as well (for the commit history), but the standalone repo is what you link publicly.

### Root README — Do This on Day One

Write a `README.md` at the root of the mono-repo before starting P1. Structure it as a portfolio index:

```markdown
# Kubernetes + Terraform Projects

A progressive series of real-app deployments on Azure AKS, built as
placement preparation for a junior DevOps / Platform Engineer role.

| Project | Focus | Status |
|---|---|---|
| P1 — Voting App | Multi-tier K8s wiring, PVCs, probes | ✅ Complete |
| P2 — IaC Rebuild | Terraform modules, remote state | 🔄 In progress |
| ...
```

Update the status column as you complete each project. This root README is the link you paste into your CV and send to recruiters. Someone spending 90 seconds on your GitHub profile will read this and decide whether to look deeper.

**Agent Instruction:** At the start of P1, prompt the learner to create this repo structure and write the root README skeleton before writing a single line of YAML or HCL. The repo should exist and have an initial commit before any project work begins.

---

---

# PROJECT 01 — Classic 3-Tier App on AKS
### App: Docker Sample Voting App | Focus: Real multi-tier service wiring

> **Difficulty:** Beginner | **AI Model:** 🤖 Gemini Flash | **Duration:** 3–4 days

**Agent Instruction:** This is the learner's first deployment of a real multi-service app. Every K8s object here — Deployment, Service, PVC, Secret, ConfigMap, probes — is potentially new in this real-app context. Apply the **New Concept** rule generously: when in doubt, provide the code with a full explanation and ask the learner to explain it back before applying. Start by asking them to study the `docker-compose.yml` and describe what each service does in plain English — this builds understanding before any YAML is written. If they struggle with PVC for PostgreSQL, explain the PV/PVC/StorageClass relationship using the analogy of a storage order form (PVC) vs actual physical storage (PV), then show the YAML together.

---

### Application Overview

The Docker Sample Voting App is a 5-component system:
- **vote** — Python Flask frontend (users cast votes)
- **redis** — In-memory queue (stores incoming votes)
- **worker** — .NET worker (reads from Redis, writes to PostgreSQL)
- **db** — PostgreSQL (stores final vote counts)
- **result** — Node.js frontend (displays live results)

**Source:** `https://github.com/dockersamples/example-voting-app`

Clone and study the `docker-compose.yml` first — understand how services connect before writing any K8s manifest.

---

### Objectives

- Deploy all 5 components as K8s Deployments with proper resource requests and limits
- Wire services using ClusterIP for internal communication, LoadBalancer for the two frontends
- Mount a PersistentVolumeClaim on the PostgreSQL pod using Azure Disk StorageClass
- Inject database credentials via a Secret, Redis config via a ConfigMap
- Add liveness and readiness probes to all 5 Deployments
- Perform a rolling update on the `vote` frontend and verify zero-downtime

---

### Pre-Project Questions (Agent must ask before starting)

Before writing any YAML, the agent asks these questions to understand how much scaffolding to apply — not as a gate, but as a calibration:

1. *"Look at the docker-compose.yml in the repo. Can you describe what each service does in plain English?"*
2. *"Why do you think you'd use ClusterIP for Redis but LoadBalancer for the vote frontend? Take a guess — there's no wrong answer here."*
3. *"PostgreSQL needs persistent storage. What do you think happens to the data if the Pod restarts without any storage attached?"*

If the learner answers confidently → proceed with lighter scaffolding, prompting them to write first.
If the learner is unsure or guesses → explain the concept clearly before moving to the task, then provide the code together.

---

### Practice Tasks

#### ✅ Task P1.1 — Study the App and Plan the Architecture
Write a plain-text architecture plan listing:
- Each component, its K8s Deployment name, its Service type, and why
- Which components need PVCs and what access mode
- Which components need Secrets vs ConfigMaps

Have the agent review this plan before writing any YAML.

---

#### ✅ Task P1.2 — Deploy the Data Tier First
Write and apply manifests for:
- PostgreSQL Deployment with resource requests (`cpu: 250m`, `memory: 512Mi`)
- Azure Disk PVC for PostgreSQL (`ReadWriteOnce`, `1Gi`)
- ClusterIP Service for PostgreSQL
- Secret for `POSTGRES_PASSWORD`

Verify the Pod is Running and the PVC is Bound before moving on.

```bash
kubectl get pvc
kubectl describe pod <postgres-pod>
kubectl exec -it <postgres-pod> -- psql -U postgres -c "\l"
```

---

#### ✅ Task P1.3 — Deploy Redis and the Worker
- Redis Deployment with a ConfigMap for `redis.conf` (set `maxmemory 100mb`)
- ClusterIP Service for Redis
- Worker Deployment with environment variables pointing to both Redis and PostgreSQL

Verify the worker is reading from Redis and writing to PostgreSQL:
```bash
kubectl logs -f deployment/worker
```

---

#### ✅ Task P1.4 — Deploy the Frontends with Probes
- Vote and Result frontend Deployments
- LoadBalancer Services for both
- Liveness probe: `httpGet /` every 10s, failureThreshold 3
- Readiness probe: `httpGet /` with `initialDelaySeconds: 5`

Open the vote frontend, cast a vote, check the result frontend.

---

#### ✅ Task P1.5 — Rolling Update and Rollback
Update the `vote` frontend to use a different color by setting an environment variable `OPTION_A=Cats` and `OPTION_B=Dogs` (the image supports this).

Observe the rolling update:
```bash
kubectl rollout status deployment/vote
kubectl rollout history deployment/vote
```

Then rollback:
```bash
kubectl rollout undo deployment/vote
```

Explain to the agent: what happened to the Pods during the rolling update? How many were unavailable at any point?

---

### Project Debrief (Agent must run this before marking complete)

The agent asks:
1. *"What was the trickiest part of wiring these services together? What mistake did you make?"*
2. *"If the PostgreSQL pod crashes and restarts, what data is preserved and what is lost? Why?"*
3. *"A new team member needs to deploy this to a new namespace called `staging`. What do they need to change in your manifests?"*

**Interview Roleplay:** *"Walk me through how you'd wire a multi-tier app in Kubernetes — how do tiers discover each other, and how did you handle stateful storage?"*

---

---

# PROJECT 02 — IaC-First Rebuild with Terraform
### App: Same Voting App | Focus: Provision the entire infrastructure via Terraform

> **Difficulty:** Beginner | **AI Model:** 🤖 Gemini Flash | **Duration:** 3–4 days

**Agent Instruction:** Terraform modules are a new concept in a real-infrastructure context even if the learner has seen them before. Treat the module structure, backend config, and workspace commands as **New Concept** items — provide full working HCL with explanation for each, then ask the learner to walk through what each block does. The key discipline to drive home is IaC thinking: if it wasn't Terraform, it doesn't exist. Review their module structure before they write `terraform apply`, and explain any issues rather than just pointing them out.

---

### Objectives

- Provision AKS cluster, ACR, and VNet entirely via Terraform with reusable modules
- Configure remote state backend in Azure Blob Storage with state locking
- Use Terraform workspaces to create separate `dev` and `staging` environments
- Output the kubeconfig from Terraform and use it with kubectl — no manual az aks get-credentials
- Redeploy the Voting App on the Terraform-provisioned cluster

---

### Module Structure to Build

```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── backend.tf
└── modules/
    ├── aks/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── acr/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── networking/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

The agent reviews this structure before the learner writes any HCL.

---

### Practice Tasks

#### ✅ Task P2.1 — Remote State Backend
Create an Azure Storage Account and container manually (this one exception is acceptable — bootstrapping). Configure `backend.tf` with:
- `resource_group_name`, `storage_account_name`, `container_name`, `key`
- State locking via Azure Blob lease

Verify: `terraform init` shows "Successfully configured the backend".

---

#### ✅ Task P2.2 — AKS Module
Write the `aks` module to provision:
- AKS cluster: 2 node pools (system pool: 1 node `Standard_B2s`, user pool: 1–3 nodes `Standard_B2s`)
- Cluster Autoscaler enabled on user pool
- Managed identity (not service principal)
- Log Analytics workspace integration

Variables: `cluster_name`, `resource_group`, `location`, `node_count_min`, `node_count_max`, `kubernetes_version`

---

#### ✅ Task P2.3 — ACR Module + AKS Integration
Write the `acr` module and wire the AKS-ACR role assignment:
```hcl
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = module.aks.kubelet_identity
  role_definition_name = "AcrPull"
  scope                = module.acr.acr_id
}
```

The learner must explain: *"Why does the kubelet need AcrPull and not the cluster itself?"*

---

#### ✅ Task P2.4 — Workspaces for dev and staging
```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace select dev
terraform apply -var-file="dev.tfvars"
```

Use `terraform.workspace` in your AKS module to vary `node_count` and `vm_size` between environments.

---

#### ✅ Task P2.5 — Redeploy Voting App on New Cluster
Get the kubeconfig from Terraform output:
```bash
terraform output -raw kube_config > ~/.kube/config-tf
export KUBECONFIG=~/.kube/config-tf
kubectl get nodes
```

Apply all P1 manifests. Verify the app is working. Then: `terraform destroy` the staging workspace to practice clean teardown.

---

### Project Debrief

1. *"What is stored in the Terraform state file? What happens if two engineers run `terraform apply` at the same time without remote state locking?"*
2. *"Your `dev.tfvars` has smaller node sizes than `prod.tfvars`. How does Terraform know which to use in each workspace?"*
3. *"A colleague made a manual change in the Azure portal to the AKS node count. What happens the next time someone runs `terraform apply`?"*

**Interview Roleplay:** *"How do you manage Terraform state in a team setting, and what happens if two people run apply simultaneously?"*

---

---

# PROJECT 03 — Observability Stack
### App: Podinfo | Focus: Prometheus, Grafana, real traffic, real alerts

> **Difficulty:** Intermediate | **AI Model:** 🧠 Claude Sonnet | **Duration:** 3–4 days

**Agent Instruction:** Podinfo is purpose-built for observability practice — it exposes Prometheus metrics at `/metrics` out of the box. Before setting up Prometheus, have the learner `kubectl exec` into a pod and `curl localhost:9898/metrics` to see raw metric output. They should understand what they're scraping before they configure a scraper. For the k6 load test, sit with the learner in Grafana and ask them to narrate what they see — this simulates real on-call work.

**Source:** `https://github.com/stefanprodan/podinfo`

---

### Objectives

- Deploy Podinfo on AKS with 2 replicas, resource limits, and readiness probes
- Deploy kube-prometheus-stack via Helm (Prometheus + Grafana + AlertManager)
- Configure a ServiceMonitor CRD to scrape Podinfo's `/metrics` endpoint
- Build a custom Grafana dashboard: RPS, HTTP error rate, p99 latency
- Write a k6 load test script to inject 100 concurrent users
- Configure an AlertManager rule to fire when HTTP error rate exceeds 1%
- Trigger the alert by deliberately breaking Podinfo (wrong env var) and observe the alert

---

### Practice Tasks

#### ✅ Task P3.1 — Deploy Podinfo
```yaml
# Hints only — learner writes the full manifest
# image: ghcr.io/stefanprodan/podinfo:latest
# containerPort: 9898
# env: PODINFO_UI_COLOR, PODINFO_UI_MESSAGE
# readinessProbe: httpGet /readyz
# livenessProbe: httpGet /healthz
```

Label pods with `app: podinfo` and `version: v1` — these labels will be used by ServiceMonitor.

---

#### ✅ Task P3.2 — Deploy kube-prometheus-stack via Helm
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace \
  --set grafana.adminPassword=<your-password> \
  --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false
```

Access Grafana: `kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring`

Import dashboard ID `3662` (Prometheus 2.0 Stats) and ID `6417` (Kubernetes Pods) to explore.

---

#### ✅ Task P3.3 — ServiceMonitor for Podinfo
Write a ServiceMonitor manifest that:
- Targets the `podinfo` Service using label selector `app: podinfo`
- Scrapes port `http` at path `/metrics` every `15s`

Verify in Prometheus UI (port-forward): `Status → Targets` — Podinfo should appear as UP.

---

#### ✅ Task P3.4 — Custom Grafana Dashboard
Create a dashboard with these panels using PromQL:

| Panel | PromQL |
|---|---|
| RPS (requests/sec) | `rate(http_requests_total{app="podinfo"}[1m])` |
| Error rate (%) | `rate(http_requests_total{app="podinfo",status_code=~"5.."}[1m]) / rate(http_requests_total{app="podinfo"}[1m]) * 100` |
| p99 latency (ms) | `histogram_quantile(0.99, rate(http_request_duration_seconds_bucket{app="podinfo"}[1m])) * 1000` |
| Pod memory usage | `container_memory_working_set_bytes{pod=~"podinfo.*"}` |

Save the dashboard as JSON and commit it to your Git repo.

---

#### ✅ Task P3.5 — k6 Load Test and Live Observation
Write a k6 script `load-test.js`:
```javascript
import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 100,
  duration: '5m',
};

export default function () {
  http.get('http://<podinfo-loadbalancer-ip>:9898/');
  sleep(1);
}
```

Run: `k6 run load-test.js`

While it runs, watch Grafana. The agent asks: *"What is the current RPS? Is the p99 latency trending up? What does that mean?"*

---

#### ✅ Task P3.6 — AlertManager Rule
Write a PrometheusRule manifest:
```yaml
# Alert fires when: HTTP 5xx rate > 1% for > 2 minutes
# labels: severity: warning
# Learner writes the full PromQL expr
```

Trigger the alert by setting an invalid env var in Podinfo that causes it to return 500s. Watch AlertManager fire. Then fix it and watch the alert resolve.

---

### Project Debrief

1. *"What is the difference between a ServiceMonitor and a regular Prometheus scrape_config? Why does the ServiceMonitor approach scale better?"*
2. *"During the k6 test, what metric would you look at first to know if the app is degrading under load?"*
3. *"Your alert fired at 2am. What's your first three kubectl commands to diagnose the problem?"*

**Interview Roleplay:** *"How do you know if your cluster is healthy? Walk me through the observability setup you built and what you'd alert on first."*

---

---

# PROJECT 04 — Autoscaling Under Load
### App: Podinfo (continued) | Focus: HPA, Cluster Autoscaler, Spot Nodes

> **Difficulty:** Intermediate | **AI Model:** 🧠 Claude Sonnet | **Duration:** 2–3 days

**Agent Instruction:** Build on the P3 cluster — do NOT destroy and recreate. This project is about layering autoscaling on top of the observability stack so the learner can watch it work in Grafana in real time. The critical learning moment is when they run k6, watch HPA scale pods, watch the Cluster Autoscaler provision new nodes, and see the metrics reflect this. Make them narrate everything they see.

---

### Objectives

- Configure HPA on Podinfo based on CPU utilization (target 50%)
- Verify metrics-server is running (required for HPA)
- Add a spot node pool to the AKS cluster via Terraform
- Configure appropriate taints and tolerations for spot nodes
- Run k6 to trigger pod scaling, then node scaling
- Add a PodDisruptionBudget to prevent all Podinfo pods from going down during node drain
- Watch the full autoscaling loop in Grafana

---

### Practice Tasks

#### ✅ Task P4.1 — Verify metrics-server and Deploy HPA
Check metrics-server: `kubectl top pods -n default`

Write an HPA manifest for Podinfo:
- `minReplicas: 2`, `maxReplicas: 10`
- Target: `averageUtilization: 50` on CPU

Watch: `kubectl get hpa -w`

---

#### ✅ Task P4.2 — Add Spot Node Pool via Terraform
Add a new node pool to your AKS Terraform module:
```hcl
# Spot node pool hints:
# priority = "Spot"
# eviction_policy = "Delete"
# spot_max_price = -1  # pay whatever Azure charges
# node_taints = ["kubernetes.azure.com/scalesetpriority=spot:NoSchedule"]
```

Apply the Terraform change. Verify the new node pool: `kubectl get nodes -l agentpool=spot`

---

#### ✅ Task P4.3 — Tolerations for Spot Nodes
Add a toleration to the Podinfo Deployment so it can schedule on spot nodes:
```yaml
tolerations:
  - key: "kubernetes.azure.com/scalesetpriority"
    operator: "Equal"
    value: "spot"
    effect: "NoSchedule"
```

Also add a `preferredDuringSchedulingIgnoredDuringExecution` affinity rule to prefer spot nodes for Podinfo — this simulates cost-optimized workload placement.

---

#### ✅ Task P4.4 — PodDisruptionBudget
Write a PDB: `minAvailable: 2` for Podinfo.

Test it: `kubectl drain <spot-node> --ignore-daemonsets --delete-emptydir-data`

Observe the drain is throttled by the PDB — it will not evict pods below `minAvailable: 2`. Fix the drain to complete successfully.

---

#### ✅ Task P4.5 — Full Autoscaling Loop with k6
Run a progressive k6 load test (ramp up virtual users over 10 minutes):
```javascript
export const options = {
  stages: [
    { duration: '2m', target: 50 },
    { duration: '5m', target: 200 },
    { duration: '3m', target: 0 },
  ],
};
```

In Grafana, watch simultaneously:
- Podinfo pod count (HPA reacting)
- Node count (Cluster Autoscaler reacting)
- CPU utilization per pod
- RPS and latency

The agent asks questions in real time about what is observed.

---

### Project Debrief

1. *"HPA scaled pods up, but then new pods were stuck in Pending for 2 minutes. What happened, and what resolved it?"*
2. *"A spot node was evicted by Azure mid-afternoon. What happened to the pods on it? How did the PDB affect the eviction?"*
3. *"How would you configure HPA to scale on RPS (a custom metric from Prometheus) instead of CPU?"*

**Interview Roleplay:** *"What's the difference between HPA and Cluster Autoscaler? What happens if HPA wants more pods but nodes are full?"*

---

---

# PROJECT 05 — Helm Packaging + GitOps with ArgoCD
### App: Podinfo | Focus: Helm chart authorship, ArgoCD auto-sync, full CI/CD loop

> **Difficulty:** Intermediate | **AI Model:** 🧠 Claude Sonnet | **Duration:** 3–4 days

**Agent Instruction:** The learner has been using raw manifests so far. This project forces them to convert their P3/P4 Podinfo manifests into a proper Helm chart from scratch — not using `helm create` scaffolding but writing it manually first. After the Helm chart works, they wire it to ArgoCD. The key discipline: after ArgoCD is set up, the learner must NEVER run `kubectl apply` manually again. All changes go through Git.

---

### Objectives

- Write a Helm chart for Podinfo from scratch (Deployment, Service, HPA, PDB, ServiceMonitor)
- Use `values.yaml` to parameterise image tag, replica count, resource limits, and ingress settings
- Create environment-specific overrides: `values-dev.yaml` and `values-prod.yaml`
- Install ArgoCD on AKS via Helm
- Create an ArgoCD Application pointing to your Helm chart in GitHub
- Set up GitHub Actions: PR triggers `helm lint + diff`, merge triggers image build → ACR push → values.yaml image tag update → ArgoCD auto-sync
- Use Azure Federated Credentials (OIDC) — no stored secrets in GitHub

---

### Helm Chart Structure to Build

```
charts/podinfo/
├── Chart.yaml
├── values.yaml
├── values-dev.yaml
├── values-prod.yaml
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    ├── hpa.yaml
    ├── pdb.yaml
    ├── servicemonitor.yaml
    └── _helpers.tpl
```

---

### Practice Tasks

#### ✅ Task P5.1 — Write the Helm Chart
Convert your P3 Podinfo manifests to Helm templates. Key parameterisation:

```yaml
# values.yaml skeleton — learner fills this in
image:
  repository: ghcr.io/stefanprodan/podinfo
  tag: latest
  pullPolicy: IfNotPresent

replicaCount: 2

resources:
  requests:
    cpu: 100m
    memory: 64Mi
  limits:
    cpu: 500m
    memory: 256Mi

autoscaling:
  enabled: true
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50

monitoring:
  enabled: true
```

Validate: `helm lint charts/podinfo` — zero errors before moving on.

---

#### ✅ Task P5.2 — Install ArgoCD and Set Up Application
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd --namespace argocd --create-namespace
```

Write an ArgoCD Application manifest:
```yaml
# Hints — learner writes full manifest
# spec.source.repoURL: your GitHub repo
# spec.source.path: charts/podinfo
# spec.source.helm.valueFiles: [values-dev.yaml]
# spec.destination.namespace: dev
# spec.syncPolicy.automated.prune: true
# spec.syncPolicy.automated.selfHeal: true
```

Verify: ArgoCD UI shows the application as Synced and Healthy.

---

#### ✅ Task P5.3 — GitHub Actions CI/CD Pipeline
Write two GitHub Actions workflows:

**Workflow 1 — PR validation** (trigger: `pull_request`):
```yaml
# Steps:
# 1. helm lint charts/podinfo
# 2. helm diff (requires helm-diff plugin)
# 3. Comment the diff on the PR
```

**Workflow 2 — CD** (trigger: `push to main`):
```yaml
# Steps:
# 1. Log in to ACR via OIDC (no stored secrets)
# 2. docker build + push with tag = github.sha
# 3. Update charts/podinfo/values.yaml image.tag = github.sha
# 4. git commit + push the values.yaml change
# ArgoCD detects the Git change and syncs automatically
```

Test the full loop: open a PR → review the helm diff comment → merge → watch ArgoCD sync in the UI.

---

#### ✅ Task P5.4 — Manual Sync Gate for Prod
Create a second ArgoCD Application for the `prod` namespace using `values-prod.yaml`. Set `syncPolicy: {}` (no auto-sync). Prod requires a human to click "Sync" in the ArgoCD UI — simulating a change approval gate.

Explain to the agent: *"Why would you want auto-sync in dev but manual sync in prod?"*

---

### Project Debrief

1. *"You made a change to the Helm chart and pushed to main. ArgoCD shows OutOfSync. What does that mean and what do you do?"*
2. *"A colleague ran `kubectl apply` directly on the prod cluster. What does ArgoCD do when it next reconciles?"*
3. *"How do you roll back a bad deployment in a GitOps setup? Where does the rollback happen — in Git or in Kubernetes?"*

**Interview Roleplay:** *"What is GitOps and how is it different from traditional CI/CD? How do you handle rollbacks in a GitOps workflow?"*

---

---

# PROJECT 06 — Network Policies + RBAC — Zero Trust Within the Cluster
### App: Google Online Boutique | Focus: Service isolation, least-privilege, Key Vault secrets

> **Difficulty:** Intermediate | **AI Model:** 🧠 Claude Sonnet | **Duration:** 4–5 days

**Agent Instruction:** Online Boutique has 10 microservices — this is the first time the learner works with a real service mesh at this scale. Before writing any NetworkPolicy, work with the learner to draw the allowed communication matrix together rather than requiring them to produce it alone. NetworkPolicy syntax is genuinely confusing the first time; treat it as a **New Concept** and provide the first two or three policies with full explanation, then ask the learner to write the remaining ones by following the same pattern. For RBAC, walk through the first role and binding together, then ask the learner to write the second one independently.

**Source:** `https://github.com/GoogleCloudPlatform/microservices-demo`

Clone and apply the `release/kubernetes-manifests.yaml` first to see it working — then begin locking it down.

---

### Objectives

- Deploy Online Boutique on AKS (all 10 microservices running)
- Implement a default-deny NetworkPolicy across the namespace
- Whitelist only the specific service-to-service communication paths that are required
- Assign dedicated ServiceAccounts to each microservice (remove default ServiceAccount usage)
- Create RBAC roles: `dev-readonly` (read pods/logs in prod, no exec), `dev-deployer` (can apply to dev only)
- Replace a hardcoded Secret with Azure Key Vault CSI driver — fetch the secret as a volume mount at runtime

---

### Communication Matrix (Agent verifies this before NetworkPolicy is written)

The learner must produce a table like:

| Source | Destination | Port | Protocol |
|---|---|---|---|
| frontend | cartservice | 7070 | gRPC |
| frontend | productcatalogservice | 3550 | gRPC |
| frontend | currencyservice | 7000 | gRPC |
| checkoutservice | cartservice | 7070 | gRPC |
| ... | ... | ... | ... |

Full reference: `https://github.com/GoogleCloudPlatform/microservices-demo#architecture`

---

### Practice Tasks

#### ✅ Task P6.1 — Deploy Online Boutique
```bash
kubectl create namespace boutique
kubectl apply -n boutique -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/main/release/kubernetes-manifests.yaml
kubectl get pods -n boutique
```

Access the frontend LoadBalancer. Buy something. Verify the full flow works before locking it down.

---

#### ✅ Task P6.2 — Default-Deny NetworkPolicy
Apply a default-deny policy to the `boutique` namespace:
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
  namespace: boutique
spec:
  podSelector: {}
  policyTypes:
    - Ingress
    - Egress
```

Verify the app is now broken (all traffic blocked). This is expected — proceed to whitelist.

---

#### ✅ Task P6.3 — Whitelist Service-to-Service Traffic
Write individual NetworkPolicy manifests for each service pair from your communication matrix. Example for cartservice:
```yaml
# Allow ingress to cartservice only from: frontend, checkoutservice, orderservice
# Allow egress from cartservice only to: redis-cart (port 6379)
# Learner writes the full podSelector and ingress/egress rules
```

Verify after each policy: access the frontend and confirm the affected feature works.

---

#### ✅ Task P6.4 — Dedicated ServiceAccounts
Create a ServiceAccount per microservice:
```bash
kubectl create serviceaccount frontend-sa -n boutique
kubectl create serviceaccount checkoutservice-sa -n boutique
# ... for all 10 services
```

Patch each Deployment to use its dedicated ServiceAccount. Verify no pod uses the `default` ServiceAccount.

---

#### ✅ Task P6.5 — RBAC Roles
Create and test two ClusterRoles:

**dev-readonly** — can `get`, `list`, `watch` pods, deployments, services, logs in `boutique` namespace. Cannot `exec`, `delete`, or `apply`.

**dev-deployer** — can `apply`, `get`, `list` in `dev` namespace only. No access to `boutique`.

Test by impersonating:
```bash
kubectl auth can-i exec pod --namespace boutique --as dev-user@company.com
# Expected: no
kubectl auth can-i get pods --namespace boutique --as dev-user@company.com
# Expected: yes
```

---

#### ✅ Task P6.6 — Azure Key Vault CSI for DB Secret
Instead of a K8s Secret for the Redis password, use the Key Vault CSI driver:
1. Install `secrets-store-csi-driver` and `secrets-store-csi-driver-provider-azure` via Helm
2. Store the Redis password in Azure Key Vault
3. Write a `SecretProviderClass` manifest pointing to your Key Vault
4. Mount the secret as a volume in the Redis Deployment
5. Verify: `kubectl exec` into Redis pod and `cat /mnt/secrets/redis-password`

---

### Project Debrief

1. *"After applying default-deny, the frontend was completely broken. How did you systematically restore it without just removing the policy?"*
2. *"A developer on your team needs to debug a production issue. They need logs but must not be able to exec into pods or delete resources. How did you implement this?"*
3. *"What are the risks of storing secrets as K8s Secrets vs Azure Key Vault? When would you use each?"*

**Interview Roleplay:** *"How do you prevent a compromised microservice from talking to services it shouldn't? Walk me through the defence-in-depth layers you put in place."*

---

---

# PROJECT 07 — Stateful Workload + Disaster Recovery
### App: Bitnami Redis Cluster | Focus: StatefulSet, PVC lifecycle, Velero backup and restore

> **Difficulty:** Advanced | **AI Model:** 🧠 Claude Sonnet | **Duration:** 3–4 days

**Agent Instruction:** StatefulSets and Velero are both new concepts for most learners — provide full working examples with explanation for both, then ask the learner to describe what each section does before applying. The most important moment in this project is the restore test. Walk through the restore procedure together the first time rather than having the learner attempt it cold. Once they have seen it work once, ask them to repeat the restore independently and verify the data themselves. Frame this as "let's prove your backup actually works" — a satisfying moment, not a test.

---

### Objectives

- Deploy a 3-node Redis cluster using a StatefulSet with volumeClaimTemplates
- Understand stable network identity: `redis-0.redis.default.svc.cluster.local`
- Configure a headless Service for stable DNS
- Install Velero with Azure Blob Storage backend
- Create a scheduled backup of the namespace every 6 hours
- Perform a DR drill: write data, destroy StatefulSet + PVCs, restore from Velero, verify data

---

### Practice Tasks

#### ✅ Task P7.1 — Deploy Redis StatefulSet
Use the Bitnami Redis Helm chart as a reference architecture, but write the StatefulSet manifest yourself:

```yaml
# Key hints — learner writes full manifest
# kind: StatefulSet
# serviceName: "redis"  # headless service name
# replicas: 3
# volumeClaimTemplates:
#   - metadata: { name: redis-data }
#     spec:
#       accessModes: ["ReadWriteOnce"]
#       storageClassName: managed-premium
#       resources: { requests: { storage: 1Gi } }
```

Verify stable DNS: `kubectl exec -it redis-0 -- redis-cli -h redis-1.redis ping`

---

#### ✅ Task P7.2 — Write Test Data
Write known data into Redis that you will verify survived the restore:
```bash
kubectl exec -it redis-0 -- redis-cli
SET test:project07 "DR-drill-successful"
SET test:timestamp "$(date)"
KEYS test:*
```

Record the exact key-value pairs. You will verify these after restore.

---

#### ✅ Task P7.3 — Install Velero with Azure Blob Backend
```bash
# Install Velero CLI
# Create Azure Storage Account and container for backup storage
# Configure Velero with Azure credentials and BSL (BackupStorageLocation)
velero install \
  --provider azure \
  --plugins velero/velero-plugin-for-microsoft-azure:v1.9.0 \
  --bucket <container-name> \
  --secret-file ./credentials-velero \
  --backup-location-config resourceGroup=<rg>,storageAccount=<sa>
```

Verify: `velero backup-location get` shows Available.

---

#### ✅ Task P7.4 — Scheduled Backup
Create a Velero Schedule:
```bash
velero schedule create redis-backup \
  --schedule="0 */6 * * *" \
  --include-namespaces default \
  --ttl 72h0m0s
```

Trigger an immediate backup: `velero backup create redis-manual --from-schedule redis-backup`

Verify: `velero backup describe redis-manual` shows Completed.

---

#### ✅ Task P7.5 — The DR Drill
This is the moment of truth. Destroy everything:

```bash
kubectl delete statefulset redis
kubectl delete pvc -l app=redis
kubectl get pvc  # must show no redis PVCs remain
```

Restore from Velero:
```bash
velero restore create --from-backup redis-manual
kubectl get pods -w  # watch redis pods come back
```

Verify data survived:
```bash
kubectl exec -it redis-0 -- redis-cli
GET test:project07
# Expected: "DR-drill-successful"
```

If the data is not there, the DR drill has failed — debug and repeat.

---

### Project Debrief

1. *"Why does a StatefulSet use volumeClaimTemplates instead of a single PVC like a Deployment would?"*
2. *"Your redis-1 pod was evicted. When it comes back, what is its hostname? What DNS name do other pods use to reach it?"*
3. *"You had 3 PVCs for the 3 Redis nodes. After `kubectl delete statefulset redis`, what happened to the PVCs? Why?"*

**Interview Roleplay:** *"How do you run a stateful database in Kubernetes? What makes StatefulSets different from Deployments, and how do you handle disaster recovery?"*

---

---

# PROJECT 08 — Canary Deployment + Traffic Shaping
### App: Google Online Boutique | Focus: Canary rollout, Locust traffic injection, TLS, cert-manager

> **Difficulty:** Advanced | **AI Model:** 🧠 Claude Sonnet | **Duration:** 4–5 days

**Agent Instruction:** This is the most production-realistic project before the Capstone. The learner will deploy v2 of the checkout service to 10% of traffic while the rest receives v1, run a Locust test simulating real user shopping journeys, and compare error rates in Grafana. Only if v2 shows equal or better error rates should they promote to 100%. This is exactly how a real canary deployment works. Do not let them skip the Grafana comparison step — that is the whole point. This project directly prepares them for the Capstone's M4 (Ingress + TLS) and M9 (traffic shaping) milestones.

---

### Objectives

- Online Boutique running on AKS with Helm + ArgoCD (from P5/P6 setup)
- Deploy a modified `checkoutservice-v2` image (introduce a deliberate latency to simulate a regression)
- Configure NGINX Ingress canary annotations to route 10% of traffic to v2
- Run a Locust load test simulating 200 concurrent users: browse → add to cart → checkout
- Monitor v1 vs v2 error rate and latency side by side in Grafana
- If v2 passes: promote to 100% via ArgoCD
- If v2 fails: rollback by removing the canary Ingress
- Add TLS to the Ingress using cert-manager with a self-signed issuer

---

### Practice Tasks

#### ✅ Task P8.1 — Prepare Canary Image
Build a modified `checkoutservice` that adds a 200ms artificial delay:
```python
# In the checkout handler, add:
import time
time.sleep(0.2)  # simulate regression
```

Build and push to ACR with tag `checkoutservice:v2-canary`. The real-world equivalent of this is deploying a new feature version that you're not confident about.

---

#### ✅ Task P8.2 — Canary Ingress with NGINX Annotations
Deploy a second Deployment `checkoutservice-v2` with the canary image. Write two Ingress resources:

**Primary Ingress** (stable):
```yaml
# Routes 90% traffic to checkoutservice:v1
# host: boutique.yourdomain.com
# No canary annotations
```

**Canary Ingress** (10% traffic):
```yaml
metadata:
  annotations:
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "10"
```

Verify the split: run `for i in $(seq 1 50); do curl -s http://boutique.yourdomain.com/cart | grep "version"; done` and count v1 vs v2 responses.

---

#### ✅ Task P8.3 — TLS with cert-manager
Install cert-manager:
```bash
helm repo add jetstack https://charts.jetstack.io
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager --create-namespace \
  --set installCRDs=true
```

Create a self-signed ClusterIssuer and a Certificate for `boutique.yourdomain.com`. Add TLS to your Ingress:
```yaml
tls:
  - hosts: [boutique.yourdomain.com]
    secretName: boutique-tls
```

Verify: `kubectl describe certificate boutique-tls` shows `Ready: True`.

---

#### ✅ Task P8.4 — Locust Load Test
Write a `locustfile.py` simulating a realistic shopping journey:
```python
from locust import HttpUser, task, between

class ShopperUser(HttpUser):
    wait_time = between(1, 3)

    @task(3)
    def browse_products(self):
        self.client.get("/")
        self.client.get("/product/OLJCESPC7Z")

    @task(2)
    def add_to_cart(self):
        self.client.post("/cart", json={"product_id": "OLJCESPC7Z", "quantity": 1})

    @task(1)
    def checkout(self):
        self.client.get("/cart")
        # Simulate checkout
        self.client.post("/cart/checkout", data={...})
```

Run: `locust -f locustfile.py --host https://boutique.yourdomain.com`

Ramp to 200 users over 5 minutes. Watch Locust's dashboard and Grafana simultaneously.

---

#### ✅ Task P8.5 — Grafana Comparison and Decision
In Grafana, create a dashboard with two rows — one for v1, one for v2:

| Metric | v1 | v2 |
|---|---|---|
| p99 latency | | |
| Error rate | | |
| RPS | | |

After 10 minutes of Locust test, the agent asks: *"Looking at your dashboard right now, would you promote v2 to 100%? Explain your reasoning using the numbers you see."*

**If promoting:** Change canary weight to 100 via ArgoCD values.yaml update.

**If rolling back:** `kubectl delete ingress checkoutservice-canary` — traffic immediately returns 100% to v1.

---

#### ✅ Task P8.6 — Promotion via ArgoCD
Promotion happens through Git — never manually:
1. Update `values.yaml`: set `checkoutservice.image.tag: v2-canary`
2. Remove the canary Ingress from the chart
3. Push to Git → ArgoCD syncs → 100% traffic on v2

Verify zero-downtime during promotion using Locust's real-time failure count.

---

### Project Debrief

1. *"During the canary test, you noticed v2 had 3x higher p99 latency than v1. What do you do, and what's the customer impact while you decide?"*
2. *"The cert-manager Certificate is stuck in `False` state. What are the first three things you check?"*
3. *"A colleague says 'just change the Ingress manually to route 100% to v2, it's faster than Git'. How do you respond?"*

**Interview Roleplay:** *"How would you deploy a risky change to production with minimal blast radius? Walk me through a canary deployment — how you route traffic, what you monitor, and when you promote or rollback."*

---

---

---

---

# 🏆 CAPSTONE — Production-Grade AKS Platform
### Full IaC deployment of a multi-tier app with GitOps, observability, security, and DR

> **Difficulty:** Portfolio-grade | **AI Model:** 🧠 Claude Sonnet (all guidance) | **Duration:** 2–3 weeks

**Agent Instruction:** This is the learner's portfolio centrepiece — the project they will walk through in every DevOps interview. Guide through each milestone in sequence. Do NOT provide complete code at any point. Instead: ask the learner to explain their design choices before implementing, review their code and give structured feedback, and point out production pitfalls they haven't considered. When they ask "how do I do X?", respond with "what options do you see, and what are the tradeoffs?" before guiding. The goal is for the learner to own every decision so they can defend it in an interview without notes.

---

## Project: E-Commerce Platform on AKS

Deploy a production-representative 3-tier e-commerce application — React frontend, Node.js API, PostgreSQL — on AKS. Every component provisioned as code, every change through Git, every secret in Key Vault, full observability, and a tested disaster recovery procedure. This is the project on the CV.

**What makes this different from P1–P8:** Nothing is scaffolded. The learner designs the architecture, chooses the module structure, writes every manifest and HCL file, and justifies every decision. The agent acts as a senior engineer reviewing their work, not as a guide holding their hand.

---

## Pre-Capstone Check-In — Agent runs this before starting

Before writing any code, the agent has a relaxed conversation to understand where the learner feels confident and where they feel shaky. This is not a pass/fail gate — it is a way to figure out how much support to provide upfront.

1. *"Can you sketch the rough architecture on paper — VNet, AKS node pools, ACR, Key Vault, namespaces, how tiers connect? Don't worry about getting it perfect."*
2. *"What Terraform modules do you think you'll need? What would go in each one?"*
3. *"Where will secrets live, and how will they reach the pods?"*
4. *"If you push a bad API image to prod, how would you detect it and roll it back?"*

For anything the learner is uncertain about, the agent briefly revisits the relevant earlier project together before starting the Capstone milestone that depends on it. This takes 15–30 minutes and prevents hours of frustration later. Frame it as: *"Let's just quickly refresh that before we build on it — it'll make this milestone much smoother."*

---

## Capstone Milestones

| # | Milestone | Deliverable |
|---|---|---|
| M1 | Infrastructure as Code | Terraform modules: AKS (2 node pools: system + user), ACR, Key Vault, VNet, Log Analytics. Remote state in Azure Blob. Workspace per environment (`dev`/`staging`/`prod`). |
| M2 | Container Images | Dockerize all 3 services. Push to ACR tagged with git SHA. Non-root images. Trivy security scan in GitHub Actions — fail the pipeline on HIGH/CRITICAL CVEs. |
| M3 | Helm Charts | Helm chart per service (frontend, api, db using Bitnami PostgreSQL as dependency). Environment-specific `values-dev.yaml`, `values-staging.yaml`, `values-prod.yaml`. |
| M4 | Networking & Ingress | NGINX Ingress Controller deployed via Terraform Helm provider. TLS via cert-manager (self-signed for dev, Let's Encrypt for staging/prod). NetworkPolicies for tier isolation. DNS on Azure DNS Zone. |
| M5 | RBAC & Security Hardening | Dedicated ServiceAccount per tier. Pod Security Standards (restricted profile). Key Vault CSI driver for DB password. RBAC: dev team gets read-only prod access, no exec. |
| M6 | GitOps with ArgoCD | ArgoCD App-of-Apps pattern managing all 3 Helm charts. Auto-sync for dev, manual approval gate for prod. Sync wave ordering: db → api → frontend. |
| M7 | CI/CD Pipeline | GitHub Actions: PR → `terraform plan` + Helm diff comment. Merge → `terraform apply` (OIDC, no stored secrets). Separate workflow: Docker build → ACR push → update image tag in values.yaml → ArgoCD auto-detects. |
| M8 | Observability | Prometheus + Grafana (kube-prometheus-stack). Custom dashboards for all 3 tiers: RPS, error rate, p99 latency. Azure Monitor alert: node CPU > 80%. SLO dashboard: availability, latency, error rate. |
| M9 | Autoscaling & Cost | HPA on frontend and API (CPU + custom RPS metric). Cluster Autoscaler on user node pool. Spot node pool for non-critical workloads with taints/tolerations. Cost report exported from Azure Cost Management. |
| M10 | Disaster Recovery & Docs | Velero scheduled backup (every 6h) to Azure Blob. Tested restore: delete a namespace, restore from backup, verify data. Architecture diagram (draw.io or Excalidraw). README with: onboarding guide, runbook for common incidents, and rollback procedure. |

---

## Milestone Guidance — Agent Instructions Per Milestone

### M1 — IaC
Before the learner writes any HCL, ask them to define the module interface: *"What are the input variables and output values for each module?"* Reject any module that has hardcoded values. Check that `terraform.workspace` is used to vary node sizes between environments. Verify state locking is configured before they run `apply`.

### M2 — Images
Ask: *"Why do we tag with git SHA instead of `latest`?"* Verify Trivy is actually failing the pipeline on a test CVE — add a deliberately vulnerable base image, confirm the pipeline fails, then switch to the correct image. If they can't demonstrate a pipeline failure, the security gate isn't real.

### M3 — Helm Charts
Review `_helpers.tpl` — all repeated labels should use template helpers, not be copy-pasted. Check that `values-prod.yaml` has stricter resource limits than `values-dev.yaml`. Run `helm lint` and `helm template` in CI before the learner applies anything to the cluster.

### M4 — Networking
Before NetworkPolicies are written, require the learner to draw the allowed communication matrix: which tier talks to which, on which port. Reject any `podSelector: {}` that isn't a default-deny rule. Test TLS: `curl -k https://yourdomain.com` should return the frontend, not an SSL error.

### M5 — Security
Run a security checklist: `kubectl get pods -n prod -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.serviceAccountName}{"\n"}{end}'` — no pod should show `default`. Verify no secrets are stored in Git (`git log -p | grep -i password` should return nothing). Test RBAC with `kubectl auth can-i --as` for the dev team user.

### M6 — GitOps
After ArgoCD is configured, the learner must make a deliberate manual `kubectl apply` to the prod namespace. The agent then asks: *"What happens when ArgoCD next reconciles? Is that a problem? How would you prevent manual changes in the first place?"* Only proceed when they understand self-healing and how to use ResourceHooks or admission webhooks to prevent drift.

### M7 — CI/CD
The OIDC setup is non-negotiable — no service principal secrets stored in GitHub. Verify by checking GitHub Actions secrets: there should be no `ARM_CLIENT_SECRET`. Test the full loop end-to-end: push a one-line code change → watch the pipeline → watch ArgoCD sync → verify the change is live in the cluster.

### M8 — Observability
The learner must fire at least one real alert. Deliberately cause a pod OOMKill by lowering memory limits below the app's usage, then watch the AlertManager fire. Fix it, watch the alert resolve. Ask: *"If this fired at 2am and you were on-call, what are your first five commands?"*

### M9 — Autoscaling
Run a Locust test (reuse the locustfile from P8) against the prod namespace. Watch HPA scale pods and Cluster Autoscaler provision spot nodes in Grafana. Ask: *"At what point does the Cluster Autoscaler give up waiting and leave a pod in Pending? How would you detect that?"*

### M10 — DR
The restore test must be real. The agent witnesses: `kubectl delete namespace prod` → `velero restore create` → `kubectl get pods -n prod` showing everything back. The learner then queries the database and shows application data survived. A backup that has never been restored is not a backup.

---

## Capstone Evaluation Rubric

| Area | What Agent Evaluates | Interview Readiness Signal |
|---|---|---|
| IaC Quality | DRY modules, no hardcoded values, proper variable types, remote state with locking, workspace-based envs | Can walk through the Terraform architecture and explain every decision without prompting |
| Security Posture | No secrets in Git, non-root containers, RBAC least privilege, Key Vault CSI in use, NetworkPolicies verified | Can threat-model their own setup and name three things an attacker could exploit |
| Operational Maturity | Alerts fire correctly on real events, DR restore verified with data, runbook is followable by a stranger | Can walk through a simulated incident: alert fires → diagnose → fix → verify |
| GitOps Discipline | All changes flow through Git, no manual kubectl in prod, ArgoCD reconciliation demonstrated live | Can show the full GitOps loop from code commit to running pod during the interview |
| Portfolio Presentation | README is clear, architecture diagram exists, repo is public (or shareable), commits tell a story | Can open the repo in a browser and narrate the project from scratch in under 5 minutes |

---

## Capstone Debrief — Final Interview Simulation

Before the agent marks the capstone complete, it runs a 30-minute mock interview covering:

1. *"Walk me through your architecture. Start from a developer pushing code and end at a user seeing the result in their browser."*
2. *"Show me your Terraform modules. Why did you structure them this way? What would break if you merged them into a single file?"*
3. *"Your Grafana dashboard is showing a spike in p99 latency on the API tier. Walk me through your investigation."*
4. *"A security audit finds that one of your pods is running as root. How did that happen, and how do you fix it across all environments at once?"*
5. *"The prod database was accidentally deleted. Walk me through your recovery procedure, step by step, from the moment you get paged."*
6. *"What would you improve about this architecture if you had another two weeks?"*

The learner answers every question without opening the repo. If they cannot answer a question, the agent marks that area incomplete and the learner revisits the relevant milestone.

---

---

# ✅ Placement Readiness Checklist

The agent verifies all items below before declaring the learner placement-ready. Every item must be demonstrated, not just described.

### Infrastructure & IaC
- [ ] Can provision a full AKS platform (cluster, ACR, Key Vault, VNet) via Terraform from scratch in under 45 minutes
- [ ] Terraform modules are DRY, have typed variables, and use remote state with locking
- [ ] Workspaces separate dev, staging, and prod environments with different resource sizes
- [ ] No credentials stored in code or GitHub — all auth via OIDC federated credentials

### Kubernetes
- [ ] Can write a production-ready Deployment manifest from memory: resources, probes, affinity, tolerations, ServiceAccount
- [ ] Has deployed StatefulSets and understands stable identity, ordered startup, and volumeClaimTemplates
- [ ] Has configured and tested HPA and observed Cluster Autoscaler provision nodes under real load
- [ ] Has set and tested a PodDisruptionBudget with `kubectl drain`

### Networking & Security
- [ ] Has implemented default-deny NetworkPolicy and whitelisted specific service-to-service paths — verified with `kubectl exec curl`
- [ ] RBAC roles are scoped correctly and tested with `kubectl auth can-i --as`
- [ ] No pod uses the `default` ServiceAccount in any production namespace
- [ ] Secrets live in Azure Key Vault and are mounted via CSI driver — not stored as K8s Secrets in Git

### Observability
- [ ] Prometheus + Grafana running with custom dashboards authored from scratch (not just imported)
- [ ] Has written PromQL for RPS, error rate, and p99 latency without looking it up
- [ ] Has triggered a real AlertManager alert and watched it fire and resolve

### GitOps & CI/CD
- [ ] Full GitOps loop demonstrated: commit to Git → GitHub Actions pipeline → ArgoCD sync → live cluster change
- [ ] Canary deployment executed: traffic split confirmed, metrics compared, promotion decision made from data
- [ ] TLS configured end-to-end with cert-manager; can explain the Certificate → Secret → Ingress flow

### Disaster Recovery
- [ ] Velero backup and restore completed with data verification — not just "it probably works"
- [ ] Can recite the DR procedure for a deleted namespace from memory

### Portfolio
- [ ] Capstone repo is clean, public (or shareable), and has a README that an interviewer can follow
- [ ] Architecture diagram exists showing all components and their relationships
- [ ] Can narrate the entire capstone project from memory in under 5 minutes

---

*Kubernetes + Terraform Projects Learning Path | Fresher DevOps Placement Track | Azure Student Account Edition*
