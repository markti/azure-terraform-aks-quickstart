
resource "azurerm_kubernetes_cluster" "main" {

  name                = "aks-${local.suffix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "synth"
  kubernetes_version  = "1.24.6"
  node_resource_group = "${azurerm_resource_group.main.name}-nodes"

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  default_node_pool {
    name           = "default"
    node_count     = 3
    vm_size        = "Standard_D2_v2"
    vnet_subnet_id = resource.azurerm_subnet.aks.id
  }

  identity {
    type = "UserAssigned"
    identity_ids = [ 
      azurerm_user_assigned_identity.main.id
    ]
  }

  kubelet_identity {
    client_id = azurerm_user_assigned_identity.main.client_id
    object_id = azurerm_user_assigned_identity.main.principal_id
    user_assigned_identity_id = azurerm_user_assigned_identity.main.id
  }

  network_profile {
    network_plugin = "azure"
  }

  depends_on = [
    azurerm_role_assignment.contributor
  ]

}

resource "local_file" "kube_config" {
  content = azurerm_kubernetes_cluster.main.kube_config_raw
  filename = "${path.module}/kube-config.yaml"
}
