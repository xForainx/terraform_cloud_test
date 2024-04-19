resource "azurerm_resource_group" "myrgcours" {
  name     = var.rg_name
  location = var.region
}