terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">=1.1.0"
}

provider "azurerm" {
  features {}
}


module "resource-group" {
  source = "./modules/resource_groups"
  resource_group_name = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"
  resource_group_name = module.resource-group.resource_group_name
  location = var.location
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
  subnet_name = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  public_ip_name = var.public_ip_name
  nic_name = var.nic_name
}

module "nsg" {
  source = "./modules/nsg"
  resource_group_name = module.resource-group.resource_group_name
  location = var.location
  nic-id = module.network.nic-id
}

module "vms" {
  source = "./modules/vms"
  resource_group_name = module.resource-group.resource_group_name
  location = var.location
  vm_name = var.vm_name
  username = var.username
  network_interface_ids = [module.network.nic-id]
  host = module.network.public-ip-address
}
