terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "c44ea3f0-33ec-4b36-95ce-e51ee2ffd47b"
  features {}

  }
  # Configuration options

