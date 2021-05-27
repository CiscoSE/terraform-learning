resource "aci_bridge_domain" "Test1" {
  # Name of the Bridge Domain 
  name = "Test1" 
  # Tenant the Bridge Domain will be created in
  tenant_dn = "${aci_tenant.SamTestTerraform.id}"
  # Assignment of the VRF
  relation_fv_rs_ctx = aci_vrf.SamTest-Unenforced.id
}