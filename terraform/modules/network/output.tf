output "public_ip" {
  value = azurerm_public_ip.public-ip.ip_address
}

output "network_interface_id" {
  value = azurerm_network_interface.nic.id
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}