resource "aci_bridge_domain" "bd1" {
    name = local.bd1_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
    relation_fv_rs_bd_to_out = [var.l3_out]
}

resource "aci_bridge_domain" "bd2" {
    name = local.bd2_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
    relation_fv_rs_bd_to_out = [var.l3_out]
}
