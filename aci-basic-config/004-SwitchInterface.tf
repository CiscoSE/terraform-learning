####################
# Leaf 102
####################

# Defines the switch to use default settings for the Leaf
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

# Temporary Fix - See issue 738 addressing bug with relation_infra_rs_acc_port_p
# https://github.com/CiscoDevNet/terraform-provider-aci/issues/738
resource "aci_rest" "L101" {
  path       = "/api/mo/${aci_leaf_profile.L101.id}/rsaccPortP-[${aci_leaf_interface_profile.L101.id}].json"
  class_name = "infraRsAccPortP"
  content = {
    "annotation" : "orchestrator:terraform",
    "tDn": aci_leaf_interface_profile.L101.id
  }
}

# Creates where leaf interfaces selectors will be build. Above fix maps aci_leaf_profile 
# to aci_leaf_interface_profile until fixes the relation_infra_rs_acc_port_p
resource "aci_leaf_interface_profile" "L101" {
    name        = "101"
}

####################
# Leaf 102
####################

# Defines the switch to use default settings for the Leaf
resource "aci_leaf_profile" "L102" {
  name        = "102"
  relation_infra_rs_acc_port_p = [aci_leaf_interface_profile.L102.id]
  leaf_selector {
    name                    = "102"
    switch_association_type = "range"
    node_block {
      name  = "blk1"
      from_ = "102"
      to_   = "102"
    }
  }
}

# Temporary Fix - See issue 738 addressing bug with relation_infra_rs_acc_port_p
# https://github.com/CiscoDevNet/terraform-provider-aci/issues/738
resource "aci_rest" "L102" {
  path       = "/api/mo/${aci_leaf_profile.L102.id}/rsaccPortP-[${aci_leaf_interface_profile.L102.id}].json"
  class_name = "infraRsAccPortP"
  content = {
    "annotation" : "orchestrator:terraform",
    "tDn": aci_leaf_interface_profile.L102.id
  }
}

# Creates the Switch Interface Selector profile. Above fix maps aci_leaf_profile 
# to aci_leaf_interface_profile until the relation_infra_rs_acc_port_p is fixed.
resource "aci_leaf_interface_profile" "L102" {
    name        = "102"
}

####################
# Leaf 101-102 VPC
####################

# Defines the switch to use default settings for the Leaf
resource "aci_leaf_profile" "L101-L102" {
  name        = "101-102"
  relation_infra_rs_acc_port_p = [aci_leaf_interface_profile.L101-L102.id]
  leaf_selector {
    name                    = "101-102"
    switch_association_type = "range"
    node_block {
      name  = "101-102"
      from_ = "101"
      to_   = "102"
    }
  }
}

# Temporary Fix - See issue 738 addressing bug with relation_infra_rs_acc_port_p
# https://github.com/CiscoDevNet/terraform-provider-aci/issues/738
resource "aci_rest" "L101-L102" {
  path       = "/api/mo/${aci_leaf_profile.L101-L102.id}/rsaccPortP-[${aci_leaf_interface_profile.L101-L102.id}].json"
  class_name = "infraRsAccPortP"
  content = {
    "annotation" : "orchestrator:terraform",
    "tDn": aci_leaf_interface_profile.L101-L102.id
  }
}

# Creates the Switch Interface Selector profile. Above fix maps aci_leaf_profile 
# to aci_leaf_interface_profile until the relation_infra_rs_acc_port_p is fixed.
resource "aci_leaf_interface_profile" "L101-L102" {
    name        = "101-102"
}

# This actually forms the VPC.
resource "aci_vpc_explicit_protection_group" "L101-L102" {
  name                              = "101-102"
  annotation                        = "101-102"
  switch1                           = "101"
  switch2                           = "102"
  vpc_explicit_protection_group_id  = "1"
}

####################
# Leaf 201
####################

# Defines the switch to use default settings for the Leaf
resource "aci_leaf_profile" "L201" {
  name        = "201"
  relation_infra_rs_acc_port_p = [aci_leaf_interface_profile.L201.id]
  leaf_selector {
    name                    = "201"
    switch_association_type = "range"
    node_block {
      name  = "blk1"
      from_ = "201"
      to_   = "201"
    }
  }
}

# Temporary Fix - See issue 738 addressing bug with relation_infra_rs_acc_port_p
# https://github.com/CiscoDevNet/terraform-provider-aci/issues/738
resource "aci_rest" "L201" {
  path       = "/api/mo/${aci_leaf_profile.L201.id}/rsaccPortP-[${aci_leaf_interface_profile.L201.id}].json"
  class_name = "infraRsAccPortP"
  content = {
    "annotation" : "orchestrator:terraform",
    "tDn": aci_leaf_interface_profile.L201.id
  }
}

# Creates where leaf interfaces selectors will be build. Above fix maps aci_leaf_profile 
# to aci_leaf_interface_profile until fixes the relation_infra_rs_acc_port_p
resource "aci_leaf_interface_profile" "L201" {
    name        = "201"
}

####################
# Leaf 202
####################

# Defines the switch to use default settings for the Leaf
resource "aci_leaf_profile" "L202" {
  name        = "202"
  relation_infra_rs_acc_port_p = [aci_leaf_interface_profile.L202.id]
  leaf_selector {
    name                    = "202"
    switch_association_type = "range"
    node_block {
      name  = "blk1"
      from_ = "202"
      to_   = "202"
    }
  }
}

# Temporary Fix - See issue 738 addressing bug with relation_infra_rs_acc_port_p
# https://github.com/CiscoDevNet/terraform-provider-aci/issues/738
resource "aci_rest" "L202" {
  path       = "/api/mo/${aci_leaf_profile.L202.id}/rsaccPortP-[${aci_leaf_interface_profile.L202.id}].json"
  class_name = "infraRsAccPortP"
  content = {
    "annotation" : "orchestrator:terraform",
    "tDn": aci_leaf_interface_profile.L202.id
  }
}

# Creates where leaf interfaces selectors will be build. Above fix maps aci_leaf_profile 
# to aci_leaf_interface_profile until fixes the relation_infra_rs_acc_port_p
resource "aci_leaf_interface_profile" "L202" {
    name        = "202"
}