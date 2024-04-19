data "azurerm_platform_image" "ubuntu18" {
  location = var.region
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
}