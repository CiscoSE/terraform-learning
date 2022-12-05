resource "intersight_fabric_port_policy" "fabric_port_policy1" {
  name         = "${var.domain.org_name}-portPolicy"
  device_model = "UCS-FI-6454"
  organization {
    moid        = data.intersight_organization_organization.org1.id
    object_type = "organization.Organization"
  }
  tags {
    key   = var.domain.tag_key1
    value = var.domain.tag_value1
  }
  depends_on = [data.intersight_organization_organization.org1]
}

resource "intersight_fabric_server_role" "fabric_server_role1" {
  for_each = var.servers.server_ports

  aggregate_port_id = 0
  port_id           = each.value
  slot_id           = 1
  port_policy {
    moid = intersight_fabric_port_policy.fabric_port_policy1.moid
  }
  tags {
    key   = var.domain.tag_key1
    value = var.domain.tag_value1
  }  
}