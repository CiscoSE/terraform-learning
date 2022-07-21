variable "app1_name" {
    default = "APP1"
}
resource "aci_application_profile" "app1" {
    name                = var.app1_name
    tenant_dn           = aci_tenant.tenant1.id
}

