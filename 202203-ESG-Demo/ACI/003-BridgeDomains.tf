variable "bd1_name" {
    default = "ESG_Demo1"
}

variable "bd2_name" {
    default = "ESG_Demo2"
}


variable "subnet1" {
  default        = ""
  description = "This subnet is assigned to the bridge domain"
}

variable "subnet2" {
  default        = ""
  description = "This subnet is assigned to the bridge domain"
}

resource "aci_bridge_domain" "bd1" {
    name = var.bd1_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
    relation_fv_rs_bd_to_out = [var.l3_out_dn]
    arp_flood = "yes"
    unk_mac_ucast_act = "flood"
}

resource "aci_bridge_domain" "bd2" {
    name = var.bd2_name
    tenant_dn = aci_tenant.tenant1.id
    relation_fv_rs_ctx = aci_vrf.vrf1a.id
    relation_fv_rs_bd_to_out = [var.l3_out_dn]
    arp_flood = "yes"
    unk_mac_ucast_act = "flood"
}

resource "aci_subnet" "subnet1" {
    parent_dn = aci_bridge_domain.bd1.id
    ip        = var.subnet1
    scope     = ["shared","public"]
}

resource "aci_subnet" "subnet2" {
    parent_dn = aci_bridge_domain.bd2.id
    ip        = var.subnet2
    scope     = ["shared","public"]
}
