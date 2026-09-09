generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOT
terraform {
  backend "remote" {
    hostname     = "mainiacp.ape.testenv.scalr.dev"
    organization = "env-v0pdh3udanb070upl"
    workspaces {
      name = "scalr-tgad-20260909123700-${path_relative_to_include()}"
    }
  }
}
EOT
}
