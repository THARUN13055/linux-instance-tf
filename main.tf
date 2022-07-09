terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "8272e6d8-e036-4533-a2ca-e060e28ebf51"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "terraform" {
  name     = "learning"
  location = "east us"
}