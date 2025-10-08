// This is a terraform test file
// It validates that the null_resource is created with the expected count and data.

run "create_test" {
  command = plan

  variables {
    quantity = 3
    json_data = {
      "0" = {
        "key1" = "value1"
        "key2" = "value2"
      }
      "1" = {
        "key1" = "value1"
        "key2" = "value2"
      }
      "2" = {
        "key1" = "value1"
        "key2" = "value2"
      }
    }
  }

  assert {
    condition     = false
    error_message = "Expected false"
  }

  assert {
    condition     = length(resource.null_resource.test) == 3
    error_message = "Expected 3 null_resource.test resources to be created"
  }

  assert {
    condition     = resource.null_resource.test[0].triggers.json_data != ""
    error_message = "json_data trigger should not be empty"
  }
}
