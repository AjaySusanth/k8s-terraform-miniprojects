terraform {
  backend "azurerm" {
    resource_group_name = "tf-state-rg"
    storage_account_name = "tfstate27"
    container_name = "tfstate"
    key = "global/s3/terraform.tfstate"
  }
}