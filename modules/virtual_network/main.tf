resource "azurerm_virtual_network" "myvnetcours" {
  depends_on = [var.rg]
  name                = "My_Vnet_TP"
  location            = var.region
  resource_group_name = var.rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Tig"
  }
}

resource "azurerm_subnet" "mysubnet1cours" {
  name                 = "My_Subnet1_TP"
  resource_group_name  = var.rg.name
  virtual_network_name = azurerm_virtual_network.myvnetcours.name
  address_prefixes     = ["10.0.2.0/24"]
}