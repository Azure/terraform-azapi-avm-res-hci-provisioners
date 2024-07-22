provider "azurerm" {
  features {
    resource_group {
      // allow delete test resource group
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscriptionId
}

provider "azapi" {
  subscription_id = var.subscriptionId
}
