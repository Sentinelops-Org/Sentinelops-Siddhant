location             = "centralindia"
resource_group_names = ["rg-sentinelops-dev-hub", "rg-sentinelops-dev-spoke-1", "rg-sentinelops-dev-spoke-2"]

storage_accounts = {
  "sidsahub001" = {
    resource_group_name = "rg-sentinelops-dev-hub"
  }
  "sidsaspoke001" = {
    resource_group_name = "rg-sentinelops-dev-spoke-1"
  }
  "sidsaspoke002" = {
    resource_group_name = "rg-sentinelops-dev-spoke-2"
  }
}