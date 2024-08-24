resource "azuread_group" "ad_group" {
  display_name        = var.ad_name
  description = "AD group for ${var.ad_name}"
  security_enabled = true
  mail_nickname = "${var.ad_name}-unique"
}
