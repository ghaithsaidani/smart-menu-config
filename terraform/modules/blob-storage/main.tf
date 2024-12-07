resource "azurerm_storage_account" "storage-account" {
  name                     = var.storage_acc_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replica_type
}


resource "azurerm_storage_container" "storage-container" {
  name                  = var.storage_container_name
  storage_account_id = azurerm_storage_account.storage-account.id
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "storage-blob" {
  name                   = var.file_name
  storage_account_name   = azurerm_storage_account.storage-account.name
  storage_container_name = azurerm_storage_container.storage-container.name
  type                   = "Block"
  source                 = var.file_source
}