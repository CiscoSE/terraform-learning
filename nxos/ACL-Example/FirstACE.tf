resource "nxos_rest" "Sam-Test1" {
  for_each   = toset([for leaf in local.leafs : leaf.name])
  device     = each.key
  dn         = "sys/acl/ipv4/name-Sam-Test1"
  class_name = "ipv4aclACL"
  content = {
   name = "Sam-Test1"
  }
}

