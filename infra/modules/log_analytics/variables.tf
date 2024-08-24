variable "location" {
  description = "AZ location"
  type = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

variable "log_analytics_workspace_name" {
  description = "Log analytics workspace name"
  type = string
}

variable "sku_name" {
  description = "The SKU of the Log Analytics Workspace."
  type        = string
  default = "PerGB2018"
}

variable "retention_in_days" {
  description = "The number of days to retain data in the Log Analytics Workspace."
  type        = number
  default = 30
}