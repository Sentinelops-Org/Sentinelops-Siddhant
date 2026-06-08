resource "azurerm_resource_group" "sentinelops-rg" {
    name = var.resource_group_name
    location = var.location
}

