variable "animal_object" {
  type = object({
    id    = number
    breed = string
  })
  default = {
    id    = 1
    breed = "tf-module-abyssinian-004"
  }
}

output "animal_directory" {
  value = "£"
}