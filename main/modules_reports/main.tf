terraform {
  required_providers {
    scalr = {
      source = "Scalr/scalr"
    }
  }
}

module "pet" {
	source  = "mainiacp.ape.testenv.scalr.dev/ape/pet/random"
	version = "1.0.3"
}
