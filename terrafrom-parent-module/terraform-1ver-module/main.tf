resource "null_resource" "some_resource" {
  triggers = {
    time = timestamp()
  }
  provisioner "local-exec" {
    command = "env"
  }
}
variable "some_input" {
  default = "string value"
}

output "some_output" {
  value = null_resource.some_resource.id
}
