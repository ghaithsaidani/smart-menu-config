resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  resource_group_name = var.rg_name
  location            = var.location
  dns_prefix          = var.aks_dns_prefix
  default_node_pool {
    name       = var.default_node_pool.name
    node_count = var.default_node_pool.node_count
    vm_size    = var.default_node_pool.vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "role-assignment" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}
