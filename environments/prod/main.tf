module "network" {
  source   = "../../modules/network"
  resource_group_name = var.resource_group_name
  location = var.primary_region_lowercase_name
  vnet_name = local.vnet_name
}

module "monitoring" {
  source   = "../../modules/monitoring"
  location = var.primary_region_lowercase_name
  resource_group_name = var.resource_group_name
  app_insights_name = local.app_insights_name
  workspace_name    = local.app_insights_workspace_name
}

module "web_services" {
  source   = "../../modules/web_services"
  location = var.primary_region_lowercase_name
  sku_name = "Basic1"
  app_service_plan_name = local.app_service_plan_name
  backend_webapp_name = local.backend_webapp_name
  frontend_webapp_name = local.frontend_webapp_name
  resource_group_name = var.resource_group_name
  app_insights_connection_string = module.monitoring.app_insights_connection_string
  sql_db_connection_string_without_pass = module.database.sql_db_connection_string_without_pass
  sql_server_admin_password = var.sql_administrator_login_password
  aspcore_environment = var.aspcore_environment
  subnet_id = module.network.subnet_id
}

module "database" {
  source   = "../../modules/database"
  location = var.primary_region_lowercase_name
  sql_server_name = local.sql_server_name
  database_name = local.database_name
  resource_group_name = var.resource_group_name
  administrator_login_password = var.sql_administrator_login_password
}
