# Specify the Cisco ACI provider
terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "2.1.0"
    }
  }
}

variable apic_auth {
  type = object ({
      apic        = string
      cert_name   = string
      private_key = string
      user_name   = string
    })
}

variable "vmm_domain_dn" {
  default        = ""
  description = "The DN of your VMWare VMM Domain"
}

variable "subnet1" {
  default        = ""
  description = "This subnet is assigned to the bridge domain"
}

variable "subnet2" {
  default        = ""
  description = "This subnet is assigned to the bridge domain"
}

variable "l3_out" {
  default        = ""
  description = "The DN of the L3 out that you want to associate with the Bridge Domain"
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


locals {
  tenant1_name = "Sam-ESG-Demo-Tenant"
  epg1_name   = "EPG1"  # Used for all isolated systems
  epg2_name   = "EPG2"  # Used as a community EPG 
  app1_name   = "APP1"
  vrf1_name   = "SAM-ESG-Demo"
  bd1_name     = "ESG-Demo"
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
