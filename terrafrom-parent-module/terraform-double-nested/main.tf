module "double-one" {
  source = "./terraform-double-one/"
}

module "double-two" {
  source = "./terraform-double-two/"
}

module "parent_folder" {
  source = "./../terraform-1ver-module"
}