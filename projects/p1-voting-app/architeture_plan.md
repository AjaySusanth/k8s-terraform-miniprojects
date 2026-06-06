# 🏛️ Architecture Plan: Docker Voting App on AKS

## 1. Component Map
For each of the 5 services, define their K8s setup:

### A. postgres (db)
- **Deployment Name:** `db`
- **Replicas:** `1` (Why only 1 replica for a standard relational DB => Data inconsistency in each replica volume if not handled properly)
- **Service Type:** ClusterIP
- **Service Port:** 5432
- **Data Persistence:** Requires PVC? (Yes/No) => Yes
- **Sensitive Data:** Needs K8s Secret? (Yes/No - for password) => Yes, but are they safe in k8 secrets, isn't Azure vault prefered

### B. redis
- **Deployment Name:** `redis`
- **Replicas:** 1
- **Service Type:** ClusterIP
- **Service Port:** 6379
- **Configuration:** Needs ConfigMap? (Yes/No - for redis.conf) => Don't know

### C. worker
- **Deployment Name:** `worker`
- **Replicas:** 1
- **Service Type:** None (Wait, why does the worker not need a Service?) => No other component access the worker
- **Environment Variables:** Needs connection strings for # Which two services? => pg and redis

### D. vote
- **Deployment Name:** `vote`
- **Replicas:** 2 (For high availability)
- **Service Type:** LoadBalancer
- **Service Port:** 80 (Target container port: 80)
- **Probes Needed:** readiness and liveness

### E. result
- **Deployment Name:** `result`
- **Replicas:** 2
- **Service Type:** LoadBalancer
- **Service Port:** 80 (Target container port: 80)
- **Probes Needed:** readiness and liveness

---

## 2. Storage & Secrets Planning

### Persistent Volume Claim (PVC)
- **Name:** `postgres-pvc`
- **Storage Class:** `default` (standard Azure Managed Disks)
- **Access Mode:** # RWO, ROX, or RWX? Explain why. => RWO, don't know
- **Capacity:** `1Gi`

### Credentials Secret
- **Name:** `postgres-secret`
- **Keys:** `POSTGRES_PASSWORD` (needs to match what db and worker expect)
