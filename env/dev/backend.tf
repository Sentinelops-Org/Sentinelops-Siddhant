terraform {
  backend "azurerm" {
    resource_group_name  = "rg-sentinelops-iac-shared-cin"
    storage_account_name = "sentinelopssastatestorage"
    container_name       = "sentinelops-state-files"
    key                  = "Env/Dev/terraform.tfstate"
  }
}
