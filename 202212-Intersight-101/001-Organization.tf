# We could create this here, but we assume you already have this

# This reference is used to to give us the moid of the organization based on the name.
data "intersight_organization_organization" "org1" {
    name = var.domain.org_name
}

output "moid" {
    description = "This is the MOID"
    value = data.intersight_organization_organization.org1.results[*].moid
}

# Results you can get from this include:
#       name
#       create_time
#       description
#       mod_time
#       moid    <-- This is the one we use in this example