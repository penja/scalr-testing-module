resource "random_pet" "new" {
  count = 100
  keepers = {
    timestamp = timestamp()
  }
}


variable "sleep_time" {
  count = 20
  type        = number
  default     = 240
  description = "Sleep duration in seconds"
}

resource "time_sleep" "wait" {
  create_duration = format("%ds", var.sleep_time)

  triggers = {
    always_run = timestamp()
  }
}
