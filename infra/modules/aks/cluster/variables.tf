variable "location" {
  description = "AZ location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "default_node_pool_name" {
  description = "Default node pool name"
  type        = string
  default     = "systempool"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "enable_auto_scaling" {
  description = "Enable auto scaling for the nodes"
  type        = bool
  default     = true
}

variable "max_count" {
  description = "Maximum count of instances"
  type        = number
  default     = 2
}

variable "min_count" {
  description = "Minimum count of instances"
  type        = number
  default     = 1
}

variable "os_disk_size_gb" {
  description = "OS disk size"
  type        = number
  default     = 20
}

variable "default_node_pool_type" {
  description = "Default node pool type"
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "vnet_subnet_id" {
  description = "Vnet subnet id"
  type        = string
}

variable "tags" {
  description = "Tags"
  type = map(string)
  default = {}
}

variable "default_node_pool_tags" {
  description = "Tags"
  type = map(string)
  default = {}
}

variable "log_analytics_workspace_id" {
  description = "Log analytics workspace id"
  type        = string
  default     = null
}

variable "admin_group_object_ids" {
  description = "A list of Azure AD group object IDs that will be granted cluster-admin access to the AKS cluster."
  type = list(string)
}

variable "linux_admin_username" {
  description = "Linux admin username"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}
