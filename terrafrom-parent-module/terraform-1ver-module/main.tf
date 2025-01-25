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

data "external" "print_var" {
  program = ["bash", "-c", "echo {\"SCALR_SUPPORT_VAR\":\"$SCALR_SUPPORT_VAR\"}"]
}

variable "some_input" {
  default = "string value"
}

output "some_output" {
  value = null_resource.some_resource.id
}
