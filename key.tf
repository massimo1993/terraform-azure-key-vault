resource azurerm_key_vault_key key {
  for_each = {
    for index, map in var.key_list : index => map
  }

  name         = each.value.name
  key_vault_id = azurerm_key_vault.key_vault.id

  key_type = each.value.key_type
  key_size = each.value.key_size
  key_opts = each.value.key_opts

  curve = each.value.ec_curve

  not_before_date = each.value.start_date
  expiration_date = each.value.expiration_date

  tags = local.tags
}
