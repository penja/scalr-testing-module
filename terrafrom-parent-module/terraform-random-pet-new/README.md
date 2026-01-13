# RANDOM PET
![header](https://cdnb.artstation.com/p/assets/images/images/049/299/913/large/pablo-munoz-gomez-phycodurus-final.jpg)

## Random quote
> Until one has loved an animal, a part of one's soul remains unawakened.


## main.tf
Consists of the following code
```hcl
resource "random_pet" "pet" {
  keepers = {
    timestamp = timestamp()
    pet_keeper = var.pet_keeper
  }
}

output "pet_name" {
  value = random_pet.pet.id
}

variable "pet_keeper" {
  default = "string"
}
```
