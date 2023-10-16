resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.1.0/24"]

  delegation {
    name = "delegation"
    service_delegation {
      name       = "Microsoft.Web/serverFarms"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  
  private_endpoint_network_policies_enabled = true
  private_link_service_network_policies_enabled = false
}
