output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

/* output "public-ip-address" {
  value = azurerm_public_ip.public-ip.ip_address
  description = "smart menu public ip"
}

output "nic-id" {
    value = azurerm_network_interface.nic.id
    description = "The nic(network interface card) for"
} */