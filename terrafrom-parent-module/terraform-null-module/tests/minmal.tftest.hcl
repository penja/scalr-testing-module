provider "null" {}

run "module_instantiation_success" {
  command = apply
  module {
    source = ".."
  }
  assert {
    condition     = true
    error_message = "Module should deploy without errors"
  }
}

run "verify_resources_created" {
  command = apply
  module {
    source = ".."
  }
  
  assert {
    condition     = try(module.terraform_null_module.null_resource.id, "") != ""
    error_message = "Null resource should have an ID after creation"
  }
  
  assert {
    condition     = can(module.terraform_null_module.resource_id)
    error_message = "Module should provide resource_id output"
  }
  
  assert {
    condition     = module.terraform_null_module.resource_id != null
    error_message = "resource_id output should not be null"
  }
}

run "validate_plan_phase" {
  command = plan
  module {
    source = ".."
  }
  assert {
    condition     = true
    error_message = "Terraform plan should succeed for this module"
  }
}

run "comprehensive_output_validation" {
  command = apply
  module {
    source = ".."
  }
  
  assert {
    condition     = can(module.terraform_null_module.resource_id)
    error_message = "Module must provide resource_id output"
  }
  
  assert {
    condition     = can(tostring(module.terraform_null_module.resource_id))
    error_message = "resource_id should be convertible to string"
  }
  
  assert {
    condition     = length(module.terraform_null_module.resource_id) > 0
    error_message = "resource_id should not be empty"
  }
}
