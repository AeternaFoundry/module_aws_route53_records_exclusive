variable "route53_records_exclusives" {
  description = <<EOT
Map of route53_records_exclusives, attributes below
Required:
    - zone_id
Optional:
    - resource_record_set (block):
        - alias_target (optional, block):
            - dns_name (required)
            - evaluate_target_health (required)
            - hosted_zone_id (required)
        - cidr_routing_config (optional, block):
            - collection_id (required)
            - location_name (required)
        - failover (optional)
        - geolocation (optional, block):
            - continent_code (optional)
            - country_code (optional)
            - subdivision_code (optional)
        - geoproximity_location (optional, block):
            - aws_region (optional)
            - bias (optional)
            - coordinates (optional, block):
                - latitude (required)
                - longitude (required)
            - local_zone_group (optional)
        - health_check_id (optional)
        - multi_value_answer (optional)
        - name (required)
        - region (optional)
        - resource_records (optional, block):
            - value (required)
        - set_identifier (optional)
        - traffic_policy_instance_id (optional)
        - ttl (optional)
        - type (optional)
        - weight (optional)
EOT

  type = map(object({
    zone_id = string
    resource_record_set = optional(list(object({
      alias_target = optional(list(object({
        dns_name               = string
        evaluate_target_health = bool
        hosted_zone_id         = string
      })))
      cidr_routing_config = optional(list(object({
        collection_id = string
        location_name = string
      })))
      failover = optional(string)
      geolocation = optional(list(object({
        continent_code   = optional(string)
        country_code     = optional(string)
        subdivision_code = optional(string)
      })))
      geoproximity_location = optional(list(object({
        aws_region = optional(string)
        bias       = optional(number)
        coordinates = optional(list(object({
          latitude  = string
          longitude = string
        })))
        local_zone_group = optional(string)
      })))
      health_check_id    = optional(string)
      multi_value_answer = optional(bool)
      name               = string
      region             = optional(string)
      resource_records = optional(list(object({
        value = string
      })))
      set_identifier             = optional(string)
      traffic_policy_instance_id = optional(string)
      ttl                        = optional(number)
      type                       = optional(string)
      weight                     = optional(number)
    })))
  }))
}

