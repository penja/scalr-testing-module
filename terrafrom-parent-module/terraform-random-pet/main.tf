resource "random_pet" "before" {
  keepers = {
    timestamp = timestamp()
  }
}
