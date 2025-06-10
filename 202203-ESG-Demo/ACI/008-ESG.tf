# In most cases you are going to change this in your tfvars, but I provide a default just to make it simple
variable "esg1_name" {
    default     = "demo_esg1"
}

resource "aci_endpoint_security_group" "esg1"{
    application_profile_dn = aci_application_profile.app1.id
    name = var.esg1_name
    relation_fv_rs_scope = aci_vrf.vrf1a.id
    relation_fv_rs_cons {
      prio = "unspecified"
      target_dn = aci_contract.icmp.id
    }
    relation_fv_rs_prov{
        prio = "unspecified"
        target_dn = aci_contract.ssh.id
        match_t = "AtleastOne"
    }
}

resource "aci_endpoint_security_group_tag_selector" "esg1_selector1"{
  endpoint_security_group_dn = aci_endpoint_security_group.esg1.id
  match_key = "esg"
  match_value = "esg1"
  value_operator = "equals"
}

# Removed because I need to fix this. Change in implementation since this was written.

#resource "aci_rest_managed" "leakSubnet1" {
#  dn         = "${aci_vrf.vrf1a.id}/leakroutes/leakintsubnet-[${var.subnet1}]"
#  class_name = "leakInternalSubnet"
#  content = {
#    ip    = var.subnet1
#    scope = "public"
#  }
#}



# Keeping this in here because it might be useful to someone who wants to leak by EPG instead of TAG.
#resource "aci_endpoint_security_group_epg_selector" "esg1_epg_select1" {
#  endpoint_security_group_dn = aci_endpoint_security_group.esg1.id
#  match_epg_dn = aci_application_epg.epg1.id
#}