# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "crayonmalaysia"
    storage_account_name = "crayonmalaysia"
    container_name       = "abdyusma"
    key                  = "terraform.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rahman-rg"
  location = "southeastasia"
}

resource "azurerm_resource_group" "rg2" {
  name     = "rahman3-rg"
  location = "southeastasia"
}
