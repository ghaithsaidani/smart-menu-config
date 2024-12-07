variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "aks_dns_prefix" {
  type = string
}

variable "default_node_pool" {
  type = object({
    name       = string
    node_count = number
    vm_size    = string
  })
}

variable "acr_id" {
  type = string
}

