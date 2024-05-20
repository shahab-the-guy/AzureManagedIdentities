## List role assignments
az cosmosdb sql role assignment list --account-name <account-name> --resource-group <resource-group>

## Create a role assignment
az cosmosdb sql role assignment create --account-name <account-name> --resource-group <resource-group> --scope "/" --principal-id <principal-id> --role-definition-id "/subscriptions/<subscription>/resourceGroups/<resource-group>/providers/Microsoft.DocumentDB/databaseAccounts/<account-name>/sqlRoleDefinitions/00000000-0000-0000-0000-000000000001"

### Delete a role assignment
az cosmosdb sql role assignment delete --account-name <account-name> --resource-group <resource-group> --role-assignment-id <role-assgintment-id>
