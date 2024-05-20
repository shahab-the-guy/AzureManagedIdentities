resource "azurerm_cosmosdb_account" "demo" {
  name                = "demo-cosmosdb-${random_integer.demo.result}"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  offer_type = "Standard"
  kind       = "GlobalDocumentDB"
  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = azurerm_resource_group.demo.location
    failover_priority = 0
  }

  enable_free_tier = true
  capacity {
    total_throughput_limit = 400
  }
 
#   local_authentication_disabled = false

  tags = local.common_tags
}

resource "azurerm_cosmosdb_sql_database" "demo" {
  name                = "demo"
  resource_group_name = azurerm_resource_group.demo.name
  account_name        = azurerm_cosmosdb_account.demo.name
}

resource "azurerm_cosmosdb_sql_container" "demo" {
  
  name                = "customers"
  resource_group_name = azurerm_resource_group.demo.name
  account_name        = azurerm_cosmosdb_account.demo.name
  database_name       = azurerm_cosmosdb_sql_database.demo.name

  partition_key_path = "/id"
}
