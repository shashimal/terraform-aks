resource "azurerm_log_analytics_workspace" "log_insights" {
  name                = "${var.log_analytics_workspace_name}-${random_uuid.random.id}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku_name
  retention_in_days   = var.retention_in_days
}

resource "random_uuid" "random" {}