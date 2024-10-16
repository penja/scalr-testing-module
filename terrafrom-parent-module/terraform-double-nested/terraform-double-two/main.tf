variable "sleep_time" {
  default = 2
}

resource "null_resource" "sleep" {
  triggers = {
    trigger = timestamp()
  }
  provisioner "local-exec" {
    command = "sleep ${var.sleep_time}"
  }
}

resource "null_resource" "env_vars" {
  triggers = {
    trigger = timestamp()
  }
  provisioner "local-exec" {
    command = "env >> env_vars_${timestamp()}.txt"
  }
}

data "local_file" "env_vars" {
  filename   = "env_vars_${timestamp()}.txt"
  depends_on = [resource.null_resource.env_vars]
}

output "environment_variables" {
  value = data.local_file.env_vars.content
}

output "output_sleep_time" {
  value     = var.sleep_time
  sensitive = false
}

output "very_long" {
  value = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
}

output "sens_out" {
  value       = "XXX"
  description = "Sensitive output"
  sensitive   = true
}
