variable "network_security_group_id" {}
variable "region" {}
variable "rg" {}

variable "script_file" {
  description = "path of the script file"
  default     = "worker/stack_install.sh"
}

variable "subnet_id" {}

variable "vm_name" {}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_Ds1_v2"
}