
# tf-var-precedence module

This Terraform module deploys a `null_resource` resource with a `local-exec` provisioner and a single `str` variable. Can be used along with other files in the module's directory to test Scalr variable precedence. 

## Variable Precedence

When defining Terraform variables, their values can be set in a variety of locations. The order of precedence for variable values is:

| Precedence | Description |
| --- | --- |
| `var-file` | Variables defined in a specified var-file. |
| **Workspace terraform** | Terraform variables set at the workspace level in the Scalr UI. |
| `*.auto.tfvars` or `*.auto.tfvars.json` | Files containing auto-loaded variable definitions. |
| `terraform.tfvars.json` | Variables defined in JSON format in file in the current working directory. |
| `terraform.tfvars` |  Variables defined in HCL format in file in the current working directory. |
| **Workspace Shell** | Environment variables set at the workspace level in the Scalr UI using `TF_VAR` prefix. |
| **Environment Shell** | Environment variables set at the environment level in the Scalr UI using `TF_VAR_` prefix. |
| **Account Shell** | Environment variables set at the account level in the Scalr UI using `TF_VAR_` prefix. |

Variables defined in locations with higher precedence override variables defined in lower precedence locations. For example, a variable defined in terraform.tfvars would override a variable with the same name defined in the account shell.

> **Note:** ⚠️ `terraform.tfvars` and `terraform.tfvars.json` are not currently used in the run pipeline.


## Files

Here are the files included in this module:

| Filename | Description | `str` value |
| --- | --- | --- |
| `main.tf` | The main Terraform configuration file. |  |
| `my.tfvars` | A Terraform variables file for custom variables. | `my.tfvars` |
| `my.tfvars.json` | A JSON formatted Terraform variables file for custom variables. | `my.tfvars.json` |
| `some.auto.tfvars` | An automatically loaded Terraform variables file for custom variables. | `some.auto.tfvars` |
| `some.auto.tfvars.json` | A JSON formatted automatically loaded Terraform variables file for custom variables. | `some.auto.tfvars.json` |
| `terraform.tfvars` | A Terraform variables file for default variables. | `terraform.tfvars` |
| `terraform.tfvars.json` | A JSON formatted Terraform variables file for default variables. | `terraform.tfvars.json` |

## Resource details

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:----------:|
| `str` | Example string variable | `string` |  | no |



### Outputs

| Name         | Description     |
| ------------ | --------------- |
| str_output   | The value of `var.str` |

### Example Resource

The `null_resource` has two triggers: `time`, which is set to the current timestamp, and `string`, which is a string variable `str` passed in from outside the module.

```
resource "null_resource" "check" {
  triggers = {
    "time" = timestamp()
    "string" = var.str
  }

  provisioner "local-exec" {
    command = "env | grep shell"
  }
}
```
The `local-exec` provisioner executes a command locally on the machine running Terraform. In this case, the provisioner executes the `env` command and pipes the output through the `grep` command to filter for environment variables containing the string "shell".
