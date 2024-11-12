resource "azurerm_network_security_group" "smart-menu-nsg" {
  name                = "smart-menu-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

 resource "azurerm_network_interface_security_group_association" "nic-nsg-association" {
  network_interface_id      = var.nic-id
  network_security_group_id = azurerm_network_security_group.smart-menu-nsg.id
} 