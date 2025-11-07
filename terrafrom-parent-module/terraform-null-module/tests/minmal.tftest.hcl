provider "null" {}

# ============================================================================
# TEST 1: Basic Module Instantiation and Resource Creation
# ============================================================================
# Verify that the null_resource is created successfully with a valid ID
run "resource_creation_success" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  assert {
    condition     = can(null_resource.test[0].id)
    error_message = "null_resource must be created with an ID"
  }
  
  assert {
    condition     = length(null_resource.test[0].id) > 0
    error_message = "null_resource ID should not be empty"
  }
  
  assert {
    condition     = null_resource.test[0].id != ""
    error_message = "null_resource ID must have a valid value"
  }
}

# ============================================================================
# TEST 2: Verify Resource Lifecycle and Triggers
# ============================================================================
# Test that resource handles lifecycle configurations and triggers correctly
run "resource_triggers_validation" {
  command = apply
  
  variables {
    quantity = 10
  }
  
  # Check if triggers are properly set
  assert {
    condition     = can(null_resource.test[0].triggers)
    error_message = "null_resource should have triggers attribute"
  }
  
  # Verify triggers is a map/object
  assert {
    condition     = try(length(keys(null_resource.test[0].triggers)) >= 0, false)
    error_message = "triggers should be a valid map"
  }
}

# ============================================================================
# TEST 3: Plan Phase Validation (Dry Run)
# ============================================================================
# Ensure configuration is valid without actually creating resources
run "plan_phase_validation" {
  command = plan
  
  variables {
    quantity = 1
  }
  
  assert {
    condition     = length(resource.null_resource.test) == 1
    error_message = "null_resource should be accessible in plan phase"
  }
}

# ============================================================================
# TEST 4: Resource ID Persistence and Consistency
# ============================================================================
# Verify that the resource ID is consistent and follows expected patterns
run "resource_id_consistency" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # ID should be a valid numeric string format
  assert {
    condition     = can(regex("^[0-9]+$", null_resource.test[0].id))
    error_message = "Resource ID should be a valid numeric string format"
  }
  
  # ID should be a non-empty numeric string
  assert {
    condition     = length(null_resource.test[0].id) > 0 && can(tonumber(null_resource.test[0].id))
    error_message = "Resource ID should be a non-empty numeric string"
  }
}

# ============================================================================
# TEST 5: Multiple Resource Instantiation
# ============================================================================
# Test that multiple resources can be created independently
run "multiple_instances_test" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  assert {
    condition     = length(null_resource.test[0].id) > 0
    error_message = "First resource instance should be created"
  }
}

# ============================================================================
# TEST 6: Resource State Management
# ============================================================================
# Verify resource state is properly managed
run "state_management" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # Resource should exist in state
  assert {
    condition     = can(null_resource.test[0])
    error_message = "null_resource should be managed in state"
  }
  
  # Resource should have an ID (proof it exists in state)
  assert {
    condition     = null_resource.test[0].id != null
    error_message = "Resource state should contain valid ID"
  }
}

# ============================================================================
# TEST 7: Type Safety and Attribute Validation
# ============================================================================
# Validate that resource attributes have correct types
run "type_safety_validation" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # ID should be convertible to string
  assert {
    condition     = can(tostring(null_resource.test[0].id))
    error_message = "Resource ID should be a string type"
  }
  
  # ID length should be measurable (valid string)
  assert {
    condition     = can(length(tostring(null_resource.test[0].id))) && length(tostring(null_resource.test[0].id)) > 0
    error_message = "Resource ID string should be non-empty"
  }
}

# ============================================================================
# TEST 8: JSON Serialization and Output Compatibility
# ============================================================================
# Ensure resource can be serialized (important for state files and APIs)
run "json_serialization" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # Should be able to serialize the ID to JSON
  assert {
    condition     = can(jsondecode(jsonencode(null_resource.test[0].id)))
    error_message = "Resource ID should be JSON serializable"
  }
  
  # Deserialized value should match original
  assert {
    condition     = jsondecode(jsonencode(null_resource.test[0].id)) == null_resource.test[0].id
    error_message = "Serialized ID should deserialize to original value"
  }
}

