locals {
  vmm_domain_dn = "uni/vmmp-VMware/dom-AJ430_APIC"

}
resource "aci_application_epg" "demo_epg1" {
  application_profile_dn    = "${aci_application_profile.Test-App.id}"
  relation_fv_rs_bd         = "${aci_bridge_domain.Demo-BD-75.id}"
  name                      = "demo_epg1"
  annotation                = "tag_epg"
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

resource "aci_epg_to_domain" "demo_epg1_domain" {
  application_epg_dn    = "${aci_application_epg.demo_epg1.id}"
  tdn                   = "${local.vmm_domain_dn}"
  instr_imedcy          = "immediate"
  res_imedcy            = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "reject"
  vmm_mac_changes       = "accept"
}
resource "aci_application_epg" "demo_epg2" {
  application_profile_dn    = "${aci_application_profile.Test-App.id}"
  relation_fv_rs_bd         = "${aci_bridge_domain.Demo-BD-75.id}"
  name                      = "demo_epg2"
  annotation                = "tag_epg"
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

resource "aci_epg_to_domain" "demo_epg2_domain" {
  application_epg_dn    = "${aci_application_epg.demo_epg2.id}"
  tdn                   = "${local.vmm_domain_dn}"
  instr_imedcy          = "immediate"
  res_imedcy            = "immediate"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "reject"
  vmm_mac_changes       = "accept"
}