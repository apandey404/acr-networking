terraform {

  required_version = ">=1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.83.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
