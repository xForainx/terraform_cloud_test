variable "network_security_group_id" {}
variable "region" {}
variable "rg" {}

variable "script_file" {
  description = "path of the script file"
  default     = "master/stack_install.sh"
}

variable "subnet_id" {}

variable "vm_name" {}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_D2_v2"
}