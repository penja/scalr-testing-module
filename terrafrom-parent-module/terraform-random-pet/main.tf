resource "random_pet" "new" {
  count = 100
  keepers = {
    timestamp = timestamp()
  }
}
