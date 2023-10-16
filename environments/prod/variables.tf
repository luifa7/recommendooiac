variable "primary_region_lowercase_name" {
  default = "westeurope"
}
variable "env_name" {
  default = "prod"
}
variable "aspcore_environment" {
  default = "Production"
}

variable "resource_group_name" {
  default = "rcmd-prod-rg"
}

variable "sql_administrator_login_password" {
  sensitive = true
}