

locals {
  administrator_login = "${var.sql_server_name}-admin"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "12.0"
  administrator_login          = local.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_firewall_rule" "allow_all_windows_azure_ips" {
  name                = "AllowAllWindowsAzureIps"
  server_id = azurerm_mssql_server.sql_server.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mssql_database" "sql_db" {
  name                = var.database_name
  server_id = azurerm_mssql_server.sql_server.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  sku                 = "Basic"
  zone_redundant      = false
}

