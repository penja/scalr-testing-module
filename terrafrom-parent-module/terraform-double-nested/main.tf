module "double-one" {
  source = "./terraform-double-one/"
}

module "double-two" {
  source = "./terraform-double-two/"
}

module "parent" {
  source = "../../main.tf"
}