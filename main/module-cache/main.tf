variable "sleep_time" {
  type = number
  default = 5
}


resource "null_resource" "short_sleep" {
  triggers = {
    always = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "sleep ${var.sleep_time}"
  }
}

module "random-pet-git" {
  source = "git::https://github.com/penja/scalr-testing-module.git//terrafrom-parent-module/terraform-random-pet?ref=v1.0.14"
}

module "integer-git" {
  source = "git::https://github.com/penja/scalr-testing-module.git//integer/random?ref=v1.0.14"
}

module "pet-git" {
  source = "git::https://github.com/penja/scalr-testing-module.git//pet/random?ref=v1.0.14"
}

module "data-git" {
  source = "git::https://github.com/penja/scalr-testing-module.git//data/readme?ref=v1.0.14"

  # Set 1 required variable below.
  # Some variable description
  not_a_trigger = "test-var-git"
}


module "integer" {
	source  = "mainiacp.ape.testenv.scalr.dev/test/integer/random"
	version = "1.0.14"
}

module "pet" {
	source  = "mainiacp.ape.testenv.scalr.dev/test/pet/random"
	version = "1.0.14"
}


module "data" {
	source  = "mainiacp.ape.testenv.scalr.dev/test/data/readme"
	version = "1.0.14"

	# Set 1 required variable below.

	# Some variable description
 	not_a_trigger = "test-var"
}
