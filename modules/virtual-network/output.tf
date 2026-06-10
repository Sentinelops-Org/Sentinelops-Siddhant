output "virtual_network_name" {
    value = azurerm_virtual_network.senitelops_virtual_network.name
}

output "subnet_id" {
    value = tolist(azurerm_virtual_network.senitelops_virtual_network.subnet)[0].id
}