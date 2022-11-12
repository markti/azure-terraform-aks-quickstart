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