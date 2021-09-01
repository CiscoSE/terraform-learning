resource "aci_vrf" "vrf1a" {
  name                   = "test-tenant1-u"
  tenant_dn              = aci_tenant.tenant1.id
  bd_enforced_enable     = "no"
  ip_data_plane_learning = "enabled"
}

resource "aci_vrf" "vrf1b" {
  name                   = "test-tenant1-e"
  tenant_dn              = aci_tenant.tenant1.id
  bd_enforced_enable     = "no"
  ip_data_plane_learning = "enabled"
}

resource "aci_vrf" "vrf2a" {
  name                   = "test-tenant2-u"
  tenant_dn              = aci_tenant.tenant2.id
  bd_enforced_enable     = "no"
  ip_data_plane_learning = "enabled"
}

resource "aci_vrf" "vrf2b" {
  name                   = "test-tenant2-e"
  tenant_dn              = aci_tenant.tenant2.id
  bd_enforced_enable     = "no"
  ip_data_plane_learning = "enabled"
}