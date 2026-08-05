resource "random_pet" "after" {
  keepers = {
    timestamp = timestamp()
  }
  provisioner "local-exec" {
    command = "sleep 3"
  }
}

module "git_reference_ref_master" {
  count    = 100
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}


module "mod_001" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_002" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_003" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_004" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_005" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_006" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_007" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_008" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_009" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_010" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_011" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_012" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_013" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_014" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_015" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_016" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_017" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_018" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}

module "mod_019" {
  source   = "git::https://github.com/penja/scalr-testing-module//terrafrom-parent-module/terraform-null-module?ref=master"
  quantity = 1
}