data "azuread_client_config" "current" {}

resource "azurerm_user_assigned_identity" "main" {

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  name = "mi-${local.suffix}"
  
}

data "azurerm_subscription" "primary" {
}

resource "azurerm_role_assignment" "contributor" {

  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.main.principal_id

}

resource "azurerm_key_vault_access_policy" "kubelet_user" {

  key_vault_id = azurerm_key_vault.main.id

  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.main.principal_id

  certificate_permissions = [
    "Get", "List"
  ]

  key_permissions = [
    "Get", "List"
  ]

  secret_permissions = [
    "Get", "List"
  ]
}
