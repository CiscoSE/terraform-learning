# Most of these need to be changed for this to work.
apic_auth = {
    apic = "someapic.in.your.environment.local"  # IP or FQDN of APIC
    cert_name = "Terraform" # This is the name of the certificate found within the APIC user configuration
    private_key = "/my/certs/terraform.key"
    user_name = "terraform" # The account used to access the APIC.
    }

vmm_domain_dn = "uni/vmmp-VMware/dom-SomeDomain" #This needs to be the DN of your VMWare VMM Domain
gateway1 = "10.0.0.1/29" # This subnet will be assigned to bridge domain
gateway2 = "10.0.0.9/29" # This subnet will be assigned to bridge domain
subnet1 = "10.0.0.0/29"
subnet2 = "10.0.0.8/29"
l3_out_dn  = "uni/tn-common/out-SomeL3Out" # The DN of the L3 out that you want associated in the Bridge Domain
l3_out_name = "SomeL3Out"
