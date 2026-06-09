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
