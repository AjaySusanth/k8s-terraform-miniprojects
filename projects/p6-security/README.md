# 🔒 Project 06 — Zero-Trust Security on Kubernetes
### Google Online Boutique | Calico Network Policies, RBAC Least-Privilege & Azure Key Vault CSI

This project implements a complete Zero-Trust security model for a 10-microservice application ("Google Online Boutique") running on Azure Kubernetes Service (AKS).

---

## 🗺️ Security Architecture & Implementation

### 1. Network Layer: Default-Deny & Micro-segmentation
By default, all pods in Kubernetes can talk to each other. We locked down cluster communication using Calico NetworkPolicies:
* **Default-Deny All**: Placed a blanket `default-deny-all` policy on the `boutique` namespace to block all incoming (Ingress) and outgoing (Egress) traffic.
* **CoreDNS Whitelist**: Created an egress policy for all pods to communicate with `kube-dns` in the `kube-system` namespace on Port 53 (UDP/TCP). Without this, services cannot resolve cluster DNS names.
* **Microservice Whitelisting**: Created individual policies based on the application's communication matrix. For example:
  * The `frontend` pod allows public Ingress (0.0.0.0/0) but can only Egress to specific backend services (like `productcatalog` or `cartservice`).
  * The `cartservice` can only accept Ingress from `frontend` and `checkoutservice`, and is only allowed Egress to `redis-cart` on Port 6379.
  * The `redis-cart` database has no Egress permissions, preventing any data exfiltration attempts.

### 2. Identity Layer: Dedicated ServiceAccounts
* Removed the use of the `default` ServiceAccount.
* Provisioned dedicated ServiceAccounts for every microservice.
* Patched the `redis-cart` Deployment to run under its own `redis-cart` ServiceAccount, securing it within its own identity boundary.

### 3. Secrets Layer: Azure Key Vault CSI Driver (IaC-First)
Rather than storing database credentials in standard base64 Kubernetes Secrets (which reside unencrypted in `etcd`), we leveraged Azure Key Vault:
* **AKS Managed CSI Add-on**: Enabled the Azure Key Vault Secrets Provider directly in the AKS cluster via Terraform (`key_vault_secrets_provider`).
* **Kubelet Identity Authentication**: Granted the AKS cluster's Kubelet Managed Identity `Get` and `List` permissions to the Azure Key Vault.
* **Secret Provider Class**: Configured a `SecretProviderClass` in Kubernetes containing the tenant context and target Key Vault parameters.
* **Dynamic Mount**: Mounted the secrets as temporary in-memory volumes under `/mnt/secrets/redis-password` in the `redis-cart` pods.
* **IaC Integration**: Configured Terraform to generate a secure random password (`random_password`) at apply-time and write it directly to the Key Vault.

### 4. RBAC Least-Privilege Access control
Created two scoped personas using Kubernetes RBAC:
* **`dev-readonly`**: A Role and RoleBinding in the `boutique` namespace allowing developers to `get`, `list`, and `watch` workloads and view pod logs (`pods/log`), but completely restricting them from deleting, applying, or running `exec` sessions inside containers.
* **`dev-deployer`**: A Role and RoleBinding in the `dev` namespace allowing full deployment capabilities (`create`, `update`, `patch`, `delete` for workloads, services, and ingresses). They have no permissions in the `boutique` namespace.

---

## 💡 Key Lessons & DevOps Decisions

* **gRPC Keep-Alive & Conntrack**: Discovered that applying network policies does not terminate active TCP connections (tracked as `ESTABLISHED` by the Linux kernel). A rollout restart of the deployments was required to reset conntrack tables and force pods to negotiate connections under the new policies.
* **Kubernetes API Verbs**: Learned that there is no native `apply` verb in the Kubernetes API. To allow a CI/CD agent or user to `kubectl apply`, they must be granted `get`, `create`, `update`, and `patch` permissions.
* **Managed Add-ons vs. Helm**: Decided to use the built-in AKS Key Vault CSI add-on rather than manual Helm installation to reduce operational overhead, automate patching, and align with native Azure infrastructure-as-code patterns.

---

## 📁 Manifest Directory

* `default-deny.yaml` - Namespace-wide default block.
* `allow-dns.yaml` - CoreDNS egress resolution whitelist.
* `cartservice-policy.yaml` - Policy for Cart microservice.
* `paymentservice-policy.yaml` - Policy for Payment microservice.
* `recommendationservice-policy.yaml` - Policy for Recommendation microservice.
* `checkoutservice-policy.yaml` - Multi-dependency policy for Checkout microservice.
* `frontend-policy.yaml` - Public-facing gateway egress/ingress policy.
* `leaf-services-policy.yaml` - Ingress policies for productcatalog, currency, shipping, email, and ad services.
* `redis-policy.yaml` - Ingress policy for Redis.
* `dev-readonly.yaml` - Read-only developer RBAC definitions.
* `dev-deployer.yaml` - Write-enabled dev namespace deployer RBAC definitions.
* `secret-provider-class.yaml` - CSI Secrets Store provider config for Azure Key Vault.
* `redis-cart-patched.yaml` - Updated Redis deployment mounting the CSI secret volume.
