terraform {
  required_providers {
    zerossl = {
      source = "toowoxx/zerossl"
    }
  }
}

resource "zerossl_eab_credentials" "eab_credentials" {
  api_key = var.zerossl_api_key
}

variable "zerossl_api_key" {
  type        = string
  description = "Copy key here: https://app.zerossl.com/developer. Register if necessary"
  sensitive   = true
}