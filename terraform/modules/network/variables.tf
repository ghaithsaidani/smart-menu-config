variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = string
}

variable "dns_servers" {
  type = list(string)
}

variable "subnets" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}


variable "vm_name" {
  type = string
}