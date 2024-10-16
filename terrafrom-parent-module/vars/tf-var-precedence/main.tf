/*account shell > 
environment shell > 
workspace shell > 
! DOESN"T WORK terraform.tfvars >
terraform.tfvars.json > 
*.auto.tfvars or *.auto.tfvars.json > 
workspace terraform > 
var-file */



resource "null_resource" "check" {
  triggers = {
    "time"   = timestamp()
    "string" = var.str
  }

  provisioner "local-exec" {
    command = "env | grep shell"
  }
}

variable "str" {

}

output "str_output" {
  value = var.str
}