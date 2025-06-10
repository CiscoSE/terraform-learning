###################################################
# EPG 1
###################################################

variable "epg1_name" {
  default = "demo-epg1"
}

variable "epg2_name" {
  default = "demo-epg2"
}


resource "aci_application_epg" "epg1" {
  name                   = var.epg1_name
  relation_fv_rs_bd = aci_bridge_domain.bd1.id
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

###################################################
# EPG 2
###################################################

resource "aci_application_epg" "epg2" {
  name                   = var.epg2_name
  relation_fv_rs_bd = aci_bridge_domain.bd2.id
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
