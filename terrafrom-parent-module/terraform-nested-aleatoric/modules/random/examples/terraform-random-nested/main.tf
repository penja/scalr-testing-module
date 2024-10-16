variable "trigger" {
  description = "The trigger value for the `random_integer` resource in this module."
  default     = "one"
}

resource "random_integer" "terraform-random-nested" {
  min = 0
  max = 1

  keepers = {
    number = "${var.trigger}"
  }
}

output "terraform-random-nested_id" {
  description = "The `id` of the `terraform-random-nested` resource in this module."
  value       = random_integer.terraform-random-nested.id
}