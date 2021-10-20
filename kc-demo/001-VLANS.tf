resource "aci_physical_domain" "labsystems_physical_dom" {
    name = local.domain
}

resource "aci_vlan_pool" "labsystems_vlan_pool" {
    name = local.vlan_pool
    alloc_mode = "static"
}

resource "aci_ranges" "labsystems_vlan_range" {
   vlan_pool_dn = aci_vlan_pool.labsystems_vlan_pool.id
   from = "vlan-501"
   to   = "vlan-501"
   alloc_mode = "static"
   role = "external"
}
