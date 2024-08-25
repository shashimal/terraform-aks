# Datasource to get Azure AKS latest versions
data "azurerm_kubernetes_service_versions" "current" {
  location        = local.location
  include_preview = false
}