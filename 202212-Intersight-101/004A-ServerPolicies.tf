##################################################################################
#                   Core policies for Server Configurations
##################################################################################


##################################################################################
# Boot order policy
##################################################################################
resource "intersight_boot_precision_policy" "boot_precision1" {
  name                     = "${var.domain.policy_prefix}-BootPolicy1"
  description              = "test policy"
  configured_boot_mode     = "Uefi"
  enforce_uefi_secure_boot = false
  tags                     = [var.tags]
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org1.id
  }
  boot_devices {
    enabled     = true
    name        = "scu-device-hdd"
    object_type = "boot.LocalDisk"
    additional_properties = jsonencode({
      Slot = "MRAID"
      Bootloader = {
        Description = ""
        Name        = ""
        ObjectType  = "boot.Bootloader"
        Path        = ""
      }
    })
  }
  boot_devices {
    enabled     = true
    name        = "CIMC-DVD"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "cimc-mapped-dvd"
    })
  }
  boot_devices {
    enabled     = true
    name        = "hdd"
    object_type = "boot.LocalDisk"
    additional_properties = jsonencode({
      Slot = "MRAID"
      Bootloader = {
        Description = ""
        Name        = ""
        ObjectType  = "boot.Bootloader"
        Path        = ""
      }
    })
  }
}


##################################################################################
# Power Policy
##################################################################################

resource "intersight_power_policy" "PowerPolicy1" {
  name = "${var.domain.policy_prefix}-PowerPolicy1"
  tags = [var.tags]
  organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.org1.id
  }
  power_restore_state = "LastState"
  power_priority      = "Low"
  power_profiling     = "Enabled"
  power_save_mode     = "Enabled"
}