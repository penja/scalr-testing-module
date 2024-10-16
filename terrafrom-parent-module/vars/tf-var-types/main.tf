resource "null_resource" "simple_types_trigger" {
  triggers = {
    trigger_time = timestamp()
    trigger_01   = var.string
    trigger_02   = var.string_untyped
    trigger_03   = var.number
    trigger_04   = var.number_untyped
    trigger_05   = var.bool
    trigger_06   = var.bool_untyped
  }
}

resource "null_resource" "map_trigger" {
  triggers = var.map
}

resource "null_resource" "map_untyped_trigger" {
  triggers = {
    trigger = var.map_untyped.baz
  }
}

resource "null_resource" "list_trigger" {
  triggers = {
    trigger = var.list[0]
  }
}

resource "null_resource" "list_untyped_trigger" {
  triggers = {
    trigger = var.list_untyped[0]
  }
}

resource "null_resource" "object_trigger" {
  triggers = {
    trigger = var.object.name
  }
}

resource "null_resource" "object_untyped_trigger" {
  triggers = {
    trigger = var.object_untyped.name
  }
}

variable "string" {
  type        = string
  description = "A variable with an explicitly set string type"
  default     = "hello"
}

variable "string_untyped" {
  description = "A variable without an explicitly set type"
  default     = "world"
}

variable "number" {
  type        = number
  description = "A variable with an explicitly set number type"
  default     = 42
}

variable "number_untyped" {
  description = "A variable without an explicitly set type"
  default     = 3.14
}

variable "bool" {
  type        = bool
  description = "A variable with an explicitly set bool type"
  default     = true
}

variable "bool_untyped" {
  description = "A variable without an explicitly set type"
  default     = false
}

variable "list" {
  type        = list(string)
  description = "A variable with an explicitly set list of strings type"
  default     = ["foo", "bar"]
}

variable "list_untyped" {
  description = "A variable without an explicitly set type"
  default     = [1, "two"]
}

variable "set" {
  type        = set(string)
  description = "A variable with an explicitly set set of strings type"
  default     = ["baz", "qux"]
}

variable "set_untyped" {
  description = "A variable without an explicitly set type"
  default     = [true, false]
}

variable "map" {
  type        = map(string)
  description = "A variable with an explicitly set map of strings type"
  default     = { "key1" = "value1", "key2" = "value2" }
}

variable "map_untyped" {
  description = "A variable without an explicitly set type"
  default     = { "foo" = "bar", "baz" = 42, "qux" = [1, 2, 3] }
}

variable "object" {
  type = object({
    name  = string
    value = number
    list  = list(string)
  })
  description = "A variable with an explicitly set object type"
  default = {
    name  = "my_object"
    value = 3.14
    list  = ["one", "two", "three"]
  }
}

variable "object_untyped" {
  description = "A variable without an explicitly set type"
  default = {
    name  = "another_object"
    value = "42"
    list  = [1, 2, 3]
  }
}

variable "tuple" {
  type = tuple([
    string,
    number,
    list(string)
  ])

  default = [
    "hello",
    42,
    ["one", "two", "three"]
  ]
}

variable "tuple_untyped" {
  default = [
    "world",
    123,
    ["four", "five", "six"]
  ]
}

output "string_output" {
  value = var.string
}

output "string_untyped_output" {
  value = var.string_untyped
}

output "number_output" {
  value = var.number
}

output "number_untyped_output" {
  value = var.number_untyped
}

output "bool_output" {
  value = var.bool
}

output "bool_untyped_output" {
  value = var.bool_untyped
}

output "list_output" {
  value = var.list
}

output "list_untyped_output" {
  value = var.list_untyped
}

output "set_output" {
  value = var.set
}

output "set_untyped_output" {
  value = var.set_untyped
}

output "map_output" {
  value = var.map
}

output "map_untyped_output" {
  value = var.map_untyped
}

output "object_output" {
  value = var.object
}

output "object_untyped_output" {
  value = var.object_untyped
}

output "tuple_output" {
  value = var.tuple
}

output "tuple_untyped_output" {
  value = var.tuple_untyped
}
