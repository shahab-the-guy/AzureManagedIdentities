terraform {
  required_version = ">=1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.89.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.47.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
  }
}
