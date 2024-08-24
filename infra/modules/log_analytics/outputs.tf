output "log_analytic_workspace_id" {
  description = "Log analytics workspace id"
  value = azurerm_log_analytics_workspace.log_insights.id
}