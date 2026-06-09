module "resource_group" {
  source              = "../../modules/resource-group"
  for_each            = toset(["rg-sentinelops-dev-hub", "rg-sentinelops-dev-spoke-1", "rg-sentinelops-dev-spoke-2"])
  resource_group_name = each.key
  location            = var.location
}
