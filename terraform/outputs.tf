output "cluster_name" {
  value = module.aks-cluster.cluster_name
  description = "The name of the provisioned AKS cluster"
}

output "kube_config" {
  value = module.aks-cluster.kube_config
  sensitive   = true
  description = "Raw Kubernetes kubeconfig credential"
}

output "acr_login_server" {
  value       = module.acr.login_server
  description = "The login URL for the private Container Registry"
}

output "key_vault_name" {
  value       = azurerm_key_vault.kv.name
  description = "The name of the provisioned Azure Key Vault"
}

output "kubelet_identity_client_id" {
  value       = module.aks-cluster.kubelet_identity_client_id
  description = "The Client ID of the AKS Kubelet identity"
}

output "velero_storage_account_name" {
  value       = azurerm_storage_account.velero.name
  description = "The name of the Storage Account used for Velero backups"
}

output "velero_container_name" {
  value = azurerm_storage_container.velero_container.name
  description = "The name of the Blob Container used for Velero backups"
}