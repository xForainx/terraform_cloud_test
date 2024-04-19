module "public_ip_master"{
  source                = "../../modules/public_ip"
  name                  = var.vm_name
  region                = var.region
  rg                    = var.rg
}

module "network_interface_master"{
  source                = "../../modules/network_interface"
  name                  = var.vm_name
  public_ip             = module.public_ip_master.pub_ip
  region                = var.region
  rg                    = var.rg
  subnet_id             = var.subnet_id
}

resource "azurerm_network_interface_security_group_association" "mynicnsgassocours_master" {
  network_interface_id      = module.network_interface_master.my_nic.id
  network_security_group_id = var.network_security_group_id
}

module "vmcreation_master" {
    source                = "../../modules/nginx_vm"
    region                = var.region
    resource_group        = var.rg
    script_file           = var.script_file
    size                  = var.vm_size
    name                  = var.vm_name
    vm_nic                = module.network_interface_master.my_nic
    vm_public_ip          = module.public_ip_master.ip_address
}