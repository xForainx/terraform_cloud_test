terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "3.99.0" #C'est bien de toujours fixer sa version
    }
  }
  backend "azurerm" {
    resource_group_name = "My_RG_Backend"
    storage_account_name = "storageaccountsyl002"
    container_name = "terraform-backend"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features{}
  #iform
  subscription_id = "20234da6-3c1a-4aa7-bd9b-fde8b6a34c40"
  client_id       = "ca7d41da-ddb5-4dc8-a6bf-6280ed503ee0"
  client_secret   = "zhC8Q~CPX2euzzGOtxCQVeQometRvcEu5dyMma_W"
  tenant_id       = "602964a1-dd5c-4127-bf0c-c984ae293c94"
}