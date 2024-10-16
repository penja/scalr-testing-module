terraform {
  required_providers {
    scalr = {
        source = "scalr/scalr"
    }
  }
}

resource "scalr_workspace" "test-ws" {
  name = "created_to_check_if_all_vars_are_passed"
  environment_id = var.env_id
  vcs_provider_id = var.vcs_id

  working_directory = "main/100_vars"

  vcs_repo {
    identifier       = "aleatoricmbnt/base"
    branch           = "master"
  }
}

variable "env_id" {
  description = "ID of the environment where the workspace should be created "
}

variable "acc_id" {
}

variable "vcs_id" {
  description = "ID of the VCS that the workspace should be created from"
}

resource "scalr_workspace_run_schedule" "example" {
  workspace_id     = scalr_workspace.test-ws.id
  apply_schedule   = "*/5 * * * *"
}

resource "scalr_variable" "name" {
  count = 104
  key = "user_var${count.index}"
  value = "value_${count.index}"
  category = "terraform"
  workspace_id = scalr_workspace.test-ws.id
}