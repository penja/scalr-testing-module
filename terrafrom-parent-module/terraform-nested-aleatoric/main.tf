resource "null_resource" "terraform-nested-aleatoric" {
  triggers = {
    trigger = timestamp()
  }
}