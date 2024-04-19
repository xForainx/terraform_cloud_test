resource "azurerm_public_ip" "mypublicipcours" {
  depends_on = [var.rg]
  name                = "My_${var.name}_Public_IP"
  resource_group_name = var.rg.name
  location            = var.region
  allocation_method   = "Static"

  tags = {
    environment = "Tig"
  }
}