locals {
  app_name = "student-mgr"
  location = "East US"
  aks_ad_group_name = "aks-administrator"

  address_space = ["20.0.0.0/16"]
  subnets_map = {
    aks_subnet = {
      name  = "aks-subnet"
      address_prefixes = ["20.0.1.0/24"]
    }
  }
}