resource "intersight_ntp_policy" "ntp1" {
  name    = var.domain.ntp_policy_name
  enabled = true
  ntp_servers = [var.domain.ntp1]
  timezone = var.ntp_timezone.us_eastern
  dynamic "profiles" {
    for_each = intersight_fabric_switch_profile.fabric_switch_profile1
    content {
      moid        = profiles.value.moid
      object_type = profiles.value.object_type
    }
  }
  organization {
    moid   = data.intersight_organization_organization.org1.id
    object_type = "organization.Organization"
  }
  tags = [var.tags]
}