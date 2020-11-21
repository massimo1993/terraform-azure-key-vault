locals {
  ip_addresses = [
    for ip in var.ip_whitelist :
      replace(ip, "/32", "")
  ]

  current_ip   = [chomp(data.http.ip_address.body)]
  ip_whitelist = concat(local.ip_addresses, local.current_ip)

  subnet_whitelist = [
    for subnet in data.azurerm_subnet.subnet : subnet.id
  ]
}

resource azurerm_key_vault key_vault {
  name = format("%s-%s-%03d",
    substr(
      module.naming.key_vault.name, 0,
      module.naming.key_vault.max_length - 6
    ),
    substr(local.environment, 0, 3),
    var.info.sequence
  )

  resource_group_name = var.resource_group
  location            = var.region

  sku_name  = var.sku
  tenant_id = data.azurerm_client_config.azure.tenant_id

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  enable_rbac_authorization = var.enable_rbac
  purge_protection_enabled  = var.purge_protection_enabled

  soft_delete_enabled        = var.soft_delete_enabled
  soft_delete_retention_days = var.soft_delete_retention

  network_acls {
    default_action = var.default_action
    bypass         = var.bypass

    ip_rules                   = local.ip_whitelist
    virtual_network_subnet_ids = local.subnet_whitelist
  }

  tags = local.tags
}
