variable "sql_server_name" {}
variable database_name {}
variable "location" {}
variable "resource_group_name" {}
variable "administrator_login_password" {
  sensitive = true
}
