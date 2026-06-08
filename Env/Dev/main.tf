module "resource_group" {
  source              = "../../Modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
}
