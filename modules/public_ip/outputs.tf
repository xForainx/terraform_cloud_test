output "pub_ip"{
    value = azurerm_public_ip.mypublicipcours
}

output "ip_address"{
    value = azurerm_public_ip.mypublicipcours.ip_address
}