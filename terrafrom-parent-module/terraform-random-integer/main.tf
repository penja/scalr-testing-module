resource "random_integer" "int" {
  count = var.count-value
  keepers = {
    timestamp = timestamp()
  }
  min = 1
  max = 256
}


variable "count-value" {
  type    = number
  default = 1
}

variable "min" {
  type    = number
  default = 0
}

variable "max" {
  type    = number
  default = 255
}

output "random_int_list" {
  value = join(",", random_integer.int[*].id)
}
