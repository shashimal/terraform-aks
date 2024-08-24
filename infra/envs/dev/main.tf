module "resource_group" {
  source = "../../modules/resource_group"

  name     = "${local.app_name}-aks-rg"
  location = local.location
}