resource "random_pet" "after" {
  keepers = {
    timestamp = timestamp()
  }
}
