
# These are for initial configuration, and we are not planning to use common anywhere else.data "
# This file contains common port configurations that may be useful as filters during initial configuration

  
# Creating an data reference to the existing tenant. Data references are not destroyed when a terraform destroy is applied.
data "aci_tenant" "common" {
    name = "common"
}

# SSH Filter allowing port 22 TCP
resource "aci_filter" "common_ssh" {
    name          = "ssh"
    tenant_dn     = data.aci_tenant.common.id   
}

resource "aci_filter_entry" "common_ssh" {
    name          = "ssh"
    filter_dn     = aci_filter.common_ssh.id
    apply_to_frag = "no"
    ether_t       = "ip"
    prot          = "tcp"
    d_from_port   = "22"
    d_to_port     = "22"
}

#Web Filter with port 80 and 443
resource "aci_filter" "common_web" {
    name          = "web"
    tenant_dn     = data.aci_tenant.common.id
}

resource "aci_filter_entry" "common_web_80" {
    name          = "http"
    filter_dn     = aci_filter.common_web.id
    apply_to_frag = "no"
    ether_t       = "ip"
    prot          = "tcp"
    d_from_port   = "80"
    d_to_port     = "80"
}
resource "aci_filter_entry" "common_web_443" {
    name          = "https"
    filter_dn     = aci_filter.common_web.id
    apply_to_frag = "no"
    ether_t       = "ip"
    prot          = "tcp"
    d_from_port   = "443"
    d_to_port     = "443"
}
