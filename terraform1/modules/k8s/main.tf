resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name           = "default"
    node_count     = var.node_count
    vm_size        = "Standard_D2_v2"
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  /* service_principal {
    client_id = var.app_id
    client_secret = var.client_secret
  } */

  network_profile {
    network_plugin = "azure"
    service_cidr   = var.service_cidr
    dns_service_ip = "10.1.0.10"
  }
}

/* resource "azurerm_role_assignment" "role_assignement" {
  principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.scope
  //skip_service_principal_aad_check = true
} */


