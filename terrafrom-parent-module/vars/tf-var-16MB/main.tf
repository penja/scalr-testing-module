resource "null_resource" "some" {
  triggers = {
    var = var.long_var
    time = timestamp()
  }
}