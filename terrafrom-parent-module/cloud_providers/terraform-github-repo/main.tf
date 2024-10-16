terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.23.0"
    }
  }
}

resource "github_repository" "example" {
  name        = "terraform-example"
  description = "Created by Scalr via integrations/github provider"

  visibility = "public"
}

resource "github_branch_protection_v3" "example" {
  repository     = github_repository.example.name
  branch         = "master"

  required_status_checks {
    strict   = false
    contexts = null
  }
}