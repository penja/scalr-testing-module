resource "null_resource" "sub1" {
  triggers = {
    trigger = timestamp()
  }
}