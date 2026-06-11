location             = "centralindia"
resource_group_names = ["rg-sentinelops-dev-hub", "rg-sentinelops-dev-spoke-1", "rg-sentinelops-dev-spoke-2"]

storage_accounts = {
  "sidsahub001" = {
    resource_group_name = "rg-sentinelops-dev-hub"
  }
  # "sidsaspoke001" = {
  #   resource_group_name = "rg-sentinelops-dev-spoke-1"
  # }
  # "sidsaspoke002" = {
  #   resource_group_name = "rg-sentinelops-dev-spoke-2"
  # }
}

vnets = {
  "vnet-sentinelops-dev-hub" = {
    resource_group_name = "rg-sentinelops-dev-hub"
    add_space           = ["10.10.0.0/16"]
  }
  # "vnet-sentinelops-dev-spoke-1" = {
  #   resource_group_name = "rg-sentinelops-dev-spoke-1"
  #   add_space           = ["10.20.0.0/16"]
  # }
  # "vnet-sentinelops-dev-spoke-2" = {
  #   resource_group_name = "rg-sentinelops-dev-spoke-2"
  #   add_space           = ["10.30.0.0/16"]
  # }
}

virtual_machines = {
  "vm-hub" = {
    resource_group_name = "rg-sentinelops-dev-hub"
    vnet_name           = "vnet-sentinelops-dev-hub"
    vm_size             = "Standard_B2ats_v2"
  }
  # "vm-spoke-1" = {
  #   resource_group_name = "rg-sentinelops-dev-spoke-1"
  #   vnet_name           = "vnet-sentinelops-dev-spoke-1"
  #   vm_size             = "Standard_B2s"
  # }
  # "vm-spoke-2" = {
  #   resource_group_name = "rg-sentinelops-dev-spoke-2"
  #   vnet_name           = "vnet-sentinelops-dev-spoke-2"
  #   vm_size             = "Standard_B2s"
  # }
}