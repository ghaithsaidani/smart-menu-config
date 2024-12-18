variable "inboud-rules" {
  type = map(number)
  default = {
    ssh = 22
    prometheus = 9090
    grafana = 3000
  }
}

resource "azurerm_network_security_rule" "inbound-security-rules" {
  for_each = tomap(var.inboud-rules)
  name                        = "allow-${each.key}"
  priority                    = 100 + index(keys(var.inboud-rules), each.key)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "${each.value}"
  source_address_prefix       = "*"
  destination_address_prefix  = "10.0.1.0/24"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.monitoring-vm-nsg.name
}

variable "outbound-rules" {
  type = map(number)
  default = {
    
  }
}

resource "azurerm_network_security_rule" "outbound-security-rules" {
  for_each = tomap(var.outbound-rules)
  name                        = "allow-${each.key}"
  priority                    = 100 + index(keys(var.outbound-rules), each.key)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "${each.value}"
  destination_port_range      = "*"
  source_address_prefix       = "10.0.1.0/24"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.monitoring-vm-nsg.name
}
 