resource "azurerm_virtual_network" "senitelops_virtual_network" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.add_space
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = [cidrsubnet(var.add_space[0], 8, 0)]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = [cidrsubnet(var.add_space[0], 8, 1)]
  }

  tags = {
    environment = "dev"
    project     = "sentinelops"
    createdby   = "terraform"
    owner       = "siddhant"
  }
}