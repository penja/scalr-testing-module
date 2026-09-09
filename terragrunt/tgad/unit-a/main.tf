terraform {
  required_version = ">= 1.4"
}

resource "terraform_data" "unit" {
  count = 2
  input = "unit-a-${count.index}"
}

output "ids" {
  value = terraform_data.unit[*].id
}
