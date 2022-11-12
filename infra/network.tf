
resource "azurerm_virtual_network" "main" {

  name                = "vnet-${local.suffix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["${var.network_prefix}.0.0/16"]

}

resource "azurerm_subnet" "bastion" {
    
  name                 = "AzureBastionSubnet"

  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes     = ["${var.network_prefix}.0.0/24"]

}

resource "azurerm_subnet" "gateway" {

  name                 = "GatewaySubnet"

  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes     = ["${var.network_prefix}.1.0/24"]

}

resource "azurerm_subnet" "aks" {

  name                 = "snet-aks"

  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes     = ["${var.network_prefix}.5.0/24"]

}

