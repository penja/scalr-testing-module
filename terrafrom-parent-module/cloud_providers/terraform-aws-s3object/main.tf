provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_object" "example" {
  key                    = random_pet.object_key.id
  bucket                 = var.bucket_id
  source                 = var.filename
  server_side_encryption = "aws:kms"
}

resource "random_pet" "object_key" {
  keepers = {
    trigger = var.change_to_recreate_object
  }
}

variable "bucket_id" {
  type        = string
  description = "ID of the bucket object show go into"
  default     = ""
}

variable "filename" {
  type        = string
  description = "Name of the file in the workdir that should be encrypted and put into bucket"
  default     = "dummy.file"
}

variable "change_to_recreate_object" {
  type        = string
  description = "Change the value to trigger the object recreation"
}