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

  depends_on = [module.resource_group]
}

module "virtualnetwork" {
  source               = "../../modules/virtual-network"
  for_each             = var.vnets
  virtual_network_name = each.key
  resource_group_name  = each.value.resource_group_name
  location             = var.location
  add_space            = each.value.add_space

  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source               = "../../modules/virtual-machine"
  for_each             = var.virtual_machines
  virtual_machine_name = each.key
  resource_group_name  = each.value.resource_group_name
  location             = var.location
  vm_size              = each.value.vm_size
  subnet_id            = module.virtualnetwork[each.value.vnet_name].subnet_id

  depends_on = [module.virtualnetwork]
}