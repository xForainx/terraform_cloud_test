resource "azurerm_storage_account" "mystorageaccountcours" {
  name                     = "mystorageaccountsyl001"
  resource_group_name      = var.rg.name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Tig"
  }
}

resource "azurerm_storage_container" "mycontainercours" {
  name                  = "mon-container-tp"
  storage_account_name  = azurerm_storage_account.mystorageaccountcours.name
  container_access_type = "private"
}