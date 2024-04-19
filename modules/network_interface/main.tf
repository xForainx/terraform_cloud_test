resource "azurerm_network_interface" "mynic1cours" {
  depends_on = [var.public_ip]
  name                = "My_${var.name}_NIC"
  location            = var.region
  resource_group_name = var.rg.name

  ip_configuration {
    name                          = "mynic1cours"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip.id
  }
}