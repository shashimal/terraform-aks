#Resource group for the AKS
module "resource_group" {
  source = "../../modules/resource_group"

  name     = "${local.app_name}-aks-rg"
  location = local.location
}

module "log_analytics" {
  source                       = "../../modules/log_analytics"

  log_analytics_workspace_name = local.app_name
  location                     = local.location
  resource_group_name          = module.resource_group.name
}