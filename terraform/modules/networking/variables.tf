variable "resource_group_name" {
  type = string
  description = "Name of the parent resource group"
}

variable "location" {
  type = string
  description = "Azure region to deploy resources"
}

variable "vnet_name" {
  type = string
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type = list(string)
  description = "Address space range of VNet"
  default = [ "10.0.0.0/16" ]
}

variable "subnet_name" {
    type =  string
    description = "Name of the AKS node subnet"
  
}

variable "subnet_address_space" {
  type = list(string)
  description = "Address prefix range for the subnet"
  default = [ "10.0.1.0/24" ]
}