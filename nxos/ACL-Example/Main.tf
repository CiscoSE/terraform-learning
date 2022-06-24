terraform {
  required_providers {
    nxos = {
      source = "netascode/nxos"
      version = "0.3.19"
    }
  }
}

locals {
  leafs = [
    {
      name = "LEAF-1"
      url  = "https://10.82.6.23"
    },
    {
      name = "LEAF-2"
      url  = "https://10.82.6.24"
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
