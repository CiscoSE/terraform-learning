# Most of these need to be changed for this to work.
apic_auth = {
    apic = "1.1.1.1"  # IP or FQDN of APIC
    cert_name = "Terraform" # This is the name of the certificate found within the APIC user configuration
    private_key = "./certificates/terraform.key"
    user_name = "terraform" # The account used to access the APIC.
    }

vmm_domain_dn = "uni/vmmp-VMware/dom-SomeVMMDomain" #This needs to be the DN of your VMWare VMM Domain
subnet1 = "172.16.75.1/24" # This subnet will be assigned to bridge domain
l3_out    = "uni/tn-common/out-SomeL3Out-LabExt" # The DN of the L3 out that you want associated in the Bridge Domain 

