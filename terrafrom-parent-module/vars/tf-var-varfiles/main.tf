resource "null_resource" "low" {
  count = var.low
}

resource "null_resource" "medium" {
  count = var.medium
}

resource "null_resource" "high" {
  count = var.high
}

resource "null_resource" "test" {
  count = var.test
}

variable "low" {
  type = number
}

variable "medium" {
  type = number
}

variable "high" {
  type = number
}

variable "test" {
  type = number
}
