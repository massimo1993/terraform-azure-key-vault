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
  description = "List of attributes pertaining to secrets created in the key vault."

  value = [
    for secret in azurerm_key_vault_secret.secret : {
      id      = secret.id
      version = secret.version
    }
  ]
}

output cert_file_list {
  description = "List of attributes pertaining to certificate files that were imported to the key vault."

  value = [
    for cert_file in azurerm_key_vault_certificate.certificate_file : {
      id        = cert_file.id
      secret_id = cert_file.secret_id
      version   = cert_file.version

      thumbprint             = cert_file.thumbprint
      certificate_attributes = cert_file.certificate_attribute
    }
  ]
}

output cert_list {
  description = "List of attributes pertaining to certificate that were created in the key vault."

  value = [
    for cert in azurerm_key_vault_certificate.certificate : {
      id        = cert.id
      secret_id = cert.secret_id
      version   = cert.version

      thumbprint             = cert.thumbprint
      certificate_attributes = cert.certificate_attribute
    }
  ]
}
