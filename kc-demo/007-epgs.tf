resource "aci_application_epg" "t1epg1" {
  name                   = local.epg1_name
  application_profile_dn = aci_application_profile.t1a1.id
  relation_fv_rs_bd = aci_bridge_domain.tn1bd1.id
}

resource "aci_epg_to_domain" "t1epg1-dom" {
  application_epg_dn = aci_application_epg.t1epg1.id
  tdn                = aci_physical_domain.labsystems_physical_dom.id
}

resource "aci_epg_to_static_path" "t1epg1_interface1"{
  application_epg_dn = aci_application_epg.t1epg1.id
  mode = "untagged"
  tdn  = "topology/pod-1/paths-102/pathep-[eth1/49]"
  encap = "vlan-${local.vlan_number1}"
  instr_imedcy = "immediate"
}

resource "aci_application_epg" "t1epg2" {
  name                   = local.epg2_name
  application_profile_dn = aci_application_profile.t1a1.id
  relation_fv_rs_bd = aci_bridge_domain.tn1bd2.id
}

resource "aci_epg_to_domain" "t1epg2-dom" {
  application_epg_dn = aci_application_epg.t1epg2.id
  tdn                = aci_physical_domain.labsystems_physical_dom.id
}

resource "aci_epg_to_static_path" "t1epg2_interface1"{
  application_epg_dn = aci_application_epg.t1epg2.id
  mode = "regular"
  tdn  = "topology/pod-1/paths-103/pathep-[eth1/49]"
  encap = "vlan-${local.vlan_number2}"
  instr_imedcy = "immediate"
}