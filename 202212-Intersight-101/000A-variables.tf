variable "connection" {
    type = object({
        apikey    = optional(string)
        endpoint  = optional(string)
        secretkey = optional(string)
    })
}

variable "domain" {
    type = object({
        ntp_policy_name     = string
        ntp1                = string
        qos_policy_name     = string
        best_effort_qos_mtu = number
        org_name            = string
    })
}
variable "servers" {
    type = object({
        server_ports = set(string)
    })
}

variable "uplinks" {
    type = object({
        uplink_ports = set(string)
    })
}

variable "uplink_VLANS" {
  type = map(object({
    vlan = optional(number)
    qos  = optional(string)
  }))
}

variable "tags" {
    type = object ({
        additional_properties = string
        key = string
        value = string
    })
}

variable "ntp_timezone" {
  type = map(string)
  default = {
    us_eastern  = "America/New_York"
    us_central  = "America/Chicago"
    us_mountain = "America/Denver"
    us_pacific  = "America/Los_Angeles"
  }
}

