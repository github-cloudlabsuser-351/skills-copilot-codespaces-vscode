provider "azurerm" {
  features {}
}

variable "location" {
  description = "The location where the resources should be created"
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "The name of the storage account"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}