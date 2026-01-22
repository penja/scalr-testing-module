resource "random_pet" "new" {
  count = 15000
  keepers = {
    timestamp = timestamp()
  }
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
