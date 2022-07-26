# In many cases you are going to change these in TFVARS before you run this, but I try to provide some relatively safe options

# These filters will be used within the below created contracts to allow traffic in and out the L3 out.
variable "icmp_filter_name" {
  default       = "f_demo_icmp"
  description   = "Filter we use to allow ICMP traffic in the demo"
}

variable "ssh_filter_name" {
  default       = "f_demo_ssh"
  description   = "Filter we use to allow ssh traffic in the demo"
}

# These contracts use the above filters to white list traffic in the fabric. 
variable "icmp_contract_name" {
  default       = "c_demo_icmp"
  description   = "Contract we use to allow ICMP traffic in the demo"
}

variable "ssh_contract_name" {
  default       = "c_demo_ssh"
  description   = "Contract we use to allow ssh traffic in the demo"
}

############### Start SSH Contact and filter ############
resource "aci_contract" "ssh" {
    tenant_dn = data.aci_tenant.l3out_tenant.id
    name = var.ssh_contract_name
    scope = "global"
}

resource "aci_contract_subject" "ssh_subj" {
    contract_dn = aci_contract.ssh.id
    name = var.ssh_contract_name
    apply_both_directions = "yes"
    rev_flt_ports = "yes"
}

resource "aci_contract_subject_filter" "ssh_subj_filter" {
    contract_subject_dn = aci_contract_subject.ssh_subj.id
    filter_dn = aci_filter.ssh.id

}

resource "aci_filter" "ssh" {
    tenant_dn = data.aci_tenant.l3out_tenant.id
    name = var.ssh_filter_name
}

resource "aci_filter_entry" "ssh_e1" {
    filter_dn   = aci_filter.ssh.id
    name        = "ssh"
    d_from_port = 22
    d_to_port   = 22
    ether_t     = "ip"
    prot        = "tcp"
}

############### Start ICMP Contact and filter ############
resource "aci_contract" "icmp" {
    tenant_dn = data.aci_tenant.l3out_tenant.id
    name = var.icmp_contract_name
    scope = "global"
}

resource "aci_contract_subject" "icmp_subj" {
    contract_dn = aci_contract.icmp.id
    name = var.icmp_contract_name
    apply_both_directions = "yes"
    rev_flt_ports = "yes"
}

resource "aci_contract_subject_filter" "icmp_subj_filter" {
    contract_subject_dn = aci_contract_subject.icmp_subj.id
    filter_dn = aci_filter.icmp.id
}

resource "aci_filter" "icmp" {
    tenant_dn = data.aci_tenant.l3out_tenant.id
    name = var.icmp_filter_name
}

resource "aci_filter_entry" "icmp_e1" {
    filter_dn   = aci_filter.icmp.id
    name        = "icmp"
    ether_t     = "ip"
    prot        = "icmp"
}