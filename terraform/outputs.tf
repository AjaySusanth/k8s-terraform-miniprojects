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