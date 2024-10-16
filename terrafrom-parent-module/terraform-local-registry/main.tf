terraform {
  backend "remote" {
    hostname     = var.hostname
    organization = var.environment
    token        = var.token

    workspaces {
      name = "terraform-local-registry-test"
    }
  }
}

module "instance" {
  source = "./instance"
}

variable "hostname" {
  type    = string
  default = "aleatoric.main.scalr.dev"
}

variable "environment" {
  type    = string
  default = "env-uae22veoi5c6d6o"
}

variable "token" {
  type      = string
  sensitive = true
  default   = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ1c2VyIiwianRpIjoiYXQtdTRnYXFqdmtvMjluamxnIn0.92m7PT7_z_SNomrKMfDBaXS50fX_owLzEpKlfu8JlBw"
}