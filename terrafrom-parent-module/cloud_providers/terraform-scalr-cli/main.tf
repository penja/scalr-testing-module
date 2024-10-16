terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
    }
  }
}

# -------------------------------------------------------------------------------------------
# ----------------------------------- CONFIGURE PROVIDERS -----------------------------------
# -------------------------------------------------------------------------------------------

provider "scalr" {}

# -------------------------------------------------------------------------------------------
# ------------------------------------------ SCALR ------------------------------------------
# -------------------------------------------------------------------------------------------

resource "scalr_workspace" "cli-driven" {
  name           = "automatically_created_${random_pet.name.id}"
  environment_id = var.env_id
}

resource "random_pet" "name" {
  
}

variable "env_id" {
  type    = string
  default = "env-svrcnchebt61e30"
}