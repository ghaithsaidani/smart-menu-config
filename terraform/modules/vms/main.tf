resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_B1ms"
  admin_username      = var.username
  admin_ssh_key {
    username   = var.username
    public_key = file("~/.ssh/vm-azure-key.pub")
  }
  network_interface_ids = [ var.network_interface_id ] //[azurerm_network_interface.smart-menu-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  connection {
    type        = "ssh"
    user        = var.username
    private_key = file("~/.ssh/vm-azure-key")
    host        = var.host //azurerm_public_ip.smart-menu-public-ip-vm.ip_address
  }
}
