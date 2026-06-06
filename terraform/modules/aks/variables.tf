variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}
variable "location" {
  type = string
  description = "Azure region to deploy resources"
}

variable "dns_prefix" {
  type = string
  description = "DNS prefix for the cluster"
}
variable "vnet_subnet_id" {
  type = string
  description = "ID of the subnet where AKS pods and nodes should reside"  
}
variable "vm_size" {
  type = string
  description = "VM size for the system node pool"
  default = "Standard_B2s_v2"
}

variable "user_pool_vm_size" {
  type = string
  description = "VM size for the user node pool"
  default = "Standard_B2s_v2"
}

variable "min_count" {
  type = number
  description = "Minimum node count for the user pool"
  default = 1
}

variable "max_count" {
  type = number
  description = "Maximum node count for the user pool"
  default = 3
}

