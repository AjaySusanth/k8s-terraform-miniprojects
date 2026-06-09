resource "azurerm_log_analytics_workspace" "aks_logs" {
  name = "${var.cluster_name}-law"
  location = var.location
  resource_group_name = var.resource_group_name
  sku = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_kubernetes_cluster" "aks" {
    name = var.cluster_name
    location = var.location
    resource_group_name = var.resource_group_name
    dns_prefix = var.dns_prefix
    
    oidc_issuer_enabled = true
    default_node_pool {
      name = "systempool"
      node_count = 1
      vm_size = var.vm_size
      type = "VirtualMachineScaleSets"
      vnet_subnet_id = var.vnet_subnet_id
    }
    identity {
      type = "SystemAssigned"
    }
    network_profile {
      network_plugin = "azure"
      network_policy = "calico"
      load_balancer_sku = "standard"
      service_cidr      = "10.1.0.0/16"
      dns_service_ip    = "10.1.0.10"
    }
    oms_agent {
      log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_logs.id
    }

    # Enable Azure Key Vault Secrets Provider add-on
    key_vault_secrets_provider {
      secret_rotation_enabled = true
    }
}


resource "azurerm_kubernetes_cluster_node_pool" "user" {
    name = "userpool"
    kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
    vm_size = var.user_pool_vm_size
    vnet_subnet_id = var.vnet_subnet_id
    enable_auto_scaling = true
    min_count = var.min_count
    max_count = var.max_count
    node_labels = {
      role = "user"
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "spot" {
  name = "spot"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size = var.user_pool_vm_size
  vnet_subnet_id = var.vnet_subnet_id
  priority = "Spot"
  eviction_policy = "Delete"
  spot_max_price = -1
  node_taints = [ "kubernetes.azure.com/scalesetpriority=spot:NoSchedule" ]
  enable_auto_scaling = true
  min_count = 0
  max_count = 3
  node_labels = {
    role = "spot"
  }
}