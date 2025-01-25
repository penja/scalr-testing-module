resource "null_resource" "some_resource" {
  triggers = {
    time = timestamp()
  }
  provisioner "local-exec" {
    command = <<EOT
      echo "Printing Environment Variables:"
      printenv
    EOT
  }
}

data "external" "print_env" {
  program = ["bash", "-c", "printenv"]
}

variable "some_input" {
  default = "string value"
}

output "some_output" {
  value = null_resource.some_resource.id
}
