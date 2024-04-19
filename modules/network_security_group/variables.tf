variable "list_of_ports" {
  description = "This is a variable of type List of objects for all ports to open"
  type = list(object({
    name = string,
    destination_port_range = number
  }))
  default = [
    {
      name = "SSH",
      destination_port_range = 22
    },
    {
      name = "HTTP",
      destination_port_range = 80
    },
    {
      name = "HTTPS",
      destination_port_range = 443
    }
  ]
}

variable "region"{}
variable "rg"{}