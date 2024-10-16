resource "null_resource" "sub3" {
  triggers = {
    trigger = timestamp()
  }
}