output name {
  description = "Generated name for the key vault."
  value       = azurerm_key_vault.key_vault.name
}

output id {
  description = "The ID of the key vault."
  value       = azurerm_key_vault.key_vault.id
}

output vault_uri {
  description = "The URI of the key vault."
  value       = azurerm_key_vault.key_vault.vault_uri
}

output key_list {
  description = "List of ID and version of all the keys created in the key vault."

  value = [
    for key in azurerm_key_vault_key.key : {
      id      = key.id
      version = key.version
    }
  ]
}

output secret_list {
  description = ""

  value = [
    for secret in azurerm_key_vault_secret.secret : {
      id      = secret.id
      version = secret.version
    }
  ]
}
