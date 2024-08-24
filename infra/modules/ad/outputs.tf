output "azure_ad_admin_group_id" {
  value = azuread_group.ad_group.object_id
}