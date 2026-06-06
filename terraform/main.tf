locals {
  env = terraform.workspace
}

resource "azurerm_resource_group" "infra_rg" {
  name = "${local.env}-k8s-rg"
  location = var.location
}

resource "random_string" "suffix" {
  length =  6
  special = false
  upper = false
}


module "networking" {
  source = "./modules/networking"
  resource_group_name = azurerm_resource_group.infra_rg.name
  location = azurerm_resource_group.infra_rg.location
  vnet_name = "${local.env}-vnet"
  subnet_name = "${local.env}--subnet"
}

module "acr" {
  source = "./modules/acr"
  resource_group_name = azurerm_resource_group.infra_rg.name
  location = azurerm_resource_group.infra_rg.location
  acr_name = "${local.env}acr${random_string.suffix.result}"

}

module "aks-cluster" {
  source = "./modules/aks"
  resource_group_name = azurerm_resource_group.infra_rg.name
  location = azurerm_resource_group.infra_rg.location
  cluster_name = "${local.env}-aks"
  dns_prefix = "${local.env}k8s"
  vnet_subnet_id = module.networking.subnet_id
  min_count = lookup(var.min_node_count,local.env,1)
  max_count = lookup(var.max_node_count,local.env,3)

}

resource "azurerm_role_assignment" "aks_to_acr" {
  principal_id = module.aks-cluster.kubelet_identity_object_id
  role_definition_name = "AcrPull"
  scope = module.acr.acr_id
  skip_service_principal_aad_check = true
}