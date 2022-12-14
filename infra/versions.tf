terraform {
  #required_version = ">= 0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"      
      version = "~> 3.31.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.2.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}