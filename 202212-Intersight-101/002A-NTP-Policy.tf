resource "intersight_ntp_policy" "ntp1" {
  name    = var.domain.ntp_policy_name
  enabled = true
  ntp_servers = [var.domain.ntp1]
  timezone = var.domain.time_zone
  organization {
    moid   = data.intersight_organization_organization.org1.moid
    object_type = "organization.Organization"
  }
  tags {
    key   = var.domain.tag_key1
    value = var.domain.tag_value1
  }
}