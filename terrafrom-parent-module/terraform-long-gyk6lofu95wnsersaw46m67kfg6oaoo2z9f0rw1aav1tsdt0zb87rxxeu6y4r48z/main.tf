resource "random_pet" "pet" {
  keepers = {
    timestamp = timestamp()
  }
}

resource "random_pet" "pet_2" {
  count = var.pet_count
  keepers = {
    timestamp = timestamp()
  }
}

output "pet_name" {
  value = "Pet's name is ${random_pet.pet.id}"
}

output "info" {
  value = "This is the terraform-random-pet module"
}

variable "pet_count" {
  type    = number
  default = 3
}