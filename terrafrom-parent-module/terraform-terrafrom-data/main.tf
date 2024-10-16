resource "terraform_data" "this" {
  count = var.quantity
  input = var.data_input
}

variable "quantity" {
  
}

variable "data_input" {
  
}