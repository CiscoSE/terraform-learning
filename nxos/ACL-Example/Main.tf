terraform {
  required_providers {
    nxos = {
      source = "netascode/nxos"
      version = "0.3.19"
    }
  }
}

variable switch1 {
  type = object ({
    name = string
    url = string
  })
}

variable switch2 {
  type = object({
    name = string
    url = string
  })
}

locals {
  leafs = [
    {
      name = var.switch1.name
      url  = var.switch1.url
    },
    {
      name = var.switch2.name
      url  = var.switch2.url
    },
  ]
}

variable "password" {
  default = "none-ya"
  description = "Password used to access systems associated with the provider"
}


provider "nxos" {
  username = "admin"
  password = var.password
  devices  = concat(local.leafs)
}
