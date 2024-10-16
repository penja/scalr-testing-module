resource "null_resource" "sub2" {
  triggers = {
    trigger = timestamp()
  }
}