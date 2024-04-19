resource "azurerm_linux_virtual_machine" "myvmcours" {
  depends_on = [var.vm_nic]
  name                = var.name
  resource_group_name = var.resource_group.name
  location            = var.region
  size                = var.size
  computer_name       = "myVm1Syl"
  disable_password_authentication = false
  admin_username      = "adminuser"
  admin_password      = "Formation1234"
  network_interface_ids = [
    var.vm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    source_image_reference {
    publisher = data.azurerm_platform_image.ubuntu18.publisher
    offer     = data.azurerm_platform_image.ubuntu18.offer
    sku       = data.azurerm_platform_image.ubuntu18.sku
    version   = "latest"
  }
}

resource "null_resource" "stack_install" {
  # Cette ressource n'a pas de type spécifique, elle sert juste de conteneur pour les commandes de provisionnement
  depends_on = [azurerm_linux_virtual_machine.myvmcours]  # Attend la création de la machine virtuelle

  provisioner "file" {
    source      = "../machines/${var.script_file}"  # Chemin local du fichier setup.sh
    destination = "/home/adminuser/stack_install.sh"  # Chemin de destination sur la machine distante

    connection {
      type        = "ssh"
      user        = "adminuser"
      password    = "Formation1234"
      #private_key = file("~/.ssh/id_rsa")  # Spécifie le chemin vers ta clé privée SSH
      host        = var.vm_public_ip  # Adresse IP publique de la machine virtuelle
    }
  }

  # Exécute des commandes de provisionnement sur la machine virtuelle une fois qu'elle est créée
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/adminuser/stack_install.sh",
      "/home/adminuser/stack_install.sh"
    ]

    connection {
      type        = "ssh"
      user        = "adminuser"
      password    = "Formation1234"
      #private_key = file("~/.ssh/id_rsa")  # Spécifie le chemin vers ta clé privée SSH
      host        = var.vm_public_ip  # Adresse IP publique de la machine virtuelle
    }
  }
}