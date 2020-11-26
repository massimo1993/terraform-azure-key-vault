locals {
  access_policy = merge(
    {
      current_user = {
        object_id = data.azurerm_client_config.azure.object_id
        name      = "current_user"
        secrets   = ["get", "list", "set", "delete", "recover"]
        keys      = ["get", "list", "create", "delete", "recover"]
        certs     = ["get", "list", "create", "delete", "recover"]
        storage   = ["get", "list", "set", "update", "delete", "recover"]
      }
    },
    {
      for policy in var.access_policy :
        policy.name => {
          object_id = data.azuread_service_principal.sp[policy.name].object_id
          name      = policy.name
          secrets   = policy.secrets
          keys      = policy.keys
          certs     = policy.certs
          storage   = policy.storage
        }

      if policy.type == "sp"
    },
    {
      for policy in var.access_policy :
        policy.name => {
          object_id = data.azuread_user.user[policy.name].object_id
          name      = policy.name
          secrets   = policy.secrets
          keys      = policy.keys
          certs     = policy.certs
          storage   = policy.storage
        }

      if policy.type == "user"
    },
    {
      for policy in var.access_policy :
        policy.name => {
          object_id = data.azuread_group.group[policy.name].object_id
          name      = policy.name
          secrets   = policy.secrets
          keys      = policy.keys
          certs     = policy.certs
          storage   = policy.storage
        }

      if policy.type == "group"
    },
    {
      for policy in var.access_policy :
        policy.name => {
          object_id = data.azuread_application.app[policy.name].object_id
          name      = policy.name
          secrets   = policy.secrets
          keys      = policy.keys
          certs     = policy.certs
          storage   = policy.storage
        }

      if policy.type == "app"
    }
  )
}

data azuread_service_principal sp {
  for_each = {
    for policy in var.access_policy : 
      policy.name => policy if policy.type == "sp"
  }

  display_name = each.value.name
}

data azuread_user user {
  for_each = {
    for policy in var.access_policy :
      policy.name => policy if policy.type == "user"
  }

  user_principal_name = each.value.name
}

data azuread_group group {
  for_each = {
    for policy in var.access_policy :
      policy.name => policy if policy.type == "group"
  }

  name = each.value.name
}

data azuread_application app {
  for_each = {
    for policy in var.access_policy :
      policy.name => policy if policy.type == "app"
  }

  name = each.value.name
}

resource azurerm_key_vault_access_policy access_policy {
  for_each = local.access_policy

  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.azure.tenant_id
  object_id = each.value.object_id

  secret_permissions      = each.value.secrets
  key_permissions         = each.value.keys
  certificate_permissions = each.value.certs
  storage_permissions     = each.value.storage
}
