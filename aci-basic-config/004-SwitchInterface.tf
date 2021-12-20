resource "aci_leaf_profile" "L101" {
  name        = "101"
  relation_infra_rs_acc_port_p = [aci_leaf_interface_profile.L101.id]
  leaf_selector {
    name                    = "101"
    switch_association_type = "range"
    node_block {
      name  = "blk1"
      from_ = "101"
      to_   = "101"
    }
  }
}

#Temporary Fix
resource "aci_rest" "leaf_profile_to_int_profile_association" {
  path       = "/api/mo/${aci_leaf_profile.L101.id}/rsaccPortP-[${aci_leaf_interface_profile.L101.id}].json"
  class_name = "infraRsAccPortP"
  content = {
    "annotation" : "orchestrator:terraform",
    "tDn": aci_leaf_interface_profile.L101.id
  }
}

resource "aci_leaf_interface_profile" "L101" {
    name        = "101"
}