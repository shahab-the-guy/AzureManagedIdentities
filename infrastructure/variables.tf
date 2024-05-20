variable "az_default_region" {
  default     = "NorthEurope"
  description = "The default region to provision resources"
  type        = string
}

variable "purpose" {
  default     = "Education"
  description = "The purpose of the creation of a resource"
  type        = string
}

variable "project" {
  type        = string
  default     = "managed_identity"
  description = "The name of the project for resources"
}

variable "environment" {
  type        = string
  default     = "development"
  description = "The environment of the creation of a resource"
}

variable "naming_prefix" {
  type        = string
  default     = "demo_app"
  description = "The naming prefix for a resource"
}
