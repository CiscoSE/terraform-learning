resource "aci_application_epg" "t1epg1" {
  name                   = "epg1"
  application_profile_dn = aci_application_profile.t1a1.id
}

resource "aci_epg_to_domain" "t1epg1-dom" {
  application_epg_dn = aci_application_epg.t1epg1.id
  tdn                = var.vmm_domain_dn
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "accept"
  vmm_mac_changes       = "accept"
}

resource "aci_application_epg" "t2epg1" {
  name                   = "epg1"
  application_profile_dn = aci_application_profile.t1a1.id
}

resource "aci_epg_to_domain" "t2epg1-dom" {
  application_epg_dn = aci_application_epg.t2epg1.id
  tdn                = var.vmm_domain_dn
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "accept"
  vmm_mac_changes       = "accept"

}