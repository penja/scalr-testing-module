resource "null_resource" "name" {
  triggers = {
    timestamp = timestamp()
  }
}

resource "null_resource" "name" {
  triggers = {
    timestamp = timestamp()
  }
}

variable "variable" {
  default = "1"
}

variable "variable" {
  default = "1"
}

output "something" {
  value = "dup"
}

output "something" {
  value = "dup"
}