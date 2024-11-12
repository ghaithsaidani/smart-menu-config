output "principal_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}