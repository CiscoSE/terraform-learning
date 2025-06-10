# Specify the Cisco ACI provider
terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "2.16.0"
    }
  }
}


# Use the provider to assigne credentials. We use these for everything going forward.
provider "aci" {
  # This is the user name in ACI (usually a local users)
  username = var.apic_auth.user_name
  # The private key should be in a file on the same system referenced by path
  private_key = var.apic_auth.private_key
  # The cert name is the name assigned in ACI / Admin / AAA / Users / <User Name> / User Certificate
  cert_name = var.apic_auth.cert_name
  # The URL for ACI
  url      = "https://${var.apic_auth.apic}"
  insecure = true
}


# Takes a backup of the APIC. We do this here because we want it to happen before any other changes. 
#resource "aci_rest" "snapshot" {
#  path = "/api/mo/uni/fabric/configexp-terraform-${timestamp()}.json"
#  class_name = "configExportP"
#  content = {
#    snapshot = "yes"
#    adminSt = "triggered"
#  }
#}
