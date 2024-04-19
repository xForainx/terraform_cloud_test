module "resource_group" {
  source                = "./modules/resource_group"
  region                = var.region
  rg_name               = var.resource_group_name
}

module "network_security_group"{
  source                = "./modules/network_security_group"
  region                = var.region
  rg                    = module.resource_group.my_rg
}

module "virtual_network"{
  source                = "./modules/virtual_network"
  region                = var.region
  rg                    = module.resource_group.my_rg
}

module "master_machine"{
  source                    = "./machines/master"
  region                    = var.region
  rg                        = module.resource_group.my_rg
  subnet_id                 = module.virtual_network.subnet_id
  network_security_group_id = module.network_security_group.my_nsg_id
  vm_name                   = var.name_master_vm
}

module "worker_machine"{
  source                    = "./machines/worker"
  region                    = var.region
  rg                        = module.resource_group.my_rg
  subnet_id                 = module.virtual_network.subnet_id
  network_security_group_id = module.network_security_group.my_nsg_id
  vm_name                   = var.name_worker_vm
}

module "storage_account" {
  source                ="./modules/storage_account"
  region                = var.region
  rg                    = module.resource_group.my_rg
}