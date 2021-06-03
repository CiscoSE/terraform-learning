
resource "aci_application_epg" "epg1" {
  application_profile_dn    = "${aci_application_profile.app1.id}"
  relation_fv_rs_bd         = "${aci_bridge_domain.bridgedomain1.id}"
  name                      = "${local.epg1_name}"
  exception_tag             = "0"
  flood_on_encap            = "disabled"
  fwd_ctrl                  = "none"
  has_mcast_source          = "no"
  is_attr_based_epg         = "no"
  match_t                   = "AtleastOne"
  pc_enf_pref               = "unenforced"
  pref_gr_memb              = "exclude"
  prio                      = "unspecified"
  shutdown                  = "no"
}

resource "aci_epg_to_domain" "epg1_domain" {
  application_epg_dn    = "${aci_application_epg.epg1.id}"
  tdn                   = "${local.vmm_domain_dn}"
  instr_imedcy          = "immediate"
  res_imedcy            = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "reject"
  vmm_mac_changes       = "accept"
}
resource "aci_application_epg" "epg2" {
  application_profile_dn    = "${aci_application_profile.app1.id}"
  relation_fv_rs_bd         = "${aci_bridge_domain.bridgedomain1.id}"
  name                      = "${local.epg2_name}"
  exception_tag             = "0"
  flood_on_encap            = "disabled"
  fwd_ctrl                  = "none"
  has_mcast_source          = "no"
  is_attr_based_epg         = "no"
  match_t                   = "AtleastOne"
  pc_enf_pref               = "unenforced"
  pref_gr_memb              = "exclude"
  prio                      = "unspecified"
  shutdown                  = "no"
}

resource "aci_epg_to_domain" "epg2_domain" {
  application_epg_dn    = "${aci_application_epg.epg2.id}"
  tdn                   = "${local.vmm_domain_dn}"
  instr_imedcy          = "immediate"
  res_imedcy            = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "reject"
  vmm_mac_changes       = "accept"
}

