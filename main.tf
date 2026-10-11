resource "oci_core_instance_pool" "core_instance_pools" {
  for_each = var.core_instance_pools

  compartment_id                  = each.value.compartment_id
  instance_configuration_id       = each.value.instance_configuration_id
  size                            = each.value.size
  defined_tags                    = each.value.defined_tags
  display_name                    = each.value.display_name
  freeform_tags                   = each.value.freeform_tags
  instance_display_name_formatter = each.value.instance_display_name_formatter
  instance_hostname_formatter     = each.value.instance_hostname_formatter
  state                           = each.value.state

  dynamic "placement_configurations" {
    for_each = each.value.placement_configurations
    content {
      availability_domain = placement_configurations.value.availability_domain
      compute_cluster_id  = placement_configurations.value.compute_cluster_id
      fault_domains       = placement_configurations.value.fault_domains
      primary_subnet_id   = placement_configurations.value.primary_subnet_id
      dynamic "primary_vnic_subnets" {
        for_each = placement_configurations.value.primary_vnic_subnets != null ? [placement_configurations.value.primary_vnic_subnets] : []
        content {
          dynamic "ipv6address_ipv6subnet_cidr_pair_details" {
            for_each = primary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details != null ? primary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details : []
            content {
              ipv6subnet_cidr = ipv6address_ipv6subnet_cidr_pair_details.value.ipv6subnet_cidr
            }
          }
          is_assign_ipv6ip = primary_vnic_subnets.value.is_assign_ipv6ip
          subnet_id        = primary_vnic_subnets.value.subnet_id
        }
      }
      dynamic "secondary_vnic_subnets" {
        for_each = placement_configurations.value.secondary_vnic_subnets != null ? placement_configurations.value.secondary_vnic_subnets : []
        content {
          display_name = secondary_vnic_subnets.value.display_name
          dynamic "ipv6address_ipv6subnet_cidr_pair_details" {
            for_each = secondary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details != null ? secondary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details : []
            content {
              ipv6subnet_cidr = ipv6address_ipv6subnet_cidr_pair_details.value.ipv6subnet_cidr
            }
          }
          is_assign_ipv6ip = secondary_vnic_subnets.value.is_assign_ipv6ip
          subnet_id        = secondary_vnic_subnets.value.subnet_id
        }
      }
    }
  }

  dynamic "lifecycle_management" {
    for_each = each.value.lifecycle_management != null ? [each.value.lifecycle_management] : []
    content {
      lifecycle_actions {
        dynamic "pre_termination" {
          for_each = lifecycle_management.value.lifecycle_actions.pre_termination != null ? [lifecycle_management.value.lifecycle_actions.pre_termination] : []
          content {
            is_enabled = pre_termination.value.is_enabled
            on_timeout {
              preserve_block_volume_mode = pre_termination.value.on_timeout.preserve_block_volume_mode
              preserve_boot_volume_mode  = pre_termination.value.on_timeout.preserve_boot_volume_mode
            }
            timeout = pre_termination.value.timeout
          }
        }
      }
    }
  }

  dynamic "load_balancers" {
    for_each = each.value.load_balancers != null ? each.value.load_balancers : []
    content {
      backend_set_name = load_balancers.value.backend_set_name
      load_balancer_id = load_balancers.value.load_balancer_id
      port             = load_balancers.value.port
      vnic_selection   = load_balancers.value.vnic_selection
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

