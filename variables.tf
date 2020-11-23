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

variable info {
  type = object({
    project     = string
    environment = string
    sequence    = string
  })

  description = "Info object used to construct naming convention for storage account."
}

variable tags {
  type        = map(string)
  description = "Tags object used to tag storage account."
}

variable resource_group {
  type        = string
  description = "Name of the resource group where the storage account will be deployed."
}

variable region {
  type        = string
  description = "Region where all the storage account will be created."
}

variable sku {
  type        = string
  description = "Name of the SKU used for the key vault, standard vs premium."

  default = "standard"
}

variable enabled_for_deployment {
  type        = bool
  description = "Specifies whether Azure Virtual Machines are permitted to retrieve secrets from the key vault."

  default = false
}

variable enabled_for_disk_encryption {
  type        = bool
  description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the key vault."

  default = false
}

variable enabled_for_template_deployment {
  type        = bool
  description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."

  default = false
}

variable enable_rbac {
  type        = bool
  description = "Specifies whether key vault uses Role Based Access Control (RBAC) for authorization of data actions."

  default = false
}

variable purge_protection_enabled {
  type        = bool
  description = "Specifies if purge protection is enabled for the key vault."

  default = false
}

variable soft_delete_enabled {
  type        = bool
  description = "Specifies if soft delete is enabled for the key vault."

  default = false
}

variable soft_delete_retention {
  type        = number
  description = "Number of days to retain secrets, keys and certificates once soft deleted."

  default = 30
}

variable default_action {
  type        = string
  description = "The default action for the firewall used by the key vault."

  default = "Deny"
}

variable bypass {
  type        = string
  description = "Specifies which traffic can bypass the network rules."

  default = "AzureServices"
}

variable ip_whitelist {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format to allow. By default the IP address used to deploy will be whitelisted."

  default = []
}

variable subnet_whitelist {
  type = list(object({
    resource_group  = string
    virtual_network = string
    subnet          = string
  }))

  description = "List of objects that contains information to look up a subnet. This is a whitelist of subnets to allow for the key vault."
  default     = []
}

variable access_policy {
  type = list(object({
    type    = string
    name    = string
    secrets = list(string)
    keys    = list(string)
    certs   = list(string)
    storage = list(string)
  }))

  description = "List of objects that contains access policies for the key vault."
  default     = []
}

variable key_list {
  type = list(object({
    name            = string
    key_type        = string
    key_size        = number
    key_opts        = list(string)
    ec_curve        = string
    start_date      = string
    expiration_date = string
  }))

  description = "List of objects that contains keys to create inside of a key vault."
  default     = []
}

variable secret_list {
  type = list(object({
    name            = string
    value           = string
    start_date      = string
    expiration_date = string
  }))

  description = "List of objects that contains secrets to create inside of a key vault."
  default     = []
}