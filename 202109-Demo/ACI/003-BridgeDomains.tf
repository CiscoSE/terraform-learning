resource "aci_bridge_domain" "tn1bd1" {
    # Builds bridge domain in tenant 1 associated with vrf
    name = "tn1bd1"
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
}

resource "aci_subnet" "tn1bd1sub" {
    parent_dn = aci_bridge_domain.tn1bd1.id
    ip        = "172.16.51.1/24"
    scope     = ["shared"]
}

resource "aci_bridge_domain" "tn2bd1" {
    # Builds bridge domain in tenant 1 associated with vrf
    name = "tn2bd1"
    tenant_dn = aci_tenant.tenant2.id
    relation_fv_rs_ctx = aci_vrf.vrf2a.id
}

resource "aci_subnet" "tn2bd1sub" {
    parent_dn = aci_bridge_domain.tn2bd1.id
    ip        = "172.16.52.1/24"
    scope     = ["shared"]
}