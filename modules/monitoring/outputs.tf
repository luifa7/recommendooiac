output "app_insights_connection_string" {
  value = azurerm_application_insights.app_insights.instrumentation_key
}

output "app_insights_id" {
  value = azurerm_application_insights.app_insights.id
}
