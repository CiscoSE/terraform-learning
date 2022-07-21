variable "tenant1_name" {
  default = "ESG-Demo"
}

resource "aci_tenant" "tenant1" {
  name = var.tenant1_name
}

