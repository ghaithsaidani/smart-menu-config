/* output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
} */

/* output "smart-menu-subnet" {
  value = azurerm_subnet.smart-menu-subnet[*].id
  description = "smart menu subnet(a range of IP addresses in the vnet)"
}*/

output "public-ip-address" {
  value = azurerm_public_ip.public-ip.ip_address
  description = "smart menu public ip"
}

output "nic-id" {
    value = azurerm_network_interface.nic.id
    description = "The nic(network interface card) for"
}