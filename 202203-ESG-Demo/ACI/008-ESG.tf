# In most cases you are going to change this in your tfvars, but I provide a default just to make it simple
variable "esg1_name" {
    default     = "demo_esg1"
}

resource "aci_endpoint_security_group" "esg1"{
    application_profile_dn = aci_application_profile.app1.id
    name = var.esg1_name
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
