resource "aci_application_profile" "app1" {
    name                = local.app1_name
    tenant_dn           = aci_tenant.tenant1.id
}

