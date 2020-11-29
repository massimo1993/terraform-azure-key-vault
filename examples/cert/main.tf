# Environment variables should be used for authentication.
#
# ARM_SUBSCRIPTION_ID
# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# ARM_TENANT_ID
#
# Reference the Azure Provider documentation for more information.
#
# https://www.terraform.io/docs/providers/azurerm/index.html

module resource_group {
  source  = "massimo1993/resource-group/azure"
  version = "0.0.2"

  info = var.info
  tags = var.tags

  region = var.region
}

module key_vault {
  source  = "massimo1993/key-vault/azure"
  version = "0.0.2"

  info = var.info
  tags = var.tags

  resource_group = module.resource_group.name
  region         = var.region

  access_policy = var.access_policy
  cert_list     = var.cert_list
}
