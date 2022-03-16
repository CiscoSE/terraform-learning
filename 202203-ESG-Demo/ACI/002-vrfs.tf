resource "aci_vrf" "vrf1a" {
  name                   = local.vrf1_name
  tenant_dn              = aci_tenant.tenant1.id
  bd_enforced_enable     = "no"
  ip_data_plane_learning = "enabled"
}

