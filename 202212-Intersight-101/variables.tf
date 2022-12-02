variable "connection" {
    type = object({
        apikey    = optional(string)
        endpoint  = optional(string)
        secretkey = optional(string)
    })
}

variable "domain" {
    type = object({
        tag_key1            = string
        tag_value1          = string
        ntp_policy_name     = string
        ntp1                = string
        time_zone           = string
        qos_policy_name     = string
        best_effort_qos_mtu = number
        org_name            = string
    })
}