resource "intersight_fabric_eth_network_policy" "fabric_vlans" {
  name = "${var.domain.org_name}-Fabric-VLANS"
  tags = [var.tags]
  organization {
    moid = data.intersight_organization_organization.org1.id
  }

  # This is a temporary workaround to the bug in intersight_fabric_switch_profile policy_bucket
  # we are attaching the profile to the policy here instead of attaching the policy to the profile in profile_ucs_domain.tf
  dynamic "profiles" {
    for_each = intersight_fabric_switch_profile.fabric_switch_profile1
    content {
      moid        = profiles.value.moid
      object_type = profiles.value.object_type
    }
  }
}

resource "intersight_fabric_multicast_policy" "default" {
  name = "${var.domain.org_name}-Multicast-Default"
  tags = [var.tags]
  organization {
    moid = data.intersight_organization_organization.org1.id
  }

  snooping_state = "Enabled"
  querier_state  = "Disabled"
}


resource "intersight_fabric_vlan" "vlans_infra" {
  for_each = var.uplink_VLANS

  name = each.key
  tags = [var.tags]


  auto_allow_on_uplinks = true
  is_native             = false
  vlan_id               = each.value.vlan

  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.fabric_vlans.moid
  }

  multicast_policy {
    moid = intersight_fabric_multicast_policy.default.moid
  }
}

