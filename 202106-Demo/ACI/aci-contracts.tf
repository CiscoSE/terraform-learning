locals{
    stateful = "no"
}

resource "aci_contract" "ICMP" {
    tenant_dn = local.tenant_id
    name      = "Demo1-Demo2-outbound"
    scope     = "tenant"
    filter {
        filter_name = "allow_icmp"
        description = "Demo ICMP Filter"
        filter_entry {
            filter_entry_name = "icmp"
            ether_t     = "ip"
            prot     = "icmp"
            stateful = local.stateful
        }
    }
}
