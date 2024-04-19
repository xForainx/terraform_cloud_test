output "vm_id" {
  value = azurerm_linux_virtual_machine.myvmcours.virtual_machine_id
}

output "ubuntu_id" {
  value = data.azurerm_platform_image.ubuntu18.id
}