# ☸️ Project 01: Classic 3-Tier App on AKS/Minikube
### App: Docker Sample Voting App | Focus: Multi-service orchestration, secure data-tier mapping, and health probes

---

## 📋 Overview
This project represents a complete, production-ready Kubernetes deployment of the classic **Docker Voting App** (a 5-component distributed microservices architecture). It demonstrates internal service isolation, secure credential injection, decoupled stateful storage, container health checking, and zero-downtime update lifecycles.

---

## 🛠️ What Was Accomplished

1. **Stateful Database Tier:** Deployed a single-replica PostgreSQL database backed by a **PersistentVolumeClaim (PVC)** using the cluster's default dynamic storage provisioner (standard local path on Minikube).
2. **Internal Service Isolation:** Configured internal communication paths for `db` (Postgres) and `redis` (Queue) using **ClusterIP Services** on ports `5432` and `6379` respectively, ensuring zero external exposure.
3. **External Load Balancing:** Configured user-facing services for `vote` (Python frontend) and `result` (Node.js backend) using **LoadBalancer Services** to distribute external client traffic.
4. **Configuration Decoupling:** Mounted a custom `redis.conf` with a memory limit of `100mb` and an LRU eviction policy using a **Kubernetes ConfigMap Volume Mount** mapped to `/usr/local/etc/redis`.
5. **Secure Credential Injection:** Secured the PostgreSQL superuser password using a **Kubernetes Secret** (`Opaque`) and injected it safely into both the database and background worker containers at runtime.
6. **Container Health Assurance:** Added robust **Liveness and Readiness Probes** (via HTTP endpoints and CLI exec commands) to ensure Kubernetes only routes traffic to fully initialized containers and restarts unhealthy ones.
7. **Lifecycle Management:** Executed a rolling update of the front-end voting options ("Cats" vs "Dogs") and tested manual rollbacks (`kubectl rollout undo`) to demonstrate zero-downtime maintenance.

---

## 🚧 Challenges Faced & Resolutions

### 1. The Strict K8s API Schema (YAML Formatting)
* **Challenge:** Encountered multiple K8s API schema errors during initial deployment (`kind: Secrets` instead of `Secret`, `matchLabels` under Service spec, incorrect camelCase for `persistentVolumeClaim`, and missing `metadata` wrapper inside pod templates).
* **Resolution:** Reviewed the K8s schema structure:
  * Restructured `kind` properties to be strictly singular.
  * Corrected Service `selector` to be a flat key-value map.
  * Corrected Deployment `template.metadata.labels` structure.
  * Changed volume properties to camelCase (`persistentVolumeClaim`).

### 2. The Background Worker "Waiting for DB" Loop (The Mismatch)
* **Challenge:** The `.NET` background worker Pod repeatedly logged `Waiting for db` and failed to start. Database logs revealed: `FATAL: password authentication failed for user "postgres"`.
* **Resolution:** Investigated the worker image and discovered that the pre-built C# code had the database password hardcoded as `postgres`. The database, however, had initialized using a custom secure password (`yourpassword`) passed via K8s secrets.
* **The Catch:** Changing the secret value to `postgres` (`cG9zdGdyZXM=` in Base64) and running a rollout restart didn't work immediately. This is because PostgreSQL only sets the password **the very first time** the data directory is empty. Since the PVC was already populated, PostgreSQL ignored the new password.
* **Final Fix:** Deleted the existing PVC (`kubectl delete pvc postgres-pvc`), applied the updated `postgres` secret, and restarted the DB. This re-initialized a fresh, empty volume where Postgres read and applied the matching `postgres` password. The worker connected immediately.

### 3. LoadBalancer Pending IPs on Local Cluster
* **Challenge:** The `EXTERNAL-IP` of the `vote` and `result` LoadBalancer services remained in `<pending>` state forever.
* **Resolution:** Since Minikube runs locally without a cloud controller (like Azure AKS), it cannot dynamically allocate a physical public IP. Resolved by executing `minikube service vote` and `minikube service result` to map the internal K8s NodePorts directly to local localhost browser endpoints.

---

## 🧠 Key Kubernetes Concepts & Interview Questions

### Q1: What is the difference between a Pod crashing/restarting vs. a PVC being deleted?
* **Pod Crash:** When a database Pod crashes or is rescheduled, **no data is lost**. The PVC decouples the volume's lifecycle from the container. Kubernetes terminates the container, restarts it (or schedules a new Pod on a different node), and immediately remounts the exact same volume to `/var/lib/postgresql/data`, maintaining all transaction state.
* **PVC Deletion:** If you delete the PVC itself, the actual underlying storage volume is destroyed (depending on the StorageClass ReclaimPolicy, which defaults to `Delete`). All database files on disk are permanently wiped out.

### Q2: How does Kubernetes guarantee zero-downtime during rolling updates?
Kubernetes uses the **Readiness Probe** as a traffic gate. During a rolling update:
1. It spins up a new version Pod.
2. It **does not** route traffic to it yet.
3. It constantly polls the Readiness Probe.
4. Once the new Pod's probe returns successful, it adds the Pod to the Service's active endpoints and safely terminates one of the old version Pods.
5. This rolling handoff continues until all replicas are updated.

### Q3: Does Kubernetes automatically roll back a deployment if the new version is broken?
* **No!** Standard Kubernetes Deployments **do not automatically roll back**. 
* If a new version starts crashing or fails readiness checks, Kubernetes simply **pauses the rollout**. It leaves your old healthy replicas running (so your application stays online) while the new Pods remain in a failed state (`CrashLoopBackOff`). The rollout remains stuck until an engineer manually runs `kubectl rollout undo` or uses GitOps tools.

### Q4: Why did we mount the ConfigMap as a directory instead of a file?
Mounting a volume directly to a single file path without a `subPath` actually mounts it as a **directory** under the hood. In our Redis configuration, mounting `redis.conf` to `/usr/local/etc/redis/redis.conf` created a directory of that name, causing Redis to crash. The solution was mounting to the parent directory `/usr/local/etc/redis` and letting Kubernetes project the ConfigMap keys as individual files inside that folder.

---

## 🎙️ Interview-Ready STAR Story (The Ultimate Recap)

**Interviewer:** *"Walk me through how you deployed this multi-tier application. How did you handle networking, state, and any debugging challenges?"*

**Your Answer:**
> *"I deployed a classic 5-tier microservices application—consisting of a Python Flask frontend, a Redis queue, a .NET worker, a Node.js result dashboard, and a PostgreSQL database—completely via declarative Kubernetes manifests.*
> 
> *To enforce security and architectural boundaries, I isolated the data and queue tiers using internal `ClusterIP` services, while exposing our frontends using `LoadBalancer` services. For stateful durability, I decoupled the PostgreSQL storage layer using a `PersistentVolumeClaim` mapped to the container's data directory, ensuring transactions survived Pod rescheduling.*
> 
> *A significant learning moment occurred when the background worker went into a retry loop. By auditing the database container logs, I identified a password authentication failure. I traced it to the worker image having a hardcoded credential (`postgres`), while the database had initialized using a secure secret. Furthermore, I discovered that PostgreSQL only applies secure passwords during its first-time empty volume initialization. To resolve this, I updated the K8s secrets, wiped the local PVC, and triggered a clean initialization. This immediately resolved the connection loop and established robust communication.*
> 
> *Finally, I validated the cluster's lifecycle resilience by injecting health checks and executing a zero-downtime rolling update of the front-end features, demonstrating a clean recovery process."*
