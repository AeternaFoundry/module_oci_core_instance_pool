output "core_instance_pools_id" {
  description = "Map of id values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no id are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "core_instance_pools_actual_size" {
  description = "Map of actual_size values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no actual_size are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.actual_size if v.actual_size != null }
}
output "core_instance_pools_compartment_id" {
  description = "Map of compartment_id values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no compartment_id are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "core_instance_pools_current_size" {
  description = "Map of current_size values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no current_size are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.current_size if v.current_size != null }
}
output "core_instance_pools_defined_tags" {
  description = "Map of defined_tags values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no defined_tags are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "core_instance_pools_display_name" {
  description = "Map of display_name values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no display_name are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "core_instance_pools_freeform_tags" {
  description = "Map of freeform_tags values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "core_instance_pools_instance_configuration_id" {
  description = "Map of instance_configuration_id values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no instance_configuration_id are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.instance_configuration_id if v.instance_configuration_id != null && length(v.instance_configuration_id) > 0 }
}
output "core_instance_pools_instance_display_name_formatter" {
  description = "Map of instance_display_name_formatter values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no instance_display_name_formatter are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.instance_display_name_formatter if v.instance_display_name_formatter != null && length(v.instance_display_name_formatter) > 0 }
}
output "core_instance_pools_instance_hostname_formatter" {
  description = "Map of instance_hostname_formatter values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no instance_hostname_formatter are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.instance_hostname_formatter if v.instance_hostname_formatter != null && length(v.instance_hostname_formatter) > 0 }
}
output "core_instance_pools_lifecycle_management" {
  description = "Map of lifecycle_management values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no lifecycle_management are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => one(v.lifecycle_management) if v.lifecycle_management != null && length(v.lifecycle_management) > 0 }
}
output "core_instance_pools_load_balancers" {
  description = "Map of load_balancers values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no load_balancers are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.load_balancers if v.load_balancers != null && length(v.load_balancers) > 0 }
}
output "core_instance_pools_placement_configurations" {
  description = "Map of placement_configurations values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no placement_configurations are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.placement_configurations if v.placement_configurations != null && length(v.placement_configurations) > 0 }
}
output "core_instance_pools_pool_type" {
  description = "Map of pool_type values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no pool_type are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.pool_type if v.pool_type != null && length(v.pool_type) > 0 }
}
output "core_instance_pools_size" {
  description = "Map of size values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no size are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.size if v.size != null }
}
output "core_instance_pools_state" {
  description = "Map of state values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no state are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.state if v.state != null && length(v.state) > 0 }
}
output "core_instance_pools_time_created" {
  description = "Map of time_created values across all core_instance_pools, keyed the same as var.core_instance_pools except keys with no time_created are omitted"
  value       = { for k, v in oci_core_instance_pool.core_instance_pools : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}

