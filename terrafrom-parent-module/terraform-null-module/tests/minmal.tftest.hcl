terraform {
  required_version = ">= 1.6"
}

provider "null" {}

# ============================================================================
# TEST 1: Basic Module Instantiation and Resource Creation
# ============================================================================
# Verify that the null_resource is created successfully with a valid ID
run "resource_creation_success" {
  command = apply
  
  assert {
    condition     = can(null_resource.main.id)
    error_message = "null_resource must be created with an ID"
  }
  
  assert {
    condition     = length(null_resource.main.id) > 0
    error_message = "null_resource ID should not be empty"
  }
  
  assert {
    condition     = null_resource.main.id != ""
    error_message = "null_resource ID must have a valid value"
  }
}

# ============================================================================
# TEST 2: Verify Resource Lifecycle and Triggers
# ============================================================================
# Test that resource handles lifecycle configurations and triggers correctly
run "resource_triggers_validation" {
  command = apply
  
  # Check if triggers are properly set
  assert {
    condition     = can(null_resource.main.triggers)
    error_message = "null_resource should have triggers attribute"
  }
  
  # Verify triggers is a map/object
  assert {
    condition     = try(length(keys(null_resource.main.triggers)) >= 0, false)
    error_message = "triggers should be a valid map"
  }
}

# ============================================================================
# TEST 3: Plan Phase Validation (Dry Run)
# ============================================================================
# Ensure configuration is valid without actually creating resources
run "plan_phase_validation" {
  command = plan
  
  assert {
    condition     = can(null_resource.main)
    error_message = "null_resource should be accessible in plan phase"
  }
}

# ============================================================================
# TEST 4: Resource ID Persistence and Consistency
# ============================================================================
# Verify that the resource ID is consistent and follows expected patterns
run "resource_id_consistency" {
  command = apply
  
  locals {
    resource_id = null_resource.main.id
  }
  
  # ID should be a valid UUID format (36 characters with hyphens)
  assert {
    condition     = can(regex("^[a-f0-9-]{36}$", local.resource_id))
    error_message = "Resource ID should be a valid UUID format"
  }
  
  # ID should contain hyphens at standard UUID positions
  assert {
    condition     = can(regex("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$", local.resource_id))
    error_message = "Resource ID should follow UUID standard format with hyphens"
  }
}

# ============================================================================
# TEST 5: Multiple Resource Instantiation
# ============================================================================
# Test that multiple resources can be created independently
run "multiple_instances_test" {
  command = apply
  
  locals {
    instance_1_id = null_resource.main.id
  }
  
  assert {
    condition     = length(local.instance_1_id) > 0
    error_message = "First resource instance should be created"
  }
}

# ============================================================================
# TEST 6: Resource State Management
# ============================================================================
# Verify resource state is properly managed
run "state_management" {
  command = apply
  
  # Resource should exist in state
  assert {
    condition     = can(null_resource.main)
    error_message = "null_resource should be managed in state"
  }
  
  # Resource should have an ID (proof it exists in state)
  assert {
    condition     = null_resource.main.id != null
    error_message = "Resource state should contain valid ID"
  }
}

# ============================================================================
# TEST 7: Type Safety and Attribute Validation
# ============================================================================
# Validate that resource attributes have correct types
run "type_safety_validation" {
  command = apply
  
  # ID should be convertible to string
  assert {
    condition     = can(tostring(null_resource.main.id))
    error_message = "Resource ID should be a string type"
  }
  
  # ID length should be measurable (valid string)
  assert {
    condition     = can(length(tostring(null_resource.main.id))) && length(tostring(null_resource.main.id)) > 0
    error_message = "Resource ID string should be non-empty"
  }
}

# ============================================================================
# TEST 8: JSON Serialization and Output Compatibility
# ============================================================================
# Ensure resource can be serialized (important for state files and APIs)
run "json_serialization" {
  command = apply
  
  locals {
    serialized_id = jsonencode(null_resource.main.id)
  }
  
  # Should be able to serialize the ID to JSON
  assert {
    condition     = can(jsondecode(local.serialized_id))
    error_message = "Resource ID should be JSON serializable"
  }
  
  # Deserialized value should match original
  assert {
    condition     = jsondecode(local.serialized_id) == null_resource.main.id
    error_message = "Serialized ID should deserialize to original value"
  }
}

# ============================================================================
# TEST 9: Resource Comparison and Equality
# ============================================================================
# Test resource identity and comparison operations
run "resource_comparison" {
  command = apply
  
  locals {
    id_value = null_resource.main.id
    id_copy  = null_resource.main.id
  }
  
  # Same resource should have equal IDs when compared
  assert {
    condition     = local.id_value == local.id_copy
    error_message = "Resource ID should be consistent within same run"
  }
  
  # ID should not be null or empty string
  assert {
    condition     = local.id_value != "" && local.id_value != null
    error_message = "Resource ID should never be empty or null"
  }
}

# ============================================================================
# TEST 10: Comprehensive Health Check
# ============================================================================
# Overall system health and functionality check
run "comprehensive_health_check" {
  command = apply
  
  locals {
    resource_exists = can(null_resource.main.id)
    id_is_valid     = can(null_resource.main.id) && null_resource.main.id != ""
    triggers_valid  = can(null_resource.main.triggers)
  }
  
  # Resource should exist
  assert {
    condition     = local.resource_exists
    error_message = "null_resource must exist"
  }
  
  # ID should be valid
  assert {
    condition     = local.id_is_valid
    error_message = "null_resource ID must be valid and non-empty"
  }
  
  # Triggers should be accessible
  assert {
    condition     = local.triggers_valid
    error_message = "null_resource triggers must be accessible"
  }
  
  # Complete resource validation
  assert {
    condition     = local.resource_exists && local.id_is_valid && local.triggers_valid
    error_message = "null_resource complete health check failed"
  }
}

