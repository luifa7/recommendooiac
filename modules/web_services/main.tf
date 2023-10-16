locals {
  all_skus = {
    Standard1 = {
      name     = "S1"
      tier     = "Standard"
      size     = "S1"
      family   = "S"
      capacity = 1
    }
    Basic1 = {
      name     = "B1"
      tier     = "Basic"
      size     = "B1"
      family   = "B"
      capacity = 1
    }
  }
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}

// Backend Web App
resource "azurerm_linux_web_app" "backend_webapp" {
  name                = var.backend_webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.app_service_plan.id
  https_only          = true

  site_config {
    always_on        = true
    ftps_state       = "Disabled"
  }

  app_settings = merge(
    var.app_settings,
    {
      "ApplicationInsights__ConnectionString" = var.app_insights_connection_string,
      "DatabaseConfig__ConnectionString"      = "${var.sql_db_connection_string_without_pass}Password=${var.sql_server_admin_password};",
      "ASPNETCORE_ENVIRONMENT"                = var.aspcore_environment
    }
  )

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "web_app_backend_network_config" {
  app_service_id = azurerm_linux_web_app.backend_webapp.id
  subnet_id      = var.subnet_id
}

// Frontend Web App
resource "azurerm_linux_web_app" "frontend_webapp" {
  name                = var.frontend_webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.app_service_plan.id
  https_only          = true

  site_config {
    always_on        = true
    ftps_state       = "Disabled"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "web_app_frontend_network_config" {
  app_service_id = azurerm_linux_web_app.frontend_webapp.id
  subnet_id      = var.subnet_id
}