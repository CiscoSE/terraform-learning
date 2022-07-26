# This demo assumes that you are using the common tenant and the default vrf for your L3 out. 

variable "L3out_tenant" {
  default = "common" 
}

variable "L3out_vrf" {
  default = "default"
}

# We assume you have a default route in your L3 out already. You may have to create a static or 
# leak an existing route being learned externally in order for this to work.

variable "leak_route" {
  default = "0.0.0.0/0"
  
}

# This creates a read only reference to the tenant. 
data "aci_tenant" "l3out_tenant" {
  name  = var.L3out_tenant
}

data "aci_vrf" "l3out_vrf" {
  tenant_dn = data.aci_tenant.l3out_tenant.id
  name = var.L3out_vrf
}

resource "aci_rest_managed" "leak" {
  depends_on = [
    data.aci_vrf.l3out_vrf,
    data.aci_tenant.l3out_tenant
  ]
  dn         = "${data.aci_vrf.l3out_vrf.id}/leakroutes"
  class_name = "leakRoutes"
}

resource "aci_rest_managed" "leak_subnet1" {
  depends_on = [
    aci_rest_managed.leak
  ]
  dn         = "${data.aci_vrf.l3out_vrf.id}/leakroutes/leakextsubnet-[${var.leak_route}]"
  class_name = "leakExternalPrefix"
  content = {
    ip = "${var.leak_route}"
  }
} 

resource "aci_rest_managed" "leakTo" {
  depends_on = [
    aci_rest_managed.leak_subnet1
  ]
  dn           = "${data.aci_vrf.l3out_vrf.id}/leakroutes/leakextsubnet-[${var.leak_route}]/to-[${var.tenant1_name}]-[${var.vrf1_name}]"
  class_name   = "leakTo"
  content = {
    tenantName = var.tenant1_name
    ctxName    = var.vrf1_name
  }
} 