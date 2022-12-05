resource "intersight_fabric_switch_cluster_profile" "fabric_switch_cluster_profile1" {
  name        = "${var.domain.org_name}_UCS_Domain_profile"
  type        = "instance"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org1.id
  }
}

resource "intersight_fabric_switch_profile" "fabric_switch_profile1" {
  for_each    = toset(["A", "B"])
  
  name        = "${var.domain.org_name}_switch_profile${each.key}"
  type        = "instance"
  
  switch_cluster_profile {
    moid        = intersight_fabric_switch_cluster_profile.fabric_switch_cluster_profile1.moid
    object_type = "fabric.SwitchClusterProfile"
  }
}