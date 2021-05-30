# To create a new tenate. 
#This uses the aci-provider.tf file to create the tenant as long as they are in the same directory

resource  "aci_tenant" "Sam-Terraform-Demo" {
  # This is what the tenant will be named
  name  = "Sam-Terraform-Demo"
  lifecycle {
    prevent_destroy = "true"
  }
}
