module "resource_group" {
  source              = "../../modules/resource-group"
  for_each            = var.resource_group_names
  resource_group_name = each.key
  location            = var.location
}

module "storage_account" {
  source               = "../../modules/storage-account"
  for_each             = var.storage_accounts
  storage_account_name = each.key
  resource_group_name  = each.value.resource_group_name
  location             = var.location
}