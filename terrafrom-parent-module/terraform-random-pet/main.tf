resource "random_pet" "new_pet_commit_2" {
  keepers = {
    timestamp = timestamp()
  }
}
