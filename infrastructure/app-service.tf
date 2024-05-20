resource "azurerm_user_assigned_identity" "demo" {
  name                = "demo-user-assigned-identity"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  tags = local.common_tags
}


resource "azurerm_service_plan" "demo" {
  name                = "app-service-plan"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  os_type  = "Linux"
  sku_name = "F1"
  

  tags = local.common_tags
}

resource "azurerm_linux_web_app" "demo" {
  name                = "app-service-${random_integer.demo.result}"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  service_plan_id     = azurerm_service_plan.demo.id

  tags = local.common_tags

  site_config {
    always_on = false // cannot be true for free and developer tier
    application_stack {
      dotnet_version = "8.0"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.demo.id]
  }
}
