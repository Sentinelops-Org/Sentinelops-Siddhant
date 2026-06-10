variable "location" {
  type        = string
  description = "Location of the resources"
}

variable "resource_group_names" {
  type        = set(string)
  description = "List of resource group names"
}

variable "storage_accounts" {
  type = map(object({
    resource_group_name = string
  }))
  description = "Map of storage accounts and their configurations"
}

variable "vnets" {
  type = map(object({
    resource_group_name = string
    add_space           = list(string)
  }))
  description = "Map of VNet and their configurations"
}

variable "virtual_machines" {
  type = map(object({
    resource_group_name = string
    vnet_name           = string
    vm_size             = string
  }))
  description = "Map of virtual machines and their network placement"
}