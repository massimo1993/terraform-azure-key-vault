resource azurerm_key_vault_key key {
  for_each = {
    for key in var.key_list : key.name => key
  }

  name         = each.value.name
  key_vault_id = azurerm_key_vault.key_vault.id

  key_type = each.value.key.type
  key_size = each.value.key.size
  key_opts = each.value.key.opts

  curve = each.value.key.ec_curve

  not_before_date = each.value.start_date
  expiration_date = each.value.expiration_date

  tags = local.tags

  depends_on = [azurerm_key_vault_access_policy.access_policy]
}
