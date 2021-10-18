resource "aci_vlan_pool" "kcdemo_vlan_pool" {
    name = "kcdemo"
    alloc_mode = "static"
}

resource "aci_ranges" "kcdemo_vlan_range" {
   vlan_pool_dn = aci_vlan_pool.kcdemo_vlan_pool.id
   from = "501"
   to   = "501"
   alloc_mode = "static"
}

resource "aci_physical_domain" "kc_demo_physical_dom" {
    name = "kcdemo"
    relation_infra_rs_vlan_ns = aci_vlan_pool.kcdemo_vlan_pool.id
}