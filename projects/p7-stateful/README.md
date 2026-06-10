# Project 7: Stateful Workloads & Disaster Recovery Runbook

This project demonstrates the implementation of a resilient stateful architecture for a Redis database running on Azure Kubernetes Service (AKS), paired with automated disaster recovery using **Velero** backed by Azure Blob Storage.

---

## 🏗️ Architecture Overview

The system architecture consists of a stateful application layer and a backup/restoration management plane:

```mermaid
graph TD
    subgraph AKS Cluster (Linux Nodes)
        direction TB
        subgraph default Namespace
            redis-0[Pod: redis-0] --- pvc-0[(PVC: redis-data-redis-0)]
            redis-1[Pod: redis-1] --- pvc-1[(PVC: redis-data-redis-1)]
            redis-2[Pod: redis-2] --- pvc-2[(PVC: redis-data-redis-2)]
            headless[Headless Service: redis]
        end
        subgraph velero Namespace
            velero-server[Velero Deployment]
            node-agent[node-agent DaemonSet]
        end
    end

    subgraph Azure Cloud Infrastructure (dev-k8s-rg)
        sa[(Storage Account: velerobackupf0hnum)]
        blob[Blob Container: velero-backups]
        sa --- blob
    end

    node-agent -.->|Read/Mount files directly| pvc-0
    node-agent -.->|Read/Mount files directly| pvc-1
    node-agent -.->|Read/Mount files directly| pvc-2
    velero-server ===>|Backup/Restore Tarballs| blob
```

### Key Components:
1. **StatefulSet (`redis`)**: Spawns 3 replicas (`redis-0`, `redis-1`, `redis-2`) with stable ordinal numbers and network identities.
2. **Headless Service (`redis` with `clusterIP: None`)**: Couples with CoreDNS to map individual stable names (e.g. `redis-1.redis.default.svc.cluster.local`) directly to pod IPs for peer discovery.
3. **Volume Claim Templates**: Provisions a dedicated Azure Managed Disk (`managed-premium`) for each Redis pod, ensuring state separation.
4. **Velero Node Agent**: Deploys a DaemonSet (`node-agent`) on all cluster nodes to copy files directly from node-mounted volumes (File System Backup), bypassing cloud provider snapshot boundaries.

---

## 🛠️ Step-by-Step Implementation

### Phase 1: StatefulSet Deployment & Test Data
1. Created the `redis-statefulset.yaml` manifest containing the Headless Service and `StatefulSet` with `volumeClaimTemplates` targeting the `managed-premium` storage class.
2. Verified all 3 pods reached `Running` status with individual persistent volumes.
3. Injected ground-truth verification data directly into the database:
   ```bash
   kubectl exec -it redis-0 -- redis-cli
   > SET test:project07 "DR-drill-successful"
   > SET test:timestamp "Wednesday-Drill"
   ```

### Phase 2: IaC Storage Provisioning & Velero Setup
1. Appended resources to the Terraform manifests to provision a secure, private Azure Storage Account (`velerobackupf0hnum`) and a blob container (`velero-backups`).
2. Generated a dedicated Azure Service Principal (`velero-sp`) and saved credentials locally in `credentials-velero`.
3. Installed Velero CLI and bootstrapped Velero on the cluster with the Azure plugin:
   ```bash
   velero install --provider azure --use-node-agent --default-volumes-to-fs-backup ...
   ```

### Phase 3: Disaster Recovery Drill
1. Created a Velero backup schedule:
   ```bash
   velero schedule create redis-backup --schedule="0 */6 * * *" --include-namespaces default --ttl 72h
   ```
2. Triggered an immediate backup with cloud snapshots disabled to force filesystem-level copy via the node agent:
   ```bash
   velero backup create redis-manual --include-namespaces default --snapshot-volumes=false
   ```
3. **The Destruction**: Deleted the entire database, including the StatefulSet and all PersistentVolumeClaims:
   ```bash
   kubectl delete statefulset redis
   kubectl delete pvc -l app=redis
   ```
4. **The Restoration**: Requested a restore from the Azure storage backup:
   ```bash
   velero restore create --from-backup redis-manual
   ```
5. **The Verification**: Opened the Redis CLI on the restored `redis-0` pod and ran queries:
   ```bash
   kubectl exec -it redis-0 -- redis-cli
   > GET test:project07
   "DR-drill-successful"
   ```

---

## ⚡ Challenges Overcome & Solutions

| Challenge | Root Cause | Solution |
| :--- | :--- | :--- |
| **ImagePullBackOff on Redis Pods** | The initially chosen Bitnami Redis image repository was deprecated or restricted. | Pivoted to the official `redis:7.2-alpine` image and adjusted container volume mount paths to `/data`. |
| **Azure Storage 404 (ResourceNotFound)** | A simple typographical error occurred in the `velero install` command, missing a single letter `m` at the end of the Storage Account name. | Patched the `BackupStorageLocation` Custom Resource inside Kubernetes directly without reinstalling: `kubectl patch backupstoragelocation default -n velero --type='json' -p='[{"op": "replace", "path": "/spec/config/storageAccount", "value": "velerobackupf0hnum"}]'` |
| **Volume Snapshot 404 Error** | AKS provisions persistent disks inside a separate, auto-generated Node Resource Group (`MC_...`), while Velero's Azure plugin was querying the main Resource Group (`dev-k8s-rg`). | Avoided cross-resource group permissions issues by switching to **File System Backup (FSB)** (`--default-volumes-to-fs-backup`), allowing Velero to copy raw files directly through a DaemonSet instead of making API calls to snapshot Azure Disks. |
| **DaemonSet CreateContainerError** | Running the installation from Git Bash on Windows caused path parameters in the built-in Velero DaemonSet template (like `/var/lib/kubelet/pods`) to get translated to Windows backslash format (`\var\lib\kubelet\pods`), which failed to mount on Linux nodes. | Patched the `node-agent` DaemonSet volumes configuration in the cluster to restore Unix-style slashes: `kubectl patch ds node-agent -n velero --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/0/hostPath/path", "value": "/var/lib/kubelet/pods"}]'` |

---

## 🎯 Key Outcomes & Acquired Learnings

1. **StatefulSet vs. Deployment**: Understand how StatefulSets enforce a strict ordinal index (`0`, `1`, `2`) and never share PVCs, keeping data isolated and stable.
2. **Headless Networking**: Explored how headless services bypass ClusterIP and use CoreDNS to direct client calls directly to a specific stateful replica.
3. **Backup Strategy**: Learned how to choose between cloud-provider block snapshots (CSI snapshots) and file-system backups (Kopia/restic). File-system backups are more portable, bypass resource group boundaries, and provide item-level granularity.
4. **Git Bash Path Translation Gotcha**: Acquired deep familiarity with path mangling quirks when running Linux commands from Git Bash/MSYS on Windows systems.
