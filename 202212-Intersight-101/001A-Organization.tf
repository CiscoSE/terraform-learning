# We could create this here, but we assume you already have this

# This reference is used to to give us the moid of the organization based on the name.
data "intersight_organization_organization" "org1" {
    name = var.domain.org_name
}
