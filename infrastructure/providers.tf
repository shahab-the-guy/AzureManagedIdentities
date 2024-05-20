provider "azurerm" {
  tenant_id       = local.azure.tenant_id
  subscription_id = local.azure.subscription_id
  features {
  }
}

provider "azuread" {
  tenant_id = "0c05d0ea-d039-4300-9bb4-66ee8ceb4e7c"
}

provider "random" {
}
