resource "null_resource" "some_resource" {
  triggers = {
    time = timestamp()
  }
}

variable "some_input" {
  default = "string value"
}

output "some_output" {
  value = null_resource.some_resource.id
}