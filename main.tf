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

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "southeastasia"
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "staging"
    Team        = "DevOps"
  }
}
