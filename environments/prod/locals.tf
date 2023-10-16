locals {
  resource_base_name = "rcmd-${var.env_name}"
  vnet_name = "${local.resource_base_name}-vnet"
  app_service_plan_name = "${local.resource_base_name}-asp"
  sql_server_name = "${local.resource_base_name}-sql"
  app_insights_name = "${local.resource_base_name}-ai"
  app_insights_workspace_name = "${local.resource_base_name}-aiws"
  database_name = "rcmd"
  backend_webapp_name = "${local.resource_base_name}-backend"
  frontend_webapp_name = "${local.resource_base_name}-frontend"
}
