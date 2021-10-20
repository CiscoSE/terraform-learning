resource "aci_attachable_access_entity_profile" "AEP" {
  name = local.AEP
  relation_infra_rs_dom_p = [aci_physical_domain.labsystems_physical_dom.id]

}
resource "aci_leaf_access_port_policy_group" "access_policy_Group_1" {
    name = local.access_policy_group1
    relation_infra_rs_att_ent_p = aci_attachable_access_entity_profile.AEP.id
    relation_infra_rs_lldp_if_pol = data.aci_lldp_interface_policy.lldp_enabled.id
}

resource "aci_access_port_selector" "kc-demo1" {
    leaf_interface_profile_dn = data.aci_leaf_interface_profile.L103.id
    name = "kc-demo"
    access_port_selector_type = "range"
    relation_infra_rs_acc_base_grp = aci_leaf_access_port_policy_group.access_policy_Group_1.id
}

resource "aci_access_port_block" "kc-demo1" {
    name = "port1"
    access_port_selector_dn = aci_access_port_selector.kc-demo1.id
    from_card = "1"
    to_card = "1"
    from_port = "49"
    to_port = "49"
}

resource "aci_access_port_selector" "kc-demo2" {
    leaf_interface_profile_dn = data.aci_leaf_interface_profile.L102.id
    name = "kc-demo"
    access_port_selector_type = "range"
    relation_infra_rs_acc_base_grp = aci_leaf_access_port_policy_group.access_policy_Group_1.id
}

resource "aci_access_port_block" "kc-demo2" {
    name = "port1"
    access_port_selector_dn = aci_access_port_selector.kc-demo2.id
    from_card = "1"
    to_card = "1"
    from_port = "49"
    to_port = "49"
}