variable "app_service_plan_name" {}
variable "backend_webapp_name" {}
variable "frontend_webapp_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "sku_name" {
  type = string
  validation {
    condition     = var.sku_name == "Basic1" || var.sku_name == "Standard1"
    error_message = "The sku_name must be either Basic1 or Standard1."
  }
}
variable "app_insights_connection_string" {}
variable "sql_db_connection_string_without_pass" {}
variable "sql_server_admin_password" {
  sensitive = true
}
variable "aspcore_environment" {}
variable "app_settings" {
  type = map(string)
  default = {}
}
variable "subnet_id" {
}
