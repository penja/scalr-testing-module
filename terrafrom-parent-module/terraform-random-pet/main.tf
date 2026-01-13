resource "random_pet" "new" {
  count = 1
  keepers = {
    timestamp = timestamp()
  }
}
