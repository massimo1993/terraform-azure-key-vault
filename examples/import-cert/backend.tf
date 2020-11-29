terraform {
  backend "azurerm" {
    resource_group_name  = "rgMassimo"
    storage_account_name = "samassimo"
    container_name       = "tfstate"
    key                  = "key-vault-import-cert.tfstate"
  }
}
