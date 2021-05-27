# Create a uneforced VRF
resource "aci_vrf" "SamTest-Unenforced" {
  # The DN where the VRF will be created
  tenant_dn = "${aci_tenant.SamTestTerraform.id}"
  # Name of the VRF
  name = "SamTestTerraform-Unenforced"
  # When unenforced, contracts are not required between EPGs associated with this VRFs. You still need contracts for EPGs associated with other VRFs in order to leak routes. 
  pc_enf_pref = "unenforced"
}

#Create an enforced VRF
resource "aci_vrf" "SamTest-Enforced" {
  # The DN where the VRF will be created
  tenant_dn = "${aci_tenant.SamTestTerraform.id}"
  # Name of the VRF
  name = "SamTest-Unenforced"
  # Enforced VRFs require contracts for all EPG to EPG communication.
  pc_enf_pref = "enforced"
}