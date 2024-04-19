variable "name_master_vm"{
  description = "name of master vm"
  default     = "master"
}
variable "name_worker_vm"{
  description = "name of worker vm"
  default     = "worker"
}

variable "region" {
  description = "Azure region where the resources will be created"
  default     = "westeurope" // Région par défaut
}

variable "resource_group_name" {
  description = "Name of resource group"
  default = "My_RG_Dev"
}