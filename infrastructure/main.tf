resource "random_integer" "demo" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "demo" {
  location = local.azure.region
  name     = "${lower(local.naming_prefix)}-${random_integer.demo.result}"
  tags     = local.common_tags
}
