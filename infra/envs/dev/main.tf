# Resource group for the AKS
module "resource_group" {
  source = "../../modules/resource_group"

  name     = "${local.app_name}-aks-rg"
  location = local.location
}

# AD group for AKS users
module "aks_ad_group" {
  source = "../../modules/ad"

  ad_name = local.aks_ad_group_name
}

# Log analytics workspace
module "log_analytics" {
  source = "../../modules/log_analytics"

  log_analytics_workspace_name = local.app_name
  location                     = module.resource_group.location
  resource_group_name          = module.resource_group.name
}

# VNET

module "vnet" {
  source = "../../modules/vnet"

  name                = "${local.app_name}-vnet"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = local.address_space
  subnets             = local.subnets_map
}

# AKS cluster
module "cluster" {

  source = "../../modules/aks/cluster"

  cluster_name        = local.app_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version

  # Default node pool settings
  default_node_pool_name = "${replace(local.app_name,"-","" )}np"
  enable_auto_scaling    = true
  min_count              = 1
  max_count              = 2
  os_disk_size_gb        = 30
  default_node_pool_type = "VirtualMachineScaleSets"
  vnet_subnet_id = module.vnet.subnets["aks_subnet"].id

  # Add On Profiles
  log_analytics_workspace_id = module.log_analytics.log_analytic_workspace_id
  admin_group_object_ids = [module.aks_ad_group.azure_ad_admin_group_id]
  linux_admin_username       = "ubuntu"
  ssh_public_key             = "/Users/duleendra/.ssh/aks-terraform-devops-ssh-key-ububtu.pub"
}


# output "d" {
#   value = data.azurerm_kubernetes_service_versions.current.latest_version
# }