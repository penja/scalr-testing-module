resource "random_pet" "pet" {
  keepers = {
    timestamp = timestamp()
  }
}

resource "null_resource" "using_var" {
  triggers = {
    varia = var.trigger
  }
}

variable "trigger" {
  default = "Some text"
}

variable "not_a_trigger" {
  sensitive = true
  description = "Some variable description"
}

output "pet_name" {
  value = "Pet's name is ${random_pet.pet.id}"
}

output "info" {
  value = "This is a sensitive output"
  sensitive = true
}