module "terraform-submodules-sub1" {
  source = "./tf-sub-sub1"
}

module "terraform-submodules-sub2" {
  source = "./tf-sub-sub2"
}

module "terraform-submodules-sub3" {
  source = "./tf-sub-sub3"
}

module "iam_iam-account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-account"
  version = "5.28.0"
  # insert the 1 required variable here
}

resource "random_pet" "pet" {

}