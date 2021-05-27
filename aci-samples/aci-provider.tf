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
  apic = "YourAPIC_IP_or_FQDN_GoesHere"  # IP or FQDN of APIC
  cert_name = "Terraform" # This is the name of the certificate found within the APIC user configuration
  private_key = "./certificates/terraform.key"
  user_name = "terraform" # The account used to access the APIC.
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

resource "aci_rest" "snapshot" {
  path = "/api/mo/uni/fabric/configexp-${timestamp()}.json"
  class_name = "configExportP"
  content = {
    snapshot = "yes"
    adminSt = "triggered"
  }
}