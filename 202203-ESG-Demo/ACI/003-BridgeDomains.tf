variable "bd1_name" {
    default = "ESG_Demo1"
}

variable "bd2_name" {
    default = "ESG_Demo2"
}


variable "gateway1" {
  default        = ""
  description = "This subnet is assigned to the bridge domain"
}

variable "gateway2" {
  default        = ""
  description = "This subnet is assigned to the bridge domain"
}

variable "subnet1"{
    default     = ""
}

variable "subnet2"{
    default     = ""
}

data "aci_l3_outside" l3_outside {
    tenant_dn = data.aci_tenant.tenant_common.id
    name = "AJ430-LabExt"
}

resource "aci_bridge_domain" "bd1" {
    name = var.bd1_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
    arp_flooding = "yes"
    l2_unknown_unicast_flooding = "flood"
    relation_to_l3_outsides = [
        {
            l3_outside_name = data.aci_l3_outside.l3_outside.name
        }
    ]
}

resource "aci_bridge_domain" "bd2" {
    name = var.bd2_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
    arp_flooding = "yes"
    l2_unknown_unicast_flooding = "flood"
    relation_to_l3_outsides = [
        {
            l3_outside_name = data.aci_l3_outside.l3_outside.name
        }
    ]
}

resource "aci_subnet" "subnet1" {
    parent_dn = aci_bridge_domain.bd1.id
    ip        = var.gateway1
    scope     = ["shared","public"]
}

resource "aci_subnet" "subnet2" {
    parent_dn = aci_bridge_domain.bd2.id
    ip        = var.gateway2
    scope     = ["shared","public"]
}
