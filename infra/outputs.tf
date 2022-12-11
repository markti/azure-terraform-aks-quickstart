output "admin_password" {
  value       = azurerm_container_registry.main.admin_password
  description = "The object ID of the user"
  sensitive   = true
}
output "admin_username" {
  value       = azurerm_container_registry.main.admin_username
  description = "The object ID of the user"
  sensitive   = true
}