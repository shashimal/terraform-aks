variable "location" {
  description = "AZ location"
  type = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

variable "name" {
  description = "Vnet name"
  type = string
}

variable "address_space" {
  description = "Vnet address space"
  type = list(string)
}

variable "subnets" {
  description = "List of subnets to be created"
  type = map(object({
    name = string
    address_prefixes = list(string)
    service_endpoints = optional(list(string), [])
  }))
}