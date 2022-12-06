# If you do not specify all of the policies, it will complicate reapplying the policy later. Recommend you
# determine the preferred configuration for each policy or accept these defaults.
resource "intersight_fabric_system_qos_policy" "Fabric_System_QOS" {
    name = "${var.domain.policy_prefix}-QOS"
    classes  {
        admin_state     = "Enabled"
        name            = "Best Effort" 
        cos             = "255"
        mtu             = var.domain.best_effort_qos_mtu
        class_id        = "fabric.QosClass"
        object_type     = "fabric.QosClass"
    }
    # In this example we disable all other policies but the FC policy, which cannot be disabled
    # Since we are setting QOS MTU to 9216 for best effort, we would only need QOS if we want to control traffic drop.
    classes  {
        admin_state     = "Disabled"
        name            = "Gold" 
        cos             = "4"
        mtu             = "9216"
        class_id        = "fabric.QosClass"
        object_type     = "fabric.QosClass"
    }
    classes  {
        admin_state     = "Disabled"
        name            = "Platinum" 
        cos             = "5"
        mtu             = "9216"
        class_id        = "fabric.QosClass"
        object_type     = "fabric.QosClass"
    }
    classes  {
        admin_state     = "Enabled"
        bandwidth_percent = "100"
        name            = "FC" 
        cos             = "3"
        mtu             = "2240"    # Should be the default for FC traffic. Make sure you want to change this before you touch this one.
        class_id        = "fabric.QosClass"
        object_type     = "fabric.QosClass"
        packet_drop     = "false"
    }
    classes  {
        admin_state     = "Disabled"
        name            = "Bronze" 
        cos             = "2"
        mtu             = "9216"
        class_id        = "fabric.QosClass"
        object_type     = "fabric.QosClass"
    }
    classes  {
        admin_state     = "Disabled"
        name            = "Silver" 
        cos             = "1"
        mtu             = "9216"
        class_id        = "fabric.QosClass"
        object_type     = "fabric.QosClass"
    }
    dynamic "profiles" {
        for_each = intersight_fabric_switch_profile.fabric_switch_profile1
        content {
            moid        = profiles.value.moid
            object_type = profiles.value.object_type
        }
    }
    organization {
        moid        = data.intersight_organization_organization.org1.id
        object_type = "organization.Organization"
    }
    tags = [var.tags]
}