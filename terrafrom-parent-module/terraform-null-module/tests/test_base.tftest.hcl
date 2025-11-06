provider "null" {}

# TEST 1: Module instantiation
run "module_instantiation_success" {
  command = apply
  
  module {
    source = "../."  # Go up from tests/ to module root
  }
  
  # Assert references actual module output
  assert {
    condition     = can(module.terraform_null_module)
    error_message = "Module should instantiate successfully"
  }
}

# TEST 2: Verify null resource created
run "verify_resources_created" {
  command = apply
  
  module {
    source = "../."
  }
  
  # Test 1: Verify null_resource has a valid ID
  assert {
    condition     = can(module.terraform_null_module.null_resource.id) && module.terraform_null_module.null_resource.id != ""
    error_message = "Null resource should have an ID after creation"
  }
  
  # Test 2: Verify outputs are accessible
  assert {
    condition     = can(module.terraform_null_module.resource_id)
    error_message = "Module should provide resource_id output"
  }
  
  # Test 3: Verify output is not null
  assert {
    condition     = module.terraform_null_module.resource_id != null
    error_message = "resource_id output should not be null"
  }
}

# TEST 3: Verify plan phase
run "validate_plan_phase" {
  command = plan
  
  module {
    source = "../."
  }
  
  # Assert references module
  assert {
    condition     = can(module.terraform_null_module)
    error_message = "Terraform plan should succeed for this module"
  }
}

# TEST 4: Comprehensive output validation
run "comprehensive_output_validation" {
  command = apply
  
  module {
    source = "../."
  }
  
  # Verify primary output
  assert {
    condition     = can(module.terraform_null_module.resource_id)
    error_message = "Module must provide resource_id output"
  }
  
  # Verify output type (string)
  assert {
    condition     = can(tostring(module.terraform_null_module.resource_id))
    error_message = "resource_id should be convertible to string"
  }
  
  # Verify output is not empty
  assert {
    condition     = length(module.terraform_null_module.resource_id) > 0
    error_message = "resource_id should not be empty"
  }
}
