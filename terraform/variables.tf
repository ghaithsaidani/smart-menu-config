# global variables
variable "subscription_id" {
  description = "subscription ID of actual account"
  type = string
}

# resource group variables
variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Resource group description"
  type = string
}


# network varibales
variable "vnet_name" {
  description = "virtual network name"
  type = string
}

variable "address_space" {
  description = "virtual network address space"
  type = string
}

variable "dns_servers" {
  description = "virtual network dns servers"
  type = list(string)
}

variable "subnets" {
  description = "virtual network subnets (which are a segments of our network)"
  type = list(object({
    name = string
    address_prefixes = list(string)
  }))
}


# azure container registry variables
variable "acr_name" {
  description = "azure container registry name"
  type = string
}

variable "acr_sku" {
  description = "azure container registry service Tier"
  type = string
}

# azure kubernetes service variables
variable "aks_name" {
  description = "azure kubernetes service name"
  type = string
}

variable "aks_dns_prefix" {
  description = "azure kubernetes service dns prefix"
  type = string
}

variable "default_node_pool" {
  description = "azure kubernetes service default node pool (default image of the node)"
  type = object({
    name = string
    node_count = number
    vm_size = string
  })
}

# azure blob storage variables
variable "storage_acc_name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "replica_type" {
  type = string
}

variable "storage_container_name" {
  type = string
}

variable "container_access_type" {
  type = string
}

variable "file_name" {
  type = string
}

variable "file_source" {
  type = string
}

# vm
variable "vm_name" {
  type = string
}

variable "vm_username" {
  type = string
}
