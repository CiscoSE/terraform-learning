
resource "aci_filter" "allow_web" {
    tenant_dn = "${local.tenant_id}"
    name      ="allow_web"
}

resource "aci_filter_entry" "http" {
    name        = "http"
    filter_dn   = "${aci_filter.allow_web.id}"
    ether_t     = "ipv4"
    prot        = "tcp"
    d_from_port = "80"
    d_to_port   = "80"
    stateful = local.stateful
}

resource "aci_filter_entry" "https" {
    name        = "https"
    filter_dn   = "${aci_filter.allow_web.id}"
    ether_t     = "ipv4"
    prot        = "tcp"
    d_from_port = "443"
    d_to_port   = "443"
    stateful = local.stateful
}

resource "aci_filter" "allow_iperf"{
    name       = "allow_iperf"
    tenant_dn  = "${local.tenant_id}"
}

resource "aci_filter_entry" "iperf" {
    name        = "iperf"
    filter_dn   = "${aci_filter.allow_iperf.id}"
    ether_t     = "ipv4"
    prot        = "tcp"
    d_from_port = "5201"
    d_to_port   = "5201"
    stateful    = local.stateful
}

resource "aci_filter" "allow_icmp" {
    name        = "allow_icmp"
    tenant_dn   = "${local.tenant_id}"
}

resource "aci_filter_entry" "icmp" {
    name        = "icmp"
    filter_dn   = "${aci_filter.allow_icmp.id}"
    ether_t     = "ip"
    prot        = "icmp"
    stateful    = local.stateful
}