resource "random_pet" "new_pet" {
  keepers = {
    timestamp = timestamp()
  }
}
