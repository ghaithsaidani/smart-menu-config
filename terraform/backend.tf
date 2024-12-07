/* terraform {
  backend "azurerm" {
    resource_group_name  = "${var.resource_group_name}"
    storage_account_name = "${var.storage_account_name}"
    container_name       = "${var.container_name}"
    key                  = "terraform.tfstate"
  }
}  */


// if you run it for the first time you need to activate this

terraform {
  backend "local" {
  }
}