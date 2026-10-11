variable "core_instance_pools" {
  description = <<EOT
Map of core_instance_pools, attributes below
Required:
    - compartment_id
    - instance_configuration_id
    - size
    - placement_configurations (block):
        - availability_domain (required)
        - compute_cluster_id (optional)
        - fault_domains (optional)
        - primary_subnet_id (optional)
        - primary_vnic_subnets (optional, block):
            - ipv6address_ipv6subnet_cidr_pair_details (optional, block):
                - ipv6subnet_cidr (optional)
            - is_assign_ipv6ip (optional)
            - subnet_id (required)
        - secondary_vnic_subnets (optional, block):
            - display_name (optional)
            - ipv6address_ipv6subnet_cidr_pair_details (optional, block):
                - ipv6subnet_cidr (optional)
            - is_assign_ipv6ip (optional)
            - subnet_id (required)
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - instance_display_name_formatter
    - instance_hostname_formatter
    - state
    - lifecycle_management (block):
        - lifecycle_actions (required, block):
            - pre_termination (optional, block):
                - is_enabled (required)
                - on_timeout (required, block):
                    - preserve_block_volume_mode (required)
                    - preserve_boot_volume_mode (required)
                - timeout (required)
    - load_balancers (block):
        - backend_set_name (required)
        - load_balancer_id (required)
        - port (required)
        - vnic_selection (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id                  = string
    instance_configuration_id       = string
    size                            = number
    defined_tags                    = optional(map(string))
    display_name                    = optional(string)
    freeform_tags                   = optional(map(string))
    instance_display_name_formatter = optional(string)
    instance_hostname_formatter     = optional(string)
    state                           = optional(string)
    placement_configurations = list(object({
      availability_domain = string
      compute_cluster_id  = optional(string)
      fault_domains       = optional(list(string))
      primary_subnet_id   = optional(string)
      primary_vnic_subnets = optional(object({
        ipv6address_ipv6subnet_cidr_pair_details = optional(list(object({
          ipv6subnet_cidr = optional(string)
        })))
        is_assign_ipv6ip = optional(bool)
        subnet_id        = string
      }))
      secondary_vnic_subnets = optional(list(object({
        display_name = optional(string)
        ipv6address_ipv6subnet_cidr_pair_details = optional(list(object({
          ipv6subnet_cidr = optional(string)
        })))
        is_assign_ipv6ip = optional(bool)
        subnet_id        = string
      })))
    }))
    lifecycle_management = optional(object({
      lifecycle_actions = object({
        pre_termination = optional(object({
          is_enabled = bool
          on_timeout = object({
            preserve_block_volume_mode = string
            preserve_boot_volume_mode  = string
          })
          timeout = number
        }))
      })
    }))
    load_balancers = optional(list(object({
      backend_set_name = string
      load_balancer_id = string
      port             = number
      vnic_selection   = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.core_instance_pools : (
        length(v.placement_configurations) >= 1
      )
    ])
    error_message = "Each placement_configurations list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.core_instance_pools : (
        v.state == null || (contains([for v in ["running", "stopped"] : lower(v)], lower(v.state)))
      )
    ])
    error_message = "must be one of: \"running\", \"stopped\""
  }
}

