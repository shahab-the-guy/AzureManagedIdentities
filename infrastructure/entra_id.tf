resource "azuread_group" "demo" {
  description      = "Azure AD group for Cosmos DB access"
  display_name     = "Demo Group - Read Cosmos DB"
  security_enabled = true
}

resource "azurerm_cosmosdb_sql_role_assignment" "assign_cosmosdb_reader" {
  account_name        = azurerm_cosmosdb_account.demo.name
  principal_id        = azuread_group.demo.object_id
  resource_group_name = azurerm_resource_group.demo.name
  role_definition_id  = "/subscriptions/${local.azure.subscription_id}/resourceGroups/${azurerm_resource_group.demo.name}/providers/Microsoft.DocumentDB/databaseAccounts/${azurerm_cosmosdb_account.demo.name}/sqlRoleDefinitions/00000000-0000-0000-0000-000000000001"
  scope               = azurerm_cosmosdb_account.demo.id
}
// how to do that in bicep: https://github.com/Azure/azure-quickstart-templates/blob/master/quickstarts/microsoft.documentdb/cosmosdb-sql-rbac/main.bicep#L60-L66
