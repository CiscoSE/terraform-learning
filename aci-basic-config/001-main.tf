/*
This file contains the provider and global properties necessary for APIC connections.

Where variables are defined and are assign no default values, the assumption is that 
those variables will be configured with customer specific settings.

These are most commonly set in a .tfvars file. 
*/

# Specify the Cisco ACI provider
terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "1.2.0"
    }
  }
}

#######################################
#  Variables declared here are usually
#  assinged in a tfvars file
#######################################


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
