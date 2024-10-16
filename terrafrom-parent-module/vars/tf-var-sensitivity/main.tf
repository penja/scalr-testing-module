# Simple type sensitive variable
variable "password" {
  type      = string
  sensitive = true
  default   = "4PHw4RAEWRyVXgM6XGy7"
}

# Complex type sensitive variable
variable "secrets" {
  type = object({
    username = string
    password = string
  })
  sensitive = true
  default = {
    username = "admin"
    password = "c!Sx&n8MfZ#jK$4E"
  }
}

resource "random_pet" "name" {
  keepers = {
    keeper2 = var.two
  }
}

variable "two" {
  type = number
  default = 2222222222
}

# Multiline sensitive variable
variable "private_key" {
  type      = string
  sensitive = true
  default   = <<-EOT
    -----BEGIN PRIVATE KEY-----
    <Your Private Key Here>
    -----END PRIVATE KEY-----
  EOT
}

# Sensitive output
output "db_password" {
  value     = "sensitive-password"
  sensitive = true
}

# Sensitive output
output "private_key_out" {
  value     = "This shouldn't be shown: ${var.private_key}"
  sensitive = true
}

# Sensitive output
output "secrets_out" {
  value     = var.secrets
  sensitive = true
}

# Multiline sensitive output
output "sensitive_key" {
  value     = <<-EOT
    -----BEGIN PRIVATE KEY-----
    <Your Private Key Here>
    -----END PRIVATE KEY-----
  EOT
  sensitive = true
}


# Testing Sensitive Outputs
resource "null_resource" "sensitive_output" {
  triggers = {
    password = var.password
  }

  provisioner "local-exec" {
    command = "echo ${var.password}"
  }
}