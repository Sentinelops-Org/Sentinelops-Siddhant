terraform {
  backend "azurerm" {
    resource_group_name  = "rg-sentinelops-iac-shared-cin"
    storage_account_name = "sentinelopsstatesa"
    container_name       = "sentinelops-state-files"
    key                  = "env/dev/terraform.tfstate"
  }
}