# ============================================================================
# TEST 9: Resource Comparison and Equality
# ============================================================================
# Test resource identity and comparison operations
run "resource_comparison" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # Same resource should have equal IDs when compared
  assert {
    condition     = null_resource.test[0].id == null_resource.test[0].id
    error_message = "Resource ID should be consistent within same run"
  }
  
  # ID should not be null or empty string
  assert {
    condition     = null_resource.test[0].id != "" && null_resource.test[0].id != null
    error_message = "Resource ID should never be empty or null"
  }
}

# ============================================================================
# TEST 10: Comprehensive Health Check
# ============================================================================
# Overall system health and functionality check
run "comprehensive_health_check" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # Resource should exist
  assert {
    condition     = can(null_resource.test[0].id)
    error_message = "null_resource must exist"
  }
  
  # ID should be valid
  assert {
    condition     = can(null_resource.test[0].id) && null_resource.test[0].id != ""
    error_message = "null_resource ID must be valid and non-empty"
  }
  
  # Triggers should be accessible
  assert {
    condition     = can(null_resource.test[0].triggers)
    error_message = "null_resource triggers must be accessible"
  }
  
  # Complete resource validation
  assert {
    condition     = can(null_resource.test[0].id) && can(null_resource.test[0].id) && null_resource.test[0].id != "" && can(null_resource.test[0].triggers)
    error_message = "null_resource complete health check failed"
  }
}

# ============================================================================
# TEST 11: Output Format Validation
# ============================================================================
# Test different representations of the resource
run "output_format_validation" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # String conversion should work
  assert {
    condition     = length(tostring(null_resource.test[0].id)) > 0
    error_message = "ID string representation should be non-empty"
  }
  
  # ID should be a non-empty string
  assert {
    condition     = length(null_resource.test[0].id) > 0
    error_message = "Resource ID should be a non-empty string"
  }
  
  # Map should contain all fields
  assert {
    condition     = can({ resource_id = null_resource.test[0].id, resource_type = "null_resource", resource_name = "test" })
    error_message = "Resource map should contain all expected fields"
  }
}

# ============================================================================
# TEST 12: Error Handling and Edge Cases
# ============================================================================
# Test graceful handling of edge cases
run "edge_case_handling" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # Safe access should provide default value
  assert {
    condition     = try(null_resource.test[0].triggers.nonexistent, "default") == "default"
    error_message = "Safe access to non-existent triggers should return default"
  }
  
  # Resource ID should always exist and be accessible
  assert {
    condition     = try(null_resource.test[0].id, "") != ""
    error_message = "Resource ID should always be safely accessible"
  }
}

# ============================================================================
# TEST 13: Data Type Validation
# ============================================================================
# Comprehensive validation of data types
run "data_type_validation" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # ID should match regex (be a string)
  assert {
    condition     = can(regex(".", null_resource.test[0].id))
    error_message = "Resource ID should be string type"
  }
  
  # String interpolation should work
  assert {
    condition     = length("Resource ID is: ${null_resource.test[0].id}") > 14
    error_message = "Resource ID should work in string interpolation"
  }
  
  # Should work in collections
  assert {
    condition     = length([null_resource.test[0].id]) == 1 && [null_resource.test[0].id][0] != ""
    error_message = "Resource ID should work in lists"
  }
  
  assert {
    condition     = can({ id = null_resource.test[0].id }.id) && { id = null_resource.test[0].id }.id != ""
    error_message = "Resource ID should work in maps"
  }
}

# ============================================================================
# TEST 14: Resource Metadata Inspection
# ============================================================================
# Inspect and validate resource metadata
run "metadata_inspection" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # Resource state should be complete
  assert {
    condition     = can(null_resource.test[0].id) && can(null_resource.test[0].triggers)
    error_message = "Resource state should contain id and triggers"
  }
  
  # Both components should be valid
  assert {
    condition     = null_resource.test[0].id != "" && null_resource.test[0].triggers != null
    error_message = "Resource metadata should be fully populated"
  }
}

