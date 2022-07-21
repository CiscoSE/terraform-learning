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

variable "l3_out_dn" {
  default        = ""
  description = "The DN of the L3 out that you want to associate with the Bridge Domain"
}

variable "l3_out_name" {
  default       = ""
  description   = "The existing L3 out we will associate with."
}




