# terraform {
#   required_providers {
#     scalr = {
#       source  = "Scalr/scalr"
#       version = "2.1.0"
#     }
#   }
# }

# provider "scalr" {}

# variable "scalr_account_id" {
#   type        = string
#   description = "Account ID to use"
# }

# variable "scalr_variable" {
#   type = map(object({
#     key            = optional(string)
#     hcl            = optional(string)
#     value          = optional(string)
#     category       = optional(string)
#     sensitive      = optional(string)
#     description    = optional(string)
#     workspace_id   = optional(string)
#     environment_id = optional(string)
#   }))
#   default     = null
#   description = "Environment level Scalr variable to provision"
# }

# resource "scalr_variable" "this" {
#   for_each       = var.scalr_variable
#   key            = each.key
#   hcl            = each.value.hcl
#   value          = each.value.value
#   category       = "terraform"
#   sensitive      = each.value.sensitive
#   account_id     = var.scalr_account_id
#   description    = each.value.description
#   workspace_id   = each.value.workspace_id
#   environment_id = each.value.environment_id
# }  

data "terraform_remote_state" "wait" {
  backend = "remote"

  config = {
    hostname = "m-moh.scalr.io"
    organization = "env-v0ntmf5r4hmcrp90l"
    workspaces = {
      name = "cloudposse_label_null"
    }
  }

  depends_on = [ terraform_data.this ]
}

resource "terraform_data" "this" {
  input = timestamp()
}

output "remote_outputs" {
  value = data.terraform_remote_state.wait.outputs
}