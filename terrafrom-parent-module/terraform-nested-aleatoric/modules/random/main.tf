/**
 * # terraform-null-module
 * 
 * Module `terraform-null-module` is a demonstration module,
 * consisting of a single `null_resource` resource.
 *
 * This module ultimately does nothing, but can be used to do an
 * end-to-end test of Terraform's registry functionality.
 * 
 */

variable "trigger" {
  description = "The trigger value for the `null_resource` resource in this module."
  default     = "one"
}

resource "null_resource" "modules_random" {
  triggers = {
    number = "${var.trigger}"
  }
}

output "modules_random_id" {
  description = "The `id` of the `modules_random` resource in this module."
  value       = null_resource.modules_random.id
}
