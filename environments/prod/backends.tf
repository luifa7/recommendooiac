terraform {
  backend "azurerm" {
    storage_account_name = "rcmdsharedsa"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}