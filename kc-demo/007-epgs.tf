resource "aci_application_epg" "t1epg1" {
  name                   = "epg1"
  application_profile_dn = aci_application_profile.t1a1.id
}

resource "aci_epg_to_domain" "t1epg1-dom" {
  application_epg_dn = aci_application_epg.t1epg1.id
  tdn                = aci_physical_domain.labsystems_physical_dom.id
}