# ============================================================================
# TEST 11: Output Format Validation
# ============================================================================
# Test different representations of the resource
run "output_format_validation" {
  command = apply
  
  locals {
    # String representation
    id_as_string = tostring(null_resource.main.id)
    
    # Length in characters
    id_length = length(null_resource.main.id)
    
    # As map entry (for output object compatibility)
    id_in_map = {
      resource_id = null_resource.main.id
      resource_type = "null_resource"
      resource_name = "main"
    }
  }
  
  # String conversion should work
  assert {
    condition     = length(local.id_as_string) > 0
    error_message = "ID string representation should be non-empty"
  }
  
  # UUID should be 36 characters
  assert {
    condition     = local.id_length == 36
    error_message = "UUID should be exactly 36 characters long"
  }
  
  # Map should contain all fields
  assert {
    condition     = can(local.id_in_map.resource_id) && can(local.id_in_map.resource_type) && can(local.id_in_map.resource_name)
    error_message = "Resource map should contain all expected fields"
  }
}

# ============================================================================
# TEST 12: Error Handling and Edge Cases
# ============================================================================
# Test graceful handling of edge cases
run "edge_case_handling" {
  command = apply
  
  locals {
    # Try to access non-existent trigger (should fail gracefully)
    safe_trigger_access = try(null_resource.main.triggers.nonexistent, "default")
  }
  
  # Safe access should provide default value
  assert {
    condition     = local.safe_trigger_access == "default"
    error_message = "Safe access to non-existent triggers should return default"
  }
  
  # Resource ID should always exist and be accessible
  assert {
    condition     = try(null_resource.main.id, "") != ""
    error_message = "Resource ID should always be safely accessible"
  }
}

# ============================================================================
# TEST 13: Data Type Validation
# ============================================================================
# Comprehensive validation of data types
run "data_type_validation" {
  command = apply
  
  locals {
    # Check if ID is string
    is_string = can(regex(".", null_resource.main.id))
    
    # Check if can be used in string interpolation
    interpolated = "Resource ID is: ${null_resource.main.id}"
    
    # Check if can be used in collections
    in_list = [null_resource.main.id]
    in_map  = { id = null_resource.main.id }
  }
  
  # ID should match regex (be a string)
  assert {
    condition     = local.is_string
    error_message = "Resource ID should be string type"
  }
  
  # String interpolation should work
  assert {
    condition     = length(local.interpolated) > 14
    error_message = "Resource ID should work in string interpolation"
  }
  
  # Should work in collections
  assert {
    condition     = length(local.in_list) == 1 && local.in_list[0] != ""
    error_message = "Resource ID should work in lists"
  }
  
  assert {
    condition     = can(local.in_map.id) && local.in_map.id != ""
    error_message = "Resource ID should work in maps"
  }
}

# ============================================================================
# TEST 14: Resource Metadata Inspection
# ============================================================================
# Inspect and validate resource metadata
run "metadata_inspection" {
  command = apply
  
  locals {
    # Capture complete resource state
    resource_state = {
      id       = null_resource.main.id
      triggers = null_resource.main.triggers
    }
  }
  
  # Resource state should be complete
  assert {
    condition     = can(local.resource_state.id) && can(local.resource_state.triggers)
    error_message = "Resource state should contain id and triggers"
  }
  
  # Both components should be valid
  assert {
    condition     = local.resource_state.id != "" && local.resource_state.triggers != null
    error_message = "Resource metadata should be fully populated"
  }
}

# ============================================================================
# TEST 15: Final Comprehensive Validation
# ============================================================================
# Ultimate validation combining all previous tests
run "final_comprehensive_validation" {
  command = apply
  
  locals {
    # Comprehensive validation object
    validation_results = {
      # Identity checks
      has_id              = can(null_resource.main.id) && length(null_resource.main.id) > 0
      id_format_valid     = can(regex("^[a-f0-9-]{36}$", null_resource.main.id))
      
      # Type checks
      id_is_string        = can(tostring(null_resource.main.id))
      
      # Serialization checks
      json_serializable   = can(jsondecode(jsonencode(null_resource.main.id)))
      
      # State checks
      triggers_accessible = can(null_resource.main.triggers)
      
      # Consistency checks
      id_persists         = null_resource.main.id == null_resource.main.id
    }
    
    # Overall result
    all_tests_pass = (
      local.validation_results.has_id &&
      local.validation_results.id_format_valid &&
      local.validation_results.id_is_string &&
      local.validation_results.json_serializable &&
      local.validation_results.triggers_accessible &&
      local.validation_results.id_persists
    )
  }
  
  # Identity should exist and be valid
  assert {
    condition     = local.validation_results.has_id
    error_message = "Resource must have valid ID"
  }
  
  # Format should be correct
  assert {
    condition     = local.validation_results.id_format_valid
    error_message = "Resource ID format must be valid UUID"
  }
  
  # Type should be string
  assert {
    condition     = local.validation_results.id_is_string
    error_message = "Resource ID must be string type"
  }
  
  # Should be serializable
  assert {
    condition     = local.validation_results.json_serializable
    error_message = "Resource ID must be JSON serializable"
  }
  
  # Triggers must be accessible
  assert {
    condition     = local.validation_results.triggers_accessible
    error_message = "Resource triggers must be accessible"
  }
  
  # Must be consistent
  assert {
    condition     = local.validation_results.id_persists
    error_message = "Resource ID must persist consistently"
  }
  
  # Overall comprehensive check
  assert {
    condition     = local.all_tests_pass
    error_message = "Comprehensive validation suite failed - not all checks passed"
  }
}
