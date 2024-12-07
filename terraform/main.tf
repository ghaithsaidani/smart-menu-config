# resource group module
module "rg" {
  source = "./modules/rg"
  rg_name = var.rg_name
  location = var.location
}

# azure virtual network module
module "network" {
  source = "./modules/network"
  vnet_name = var.vnet_name
  rg_name = module.rg.rg_name
  location = var.location
  address_space = var.address_space
  dns_servers = var.dns_servers
  subnets = var.subnets
  vm_name = var.vm_name
}

# azure container registry module
module "acr" {
  source = "./modules/acr"
  acr_name = var.acr_name
  rg_name = module.rg.rg_name
  location = var.location
  acr_sku = var.acr_sku
}

# azure kubernetes service module
module "aks" {
  source = "./modules/aks"
  aks_name = var.aks_name
  rg_name = module.rg.rg_name
  location = var.location
  aks_dns_prefix = var.aks_dns_prefix
  default_node_pool = var.default_node_pool
  acr_id = module.acr.acr_id
}


module "vms" {
  source = "./modules/vms"
  rg_name = module.rg.rg_name
  location = var.location
  username = var.vm_username
  vm_name = var.vm_name
  network_interface_id = module.network.network_interface_id
  host = module.network.public_ip
}

# azure storage blob
module "blob-storage" {
  source = "./modules/blob-storage"
  rg_name = module.rg.rg_name
  location = var.location
  storage_acc_name = var.storage_acc_name
  account_tier = var.account_tier
  replica_type = var.replica_type
  storage_container_name = var.storage_container_name
  container_access_type = var.container_access_type
  file_name = var.file_name
  file_source = var.file_source
}