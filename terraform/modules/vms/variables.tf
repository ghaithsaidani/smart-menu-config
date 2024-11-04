variable "vm_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "username" {
  type = string
}

variable "network_interface_ids" {
  type = list(string)
}

variable "host" {
  type = string
}