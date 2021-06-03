# To create a new tenate. 
#This uses the aci-provider.tf file to create the tenant as long as they are in the same directory

resource  "aci_tenant" "tenant1" {
  # This is what the tenant will be named
  name  = "${local.tenant_name}"
}
