resource "aci_application_profile" "t1a1" {
    name                = "t1a1-Demo"
    tenant_dn           = aci_tenant.tenant1.id
}

resource "aci_application_profile" "t2a1" {
    name                = "t2a1-Demo"
    tenant_dn           = aci_tenant.tenant2.id
}
