output "sql_server_name" {
  value = azurerm_mssql_server.sql_server.name
}

output "sql_server_admin_username" {
  value = azurerm_mssql_server.sql_server.administrator_login
}

output "sql_db_connection_string_without_pass" {
  value = "Server=tcp:${var.sql_server_name}.database.windows.net,1433;Initial Catalog=${var.database_name};Persist Security Info=False;User ID=${local.administrator_login};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}
