
###################################################################################
#
#                           Top Level Port Selector
# All interface selectors and port channels need to reference back to this point.
#
###################################################################################
resource "intersight_fabric_port_policy" "port_configuration" {
  name         = "${var.domain.org_name}-portPolicy"
  device_model = "UCS-FI-6454"
  organization {
    moid        = data.intersight_organization_organization.org1.id
    object_type = "organization.Organization"
  }
  dynamic "profiles" {
    for_each = intersight_fabric_switch_profile.fabric_switch_profile1
    content {
      moid        = profiles.value.moid
      object_type = profiles.value.object_type
    }
  }
  tags = [var.tags]
  depends_on = [data.intersight_organization_organization.org1]
}

###################################################################################
#
# Configure Server Ports
#
##################################################################################

resource "intersight_fabric_server_role" "fabric_serverPorts" {
  for_each = var.servers.server_ports

  aggregate_port_id = 0
  port_id           = each.value
  slot_id           = 1
  port_policy {
    moid = intersight_fabric_port_policy.port_configuration.moid
  }
  tags = [var.tags]
}

###################################################################################
#
# Configure Port Channels and Associated Interfaces
#
###################################################################################

# We need a new policy to associate with the port channel, and it needs to be linked
# to both the A and B switches

resource "intersight_fabric_uplink_pc_role" "ethernet_pc_uplink" {
  admin_speed = "Auto"
  pc_id       = 10

#  eth_network_group_policy {
#    moid = intersight_fabric_eth_network_group_policy.all.moid
#  }

#  flow_control_policy {
#    moid = intersight_fabric_flow_control_policy.llfc.moid
#  }

#  link_aggregation_policy {
#    moid = intersight_fabric_link_aggregation_policy.default.moid
#  }

#  link_control_policy {
#    moid = intersight_fabric_link_control_policy.default.moid
#  }

  port_policy {
    moid = intersight_fabric_port_policy.port_configuration.id
  }

  dynamic "ports" {
    for_each = var.uplinks.uplink_ports
    content {
      port_id = ports.value
      slot_id = 1
    }
  }
}