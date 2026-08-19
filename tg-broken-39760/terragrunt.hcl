terraform {
  source = "./module"
  # deliberately malformed HCL: unclosed block and bad token
  this is not valid hcl @@@
