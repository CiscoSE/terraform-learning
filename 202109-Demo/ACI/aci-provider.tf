# Specify the Cisco ACI provider
terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "0.7.0"
    }
  }
}

variable "apic" {
  default     = ""
  description = "IP or FQDN of the APIC"
}

variable "cert_name" {
  default     = ""
  description = "This is the name of the certificate as configured in the APIC GUI under the users AAA configuration"
}

variable "private_key" {
  default     = ""
  description = "The location of the private key file that maps to the above named certificate."
  /*
  It is really important that you understand the relationship between the private key and the certifiate name.
  The public key is copied into the AAA configuration for a user and is given a name. The private key
  must be accessible to terraform so that it can decrypt information received from the APIC, which is encrypted
  using the public key associated with the account.
  */
}

variable "user_name" {
  default     = ""
  description = "The user account used to log into the APIC"
}

variable "vmm_domain_dn" {
  default        = ""
  description = "The DN of your VMWare VMM Domain"
}

variable "subnet1" {
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
  username = var.user_name
  # The private key should be in a file on the same system referenced by path
  private_key = var.private_key
  # The cert name is the name assigned in ACI / Admin / AAA / Users / <User Name> / User Certificate
  cert_name = var.cert_name
  # The URL for ACI
  url      = "https://${var.apic}"
  insecure = true
}


locals {
  tenant_name = "Demo-Tenant"
  epg1_name   = "Demo-EPG1"
  epg2_name   = "Demo-EPG2"
  app1_name   = "Demo-APP1"
  vrf1_name   = "demo-VRF-unenforced"
  vrf2_name   = "demo-VRF-enforced"
  bd1_name     = "Demo-BD-75"
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
