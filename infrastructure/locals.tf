locals {
  azure = {
    tenant_id       = "0c05d0ea-d039-4300-9bb4-66ee8ceb4e7c"
    subscription_id = "d30bf17d-e43d-44c8-9575-026a7e45ab6b" // AZ-Presentation
    region = var.az_default_region
  }
  common_tags = {
    project     = var.project
    environment = var.environment
    purpose     = var.purpose
  }
  naming_prefix = "${var.naming_prefix}-${var.environment}"
}
