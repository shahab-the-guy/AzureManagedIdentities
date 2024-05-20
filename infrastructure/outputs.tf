output "cosmosdb_connection_string" {
  value = azurerm_cosmosdb_account.demo.connection_strings[0]
  sensitive = true
}

output "user_assigned_identity_client_id" {
  value = azurerm_user_assigned_identity.demo.client_id
}
