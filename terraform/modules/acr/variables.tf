variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}
variable "location" {
  type = string
  description = "Azure region to deploy resources"
}

variable "acr_name" {
  type = string
  description = "Name of azure container registry"
}

variable "sku" {
  type = string
  description = "SKU tier of the ACR (Basic, Standard, Premium)"
  default = "Standard"
}

