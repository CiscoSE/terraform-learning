# Create an Application Profile
resource "aci_application_profile" "Test-App"{
  # Tenant where the Application profile will be created
  tenant_dn = "${local.tenant_id}"
  # The name of the Application Profile
  name = "Test-App"
}