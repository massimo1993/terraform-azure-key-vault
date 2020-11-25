resource azurerm_key_vault_secret secret {
  for_each = {
    for secret in var.secret_list : secret.name => secret
  }

  name  = each.value.name
  value = each.value.value

  key_vault_id = azurerm_key_vault.key_vault.id

  not_before_date = each.value.start_date
  expiration_date = each.value.expiration_date

  tags = local.tags

  depends_on = [azurerm_key_vault_access_policy.access_policy]
}
