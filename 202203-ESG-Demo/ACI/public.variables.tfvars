

apic_auth = {
    apic = "192.168.1.1"  # IP or FQDN of APIC
    cert_name = "YourCertName" # This is the name of the certificate found within the APIC user configuration
    private_key = "/path/to/cert/terraform.key"
    user_name = "terraform" # The account used to access the APIC.
    }

vmm_domain_dn = "uni/vmmp-VMware/dom-YourVMMDomain" #This needs to be the DN of your VMWare VMM Domain
gateway1 = "172.16.55.1/29" # This subnet will be assigned to bridge domain
gateway2 = "172.16.56.1/29" # This subnet will be assigned to bridge domain
subnet1 = "172.16.55.0/29"
subnet2 = "172.16.56.0/29"
l3_out_dn  = "uni/tn-common/out-YourL3Out" # The DN of the L3 out that you want associated in the Bridge Domain
l3_out_name = "YourL3Out"
icmp_contract_name = "c-ESG-Demo-icmp"
icmp_filter_name = "f-Demo_icmp"
esg1_name = "test-esg1"
ssh_contract_name = "c_ESG-Demo-ssh"
ssh_filter_name = "f_ESG-Demo-ssh"
tenant1_name = "ESG-Demo"