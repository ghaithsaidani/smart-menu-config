terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }

    random = {
        source = "hashicorp/random"
        version = "~> 3.6.3"
    }
  }

  required_version = ">=1.1.0"
}

provider "azuread" {
  
}

provider "azurerm" {
  features {}
}
