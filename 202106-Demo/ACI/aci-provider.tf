# Specify the Cisco ACI provider
terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "0.7.0"
    }
  }
}

locals {
  # Most of these need to be changed for this to work.
  apic = "10.82.6.193"  # IP or FQDN of APIC
  cert_name = "Terraform" # This is the name of the certificate found within the APIC user configuration
  private_key = "./certificates/terraform.key"
  user_name = "terraform" # The account used to access the APIC.
  vmm_domain_dn = "uni/vmmp-VMware/dom-AJ430_APIC" #This needs to be the DN of your VMWare VMM Domain
  subnet1 = "172.16.75.1/24" # This subnet will be assigned to bridge domain
  l3_out    = "uni/tn-common/out-AJ430-LabExt" # The DN of the L3 out that you want associated in the Bridge Domain 

  #The following should not need to be changed to make this work
  tenant_name = "Demo-Tenant"
  epg1_name   = "Demo-EPG1"
  epg2_name   = "Demo-EPG2"
  app1_name   = "Demo-APP1"
  vrf1_name   = "demo-VRF-unenforced"
  vrf2_name   = "demo-VRF-enforced"
  bd1_name     = "Demo-BD-75"
}

# Use the provider to assigne credentials. We use these for everything going forward.
provider "aci" {
  # This is the user name in ACI (usually a local users)
  username = local.user_name
  # The private key should be in a file on the same system referenced by path
  private_key = local.private_key
  # The cert name is the name assigned in ACI / Admin / AAA / Users / <User Name> / User Certificate 
  cert_name = local.cert_name
  # The URL for ACI
  url      = "https://${local.apic}"
  insecure = true
}

# Takes a backup of the APIC. We do this here because we want it to happen before any other changes. 
resource "aci_rest" "snapshot" {
  path = "/api/mo/uni/fabric/configexp-terraform-${timestamp()}.json"
  class_name = "configExportP"
  content = {
    snapshot = "yes"
    adminSt = "triggered"
  }
}