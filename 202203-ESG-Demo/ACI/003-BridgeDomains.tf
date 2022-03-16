resource "aci_bridge_domain" "group1" {
    name = local.bd1_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
}

resource "aci_subnet" "subnet1" {
    parent_dn = aci_bridge_domain.group1.id
    ip        = "10.82.9.161/29"
    scope     = ["shared"]
}

#resource "aci_bridge_domain" "group2" {
#    name = "group2"
#    tenant_dn = aci_tenant.tenant1.id
#    relation_fv_rs_ctx = aci_vrf.vrf1a.id
#}

#resource "aci_subnet" "subnet2" {
#    parent_dn = aci_bridge_domain.group2.id
#    ip        = "10.82.9.169/29"
#    scope     = ["shared"]
#}
