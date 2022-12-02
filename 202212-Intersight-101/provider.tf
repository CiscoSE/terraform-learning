# This defines the preferred provider and where to find it
terraform {
  required_providers {
    intersight = {
      source   = "CiscoDevNet/intersight"
      version  = "1.0.32"
    }
  }
}

# This defines the authentication. Using a private tfvar file to keep keys out of github.
# Because friends don't let friends upload keys to github!

provider "intersight" {
  apikey    = var.connection.apikey
  secretkey = var.connection.secretkey
  endpoint  = var.connection.endpoint
}
