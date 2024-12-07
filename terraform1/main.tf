resource "random_string" "aks_sp_secret" {
  length = 16
  special = true
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

module "docker-registry" {
  source = "./modules/docker"
  resource_group_name = module.resource-group.resource_group_name
  location = var.location
  acr_name = var.acr_name
  acr_sku = var.acr_sku
}

module "aks" {
  source = "./modules/k8s"
  resource_group_name = module.resource-group.resource_group_name
  location = var.location
  aks_name = var.aks_name
  dns_prefix = var.dns_prefix
  node_count = var.node_count
  subnet_id = module.network.subnet_id
  service_cidr = var.service_cidr
  //app_id = module.global.client_id
  //client_secret = module.global.client_secret
  //ssh_public_key = file("~/.ssh/k8s-vms-key")
}




// you can add both of these modules if you want to run jenkins on a seperate virtual machine
/* module "security" {
  source = "./modules/security"
  nsg-name = var.nsg-name
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
} */ 
/* module "global" {
  source = "./modules/global"
  principal_id = module.aks.principal_id
  scope = module.docker-registry.acr_id
  /* ad-app-name = var.ad-app-name
  aks_cluster = module.aks.aks_cluster_id
  svc_principal_password = random_string.aks_sp_secret.result
  az_app_password = random_string.aks_sp_secret.result 
}  */