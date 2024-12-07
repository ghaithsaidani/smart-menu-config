resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}


resource "azurerm_public_ip" "public-ip" {
  name                = "${var.vm_name}-ip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  resource_group_name = var.rg_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = element(azurerm_virtual_network.vnet.subnet.*.id,0)
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }
}
