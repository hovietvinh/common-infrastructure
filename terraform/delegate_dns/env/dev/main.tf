module "dns" {
  source = "../../modules/dns"
  root_domain = var.root_domain
}

module "acm" {
  source = "../../modules/acm"
  root_domain = var.root_domain
  sub_domains = var.sub_domains
  zone_id = module.dns.zone_id
}