resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  node_resource_group = "${var.resource_group_name}-nrg"

  default_node_pool {
    name                 = var.default_node_pool_name
    vm_size              = var.vm_size
    orchestrator_version = var.kubernetes_version
    enable_auto_scaling  = var.enable_auto_scaling
    max_count            = var.max_count
    min_count            = var.min_count
    os_disk_size_gb      = var.os_disk_size_gb
    type                 = var.default_node_pool_type
    vnet_subnet_id       = var.vnet_subnet_id

    node_labels = {
      "nodepool-type" = "system"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }

    tags = merge(var.default_node_pool_tags, {
      "node_pool_type" = "system"
      "node_pool_os"   = "linux"
      "app"            = "system-apps"
    })
  }

  identity {
    type = "SystemAssigned"
  }

  azure_policy_enabled = true

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = var.admin_group_object_ids
  }

  linux_profile {
    admin_username = var.linux_admin_username
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin = "azure"
  }

  tags = var.tags
}