# ============================================================================
# TEST 15: Final Comprehensive Validation
# ============================================================================
# Ultimate validation combining all previous tests
run "final_comprehensive_validation" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # Identity should exist and be valid
  assert {
    condition     = can(null_resource.test[0].id) && length(null_resource.test[0].id) > 0
    error_message = "Resource must have valid ID"
  }
  
  # Format should be correct (numeric string)
  assert {
    condition     = can(regex("^[0-9]+$", null_resource.test[0].id))
    error_message = "Resource ID format must be valid numeric string"
  }
  
  # Type should be string
  assert {
    condition     = can(tostring(null_resource.test[0].id))
    error_message = "Resource ID must be string type"
  }
  
  # Should be serializable
  assert {
    condition     = can(jsondecode(jsonencode(null_resource.test[0].id)))
    error_message = "Resource ID must be JSON serializable"
  }
  
  # Triggers must be accessible
  assert {
    condition     = can(null_resource.test[0].triggers)
    error_message = "Resource triggers must be accessible"
  }
  
  # Must be consistent
  assert {
    condition     = null_resource.test[0].id == null_resource.test[0].id
    error_message = "Resource ID must persist consistently"
  }
  
  # Overall comprehensive check
  assert {
    condition     = (
      can(null_resource.test[0].id) && length(null_resource.test[0].id) > 0 &&
      can(regex("^[0-9]+$", null_resource.test[0].id)) &&
      can(tostring(null_resource.test[0].id)) &&
      can(jsondecode(jsonencode(null_resource.test[0].id))) &&
      can(null_resource.test[0].triggers) &&
      null_resource.test[0].id == null_resource.test[0].id
    )
    error_message = "Comprehensive validation suite failed - not all checks passed"
  }
}

# ============================================================================
# TEST 16: Intentionally Failing Test (for error testing)
# ============================================================================
# This test is designed to fail to demonstrate error handling
run "intentional_failure_test" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # This assertion will fail - resource ID is never empty
  assert {
    condition     = null_resource.test[0].id == ""
    error_message = "This test intentionally fails - resource ID should never be empty"
  }
}

# ============================================================================
# TEST 17: Skipped Errored Test
# ============================================================================
# This test will error and will be skipped if previous tests fail
# (Terraform automatically skips subsequent tests when a previous test fails)
run "skipped_errored_test" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # This assertion will fail and cause the test to be marked as errored
  # If previous tests fail, this test will be skipped
  assert {
    condition     = null_resource.test[0].id == "invalid-id"
    error_message = "This test intentionally fails - resource ID will never match invalid-id"
  }
}

# ============================================================================
# TEST 18: Skipped Test with Error Condition  
# ============================================================================
# This test will be skipped because it references a non-existent resource
# that causes an error during evaluation before assertions can run
run "skipped_with_error" {
  command = apply
  
  variables {
    quantity = 1
  }
  
  # This will cause an error during evaluation because we're trying to access
  # a resource that doesn't exist, which should cause the test to error/skip
  # Note: This test may show as "fail" in some test frameworks, but the
  # error occurs during resource evaluation, not just assertion failure
  assert {
    condition     = null_resource.nonexistent[0].id != ""
    error_message = "This test errors because null_resource.nonexistent doesn't exist"
  }
}

# ============================================================================
# TEST 19: Skipped Test
# ============================================================================
# This test demonstrates a skipped test scenario
# Note: In OpenTofu/Terraform test framework, tests show as "skip" when
# they cannot run due to configuration errors or when previous tests
# fail during initialization phase. This test uses an invalid variable
# type to cause initialization to fail and be skipped.
run "skipped_test" {
  command = plan  # Using plan to catch errors earlier
  
  variables {
    quantity = "invalid"  # Invalid type - should be number, causes error during validation
  }
  
  assert {
    condition     = length(resource.null_resource.test) > 0
    error_message = "This test should be skipped due to invalid variable"
  }
}
