locals {
  cert_types = {
    pem = "application/x-pem-file"
    pfx = "application/x-pkcs12"
  }
}

resource azurerm_key_vault_certificate certificate_file {
  for_each = {
    for cert in var.cert_file_list : cert.name => cert
  }

  name         = each.value.name
  key_vault_id = azurerm_key_vault.key_vault.id

  certificate {
    contents = filebase64(each.value.file)
    password = each.value.password
  }

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = each.value.key.exportable
      key_size   = each.value.key.size
      key_type   = each.value.key.type
      reuse_key  = each.value.key.reusable
    }

    secret_properties {
      content_type = local.cert_types[each.value.type]
    }
  }

  depends_on = [azurerm_key_vault_access_policy.access_policy]
}

resource azurerm_key_vault_certificate certificate {
  for_each = {
    for cert in var.cert_list : cert.name => cert
  }

  name         = each.value.name
  key_vault_id = azurerm_key_vault.key_vault.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = each.value.key.exportable
      key_size   = each.value.key.size
      key_type   = each.value.key.type
      reuse_key  = each.value.key.reusable
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = each.value.renewal_period
      }
    }

    secret_properties {
      content_type = local.cert_types[each.value.type]
    }

    x509_certificate_properties {
      extended_key_usage = each.value.extended_key_usage
      key_usage          = each.value.key_usage

      subject            = each.value.subject
      validity_in_months = each.value.validity_months

      subject_alternative_names {
        dns_names = each.value.subject_alternative_names.dns_names
      }
    }
  }

  depends_on = [azurerm_key_vault_access_policy.access_policy]
}
