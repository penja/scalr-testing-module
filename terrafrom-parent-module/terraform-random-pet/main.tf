resource "random_pet" "new_pet_commit" {
  keepers = {
    timestamp = timestamp()
  }
}
