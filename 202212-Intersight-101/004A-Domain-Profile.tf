resource "intersight_fabric_switch_cluster_profile" "fabric_switch_cluster_profile1" {
  name        = "${var.domain.org_name}_cluster_profile"
  type        = "instance"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org1.id
  }
}

resource "intersight_fabric_switch_profile" "fabric_switch_profile1" {
  name        = "${var.domain.org_name}_switch_profile"
  type        = "instance"
  action      = "No-op"
  #policy_bucket { # System QoS Policy
  #  moid        = intersight_fabric_system_qos_policy.Fabric_System_QOS.moid
  #  object_type = intersight_fabric_system_qos_policy.Fabric_System_QOS.object_type
  #}
  switch_cluster_profile {
    moid        = intersight_fabric_switch_cluster_profile.fabric_switch_cluster_profile1.moid
    object_type = "fabric.SwitchClusterProfile"
  }
  depends_on = [
    intersight_fabric_switch_cluster_profile.fabric_switch_cluster_profile1
  ]
}