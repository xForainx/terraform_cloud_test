resource "azurerm_network_security_group" "mynsgcours" {
  depends_on = [var.rg]
  name                = "My_NSG_TP"
  location            = var.region
  resource_group_name = var.rg.name

  dynamic "security_rule" {
    for_each = var.list_of_ports
    content {
      name                       = "Allow_${security_rule.value.name}_Port_${security_rule.value.destination_port_range}"
      priority                   = 100 + index(var.list_of_ports, security_rule.value)
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}