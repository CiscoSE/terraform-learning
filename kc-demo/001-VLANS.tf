resource "aci_physical_domain" "labsystems_physical_dom" {
    name = local.domain
    relation_infra_rs_vlan_ns = aci_vlan_pool.kcdemo_vlan_pool.id
}

resource "aci_vlan_pool" "kcdemo_vlan_pool" {
    name = local.vlan_pool
    alloc_mode = "static"
}

resource "aci_ranges" "demo1_vlan_range" {
   vlan_pool_dn = aci_vlan_pool.kcdemo_vlan_pool.id
   from = "vlan-${local.vlan_number1}"
   to   = "vlan-${local.vlan_number1}"
   alloc_mode = "static"
   role = "external"
}

resource "aci_ranges" "demo2_vlan_range" {
   vlan_pool_dn = aci_vlan_pool.kcdemo_vlan_pool.id
   from = "vlan-${local.vlan_number2}"
   to   = "vlan-${local.vlan_number2}"
   alloc_mode = "static"
   role = "external"
}
