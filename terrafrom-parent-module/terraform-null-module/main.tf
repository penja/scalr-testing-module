resource "null_resource" "test" {
  count = var.quantity
  triggers = {
     trigger = timestamp()
     json_data   = jsonencode(var.json_data)
   }
}

variable "json_data" {
  default = {
    "0" = {
    "key1" = "value1value1value1value1value1value1value1"
    "key2" = "value2value2value2value2value2value2value2"
  }
  "1" = {
     "key1" = "value1value1value1value1value1value1value1"
     "key2" = "value2value2value2value2value2value2value2"
  }
  "2" = {
     "key1" = "value1value1value1value1value1value1value1"
     "key2" = "value2value2value2value2value2value2value2"
  }
  "3" = {
    "key1" = "value1value1value1value1value1value1value1"
    "key2" = "value2value2value2value2value2value2value2"
  }
  "4" = {
     "key1" = "value1value1value1value1value1value1value1"
     "key2" = "value2value2value2value2value2value2value2"
  }
  }
}

variable "quantity" {
  type        = number
  description = "Number of resources to be created"
}
