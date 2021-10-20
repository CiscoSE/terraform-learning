resource "aci_bridge_domain" "tn1bd1" {
    # Builds bridge domain in tenant 1 associated with vrf
    name = local.bd1_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
}

resource "aci_subnet" "tn1bd1sub" {
    parent_dn = aci_bridge_domain.tn1bd1.id
    ip        = "2.1.100.1/24"
    scope     = ["shared"]
}

resource "aci_bridge_domain" "tn1bd2" {
    # Builds bridge domain in tenant 1 associated with vrf
    name = local.bd2_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
}

resource "aci_subnet" "tn1bd2sub" {
    parent_dn = aci_bridge_domain.tn1bd2.id
    ip        = "2.1.101.1/24"
    scope     = ["shared"]
}
