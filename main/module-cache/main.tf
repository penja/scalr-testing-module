resource "null_resource" "test" {
  triggers = {
    always = "${timestamp()}"
  }
}

module "random-pet" {
  source = "git::https://github.com/penja/scalr-testing-module.git//terrafrom-parent-module/terraform-random-pet?ref=v1.0.14"
}


module "integer" {
	source  = "mainiacp.ape.testenv.scalr.dev/tfenv1/integer/random"
	version = "1.0.14"
}