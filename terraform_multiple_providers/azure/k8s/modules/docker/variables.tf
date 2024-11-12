variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Region of the azure docker registery"
  type = string
}

variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type = string
}