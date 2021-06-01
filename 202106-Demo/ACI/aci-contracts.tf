locals{
    stateful = "no"
}

resource "aci_contract" "Demo1-Demo2-outbound" {
    tenant_dn = local.tenant_id
    name      = "Demo1-Demo2-outbound"
    scope     = "tenant"
    annotation  = "tag_contract"
    name_alias  = "alias_contract"
}

resource "aci_contract_subject" "Demo1-Demo2-outbound-subject"{
    contract_dn = "${aci_contract.Demo1-Demo2-outbound.id}"
    name        = "Demo_Subject"
    cons_match_t  = "AtleastOne"
    prov_match_t  = "AtleastOne"
    relation_vz_rs_subj_filt_att = ["${aci_filter.allow_icmp.id}"]
}
