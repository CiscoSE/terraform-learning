
locals {
  CDP_enable_name     = "CDP-Enable"
  CDP_disable_name    = "CDP-Disable"
  LLDP_enable_name    = "LLDP-Enable"
  LLDP_disable_name   = "LLDP-disable"
  LACP_active_name    = "LACP-Active"
  LACP_active_ns_name = "LACP-Active-No-Suspend" 
  LACP_on_name        = "LACP-On"
  LACP_mac_pinning_name = "Mac Pinning"
}

resource "aci_cdp_interface_policy" "CDP_enable" {
  name        = local.CDP_enable_name
  admin_st    = "enabled"
  description = "Enables CDP on an Interface when applied to an interface group"
}

resource "aci_cdp_interface_policy" "CDP_disable" {
  name        = local.CDP_disable_name
  admin_st    = "disabled"
  description = "Disables CDP on an Interface when applied to an interface group"
}

resource "aci_lldp_interface_policy" "LLDP_enable" {
  name        = local.LLDP_enable_name
  admin_rx_st = "enabled"
  admin_tx_st = "enabled"
  description = "Enables LLDP on an Interface when applied to an interface group"
}

resource "aci_lldp_interface_policy" "LLDP_disable" {
  name        = local.LLDP_disable_name
  admin_rx_st = "disabled"
  admin_tx_st = "disabled"
  description = "Disables LLDP on an Interface when applied to an interface group"
}

resource "aci_lacp_policy" "LACP_active" {
  name        = local.LACP_active_name
  ctrl        = ["susp-individual", "load-defer", "graceful-conv"]
  max_links   = "16"
  min_links   = "1"
  mode        = "active"
}

resource "aci_lacp_policy" "LACP_active_ns" {
  name        = local.LACP_active_ns_name
  ctrl        = ["load-defer", "graceful-conv"]
  max_links   = "16"
  min_links   = "1"
  mode        = "active"
}

resource "aci_lacp_policy" "Port_Channel_on" {
  name        = local.LACP_on_name
  ctrl        = ["load-defer", "graceful-conv"]
  max_links   = "16"
  min_links   = "1"
  mode        = "off"
}

resource "aci_lacp_policy" "Mac_Pinning" {
  name        = local.LACP_mac_pinning_name
  ctrl        = []
  max_links   = "16"
  min_links   = "1"
  mode        = "mac-pin"
}
