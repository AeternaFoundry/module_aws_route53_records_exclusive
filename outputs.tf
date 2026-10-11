output "route53_records_exclusives_resource_record_set" {
  description = "Map of resource_record_set values across all route53_records_exclusives, keyed the same as var.route53_records_exclusives"
  value       = { for k, v in aws_route53_records_exclusive.route53_records_exclusives : k => v.resource_record_set if v.resource_record_set != null && length(v.resource_record_set) > 0 }
}
output "route53_records_exclusives_zone_id" {
  description = "Map of zone_id values across all route53_records_exclusives, keyed the same as var.route53_records_exclusives"
  value       = { for k, v in aws_route53_records_exclusive.route53_records_exclusives : k => v.zone_id if v.zone_id != null && length(v.zone_id) > 0 }
}

