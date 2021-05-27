# Create an Application Profile
resource "aci_application_profile" "Test-App"{
  # Tenant where the Application profile will be created
  tenant_dn = "${aci_tenant.SamTestTerraform.id}"
  # The name of the Application Profile
  name = "Test-App"
}