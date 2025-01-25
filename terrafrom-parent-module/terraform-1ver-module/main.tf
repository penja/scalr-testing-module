resource "null_resource" "some_resource" {
  triggers = {
    time = timestamp()
  }
  provisioner "local-exec" {
    command = <<EOT
      echo "Printing Environment Variables:"
      env
    EOT
  }
}
variable "some_input" {
  default = "string value"
}

output "some_output" {
  value = null_resource.some_resource.id
}
