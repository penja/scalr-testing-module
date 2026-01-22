resource "random_pet" "new" {
  count = 5000
  keepers = {
    timestamp = timestamp()
  }
}

module "flat_from_repo" {
  source = "git::https://github.com/aleatoricmbnt/terraform-flat-module?ref=6b2f17e"
}

variable "sleep_time" {
  type        = number
  default     = 55
  description = "Sleep duration in seconds"
}

resource "time_sleep" "wait" {
  count = 20
  create_duration = format("%ds", var.sleep_time)

  triggers = {
    always_run = timestamp()
  }
}
