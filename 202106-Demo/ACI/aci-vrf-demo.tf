locals{
  tenant_id = "${aci_tenant.tenant1.id}"
}

# Create a uneforced VRF
resource "aci_vrf" "vrf1" {
  # The DN where the VRF will be created
  tenant_dn = local.tenant_id
  # Name of the VRF
  name = "${local.vrf1_name}"
  # When unenforced, contracts are not required between EPGs associated with this VRFs. You still need contracts for EPGs associated with other VRFs in order to leak routes. 
  pc_enf_pref = "unenforced"
}

#Create an enforced VRF
resource "aci_vrf" "vrf2" {
  # The DN where the VRF will be created
  tenant_dn = local.tenant_id
  # Name of the VRF
  name = "${local.vrf2_name}"
  # Enforced VRFs require contracts for all EPG to EPG communication.
  pc_enf_pref = "enforced"
}