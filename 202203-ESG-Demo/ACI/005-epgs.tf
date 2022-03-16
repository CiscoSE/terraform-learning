resource "aci_application_epg" "epg1" {
  name                   = local.epg1_name
  application_profile_dn = aci_application_profile.app1.id
}

resource "aci_epg_to_domain" "epg1-dom" {
  application_epg_dn = aci_application_epg.epg1.id
  tdn                = var.vmm_domain_dn
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "accept"
  vmm_mac_changes       = "accept"
}

resource "aci_application_epg" "epg2" {
  name                   = local.epg2_name
  application_profile_dn = aci_application_profile.app1.id
}

resource "aci_epg_to_domain" "epg2-dom" {
  application_epg_dn = aci_application_epg.epg2.id
  tdn                = var.vmm_domain_dn
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "accept"
  vmm_mac_changes       = "accept"

}
