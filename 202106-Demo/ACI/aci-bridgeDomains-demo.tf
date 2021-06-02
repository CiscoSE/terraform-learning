
#Create the Bridge domain using the unenforced VRF
resource "aci_bridge_domain" "Demo-BD-75" {
  # Name of the Bridge Domain 
  name                     = "Demo-BD-75" 
  # Tenant the Bridge Domain will be created in
  tenant_dn                = local.tenant_id
  # Assignment of the VRF
  relation_fv_rs_ctx       = "${aci_vrf.Sam-Demo-Unenforced.id}"
  # Assign L3 Out
  relation_fv_rs_bd_to_out = ["${local.l3_out}"]
  # Enable ARP Flooding
  arp_flood                = "yes"
  # Enable unknown unicast packets to be flooded
  unk_mac_ucast_act        = "flood"
  # Enable GARP to detect movement of virtual machines to different intefaces 
  ep_move_detect_mode = "garp"
}

resource "aci_subnet" "Demo-BD-75-subnet"{
  # Parent bridge domain you are assigning the subnet to.
  parent_dn = "${aci_bridge_domain.Demo-BD-75.id}"
  #Subnet being assigned to the bridge domain
  ip        = local.subnet_75
  preferred = "yes"
  # Set if the routes can be shared between vrfs. In this case we are sharing between vrfs and externally
  scope     = ["public","shared"]
  # This only really applies for multisite configurations. 
  virtual   = "no"
}


