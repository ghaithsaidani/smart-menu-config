variable "resource_group_name" {
  default = "smart-menu-rg"
}

variable "location" {
  default = "northeurope"
}

variable "vnet_name" {
  default = "smart-menu-vnet"
}

variable "vnet_address_space" {
  default = "10.0.0.0/16"
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

variable "acr_name" {
  default = "SmartMenuAcr"
}

variable "aks_name" {
  default = "smart-menu-aks"
}

variable "dns_prefix" {
  default = "smartmenu"
}

variable "node_count" {
  default = 2
}

variable "acr_sku" {
  default = "Basic"
}

variable "service_cidr" {
  default = "10.1.0.0/16"
}

variable "nsg-name" {
  default = "jenkins-vm-nsg"
}

variable "vm_name" {
  default = "jenkins-vm"
}

variable "username" {
  default = "ghaith"
}

variable "ad-app-name" {
  default = "jenkins-role-hey"
}

