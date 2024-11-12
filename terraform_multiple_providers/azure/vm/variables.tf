variable "resource_group_name" {
  default = "smart-menu-rg-east-us"
}

variable "location" {
  default = "eastus"
}

variable "vnet_name" {
  default = "smart-menu-vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "smart-menu-subnet"
}

variable "subnet_address_prefixes" {
  default = ["10.0.1.0/24"]
}

variable "public_ip_name" {
  default = "public-ip-vm"
}

variable "nic_name" {
  default = "nic-vm"
}

variable "vm_name" {
  default = "smart-menu-vm"
}

variable "username" {
  default = "ghaith"
}