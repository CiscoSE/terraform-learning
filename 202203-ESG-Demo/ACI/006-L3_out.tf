
data "aci_external_network_instance_profile" "l3_1" {
  l3_outside_dn  = var.l3_out_dn
  name           = var.l3_out_name
}

resource "aci_epg_to_contract" "ssh_out" {
  application_epg_dn = data.aci_external_network_instance_profile.l3_1.id
  contract_dn        = aci_contract.ssh.id
  contract_type      = "consumer"
  annotation         = "terraform"
  match_t            = "AtleastOne"
  prio               = "unspecified"
}


resource "aci_epg_to_contract" "icmp_in" {
  application_epg_dn = data.aci_external_network_instance_profile.l3_1.id
  contract_dn        = aci_contract.icmp.id
  contract_type      = "provider"
  annotation         = "terraform"
  match_t            = "AtleastOne"
  prio               = "unspecified"
}