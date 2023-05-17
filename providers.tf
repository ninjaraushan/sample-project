
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
terraform { 
  backend "azure" {} 
}
  required_version = ">= 1.1.0"
}
data "azurerm_client_config" "current" {
}

provider "azuread" {
  tenant_id = "cfcb982c-1e5e-4a67-b075-d2f6f2713765"
  client_id       = "44922970-f11c-4f5a-8434-0b25061107d1"
  client_secret   = "DYJ8Q~5YlF8MkpzEjhT6lX.Hbq3SvcM7_stP9dhQ"
}
provider "azurerm" {
  
  tenant_id       = "cfcb982c-1e5e-4a67-b075-d2f6f2713765"
  subscription_id = "91eb76c6-8637-4c9b-9879-2bbbe5b5d205"
  client_id       = "44922970-f11c-4f5a-8434-0b25061107d1"
  client_secret   = "DYJ8Q~5YlF8MkpzEjhT6lX.Hbq3SvcM7_stP9dhQ"
  features {}

}



data "azurerm_subscription" "current" {}
