resource "null_resource" "some_resource" {
  triggers = {
    time = timestamp()
  }
}