resource "aci_vrf" "vrf1a" {
  name                   = "test-tenant1-u"
  tenant_dn              = aci_tenant.tenant1.id
  bd_enforced_enable     = "yes"
  ip_data_plane_learning = "enabled"
  pc_enf_pref            = "unenforced"

}

