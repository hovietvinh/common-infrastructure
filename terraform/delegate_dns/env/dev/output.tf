output "common_zone_nameservers" {
  value = module.dns.common_zone_nameservers
}

output "certificate_arn" {
  value = module.acm.certificate_arn
}