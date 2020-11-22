locals {
  access_policy = concat(
    [
      {
        object_id = data.azurerm_client_config.current.object_id
        secrets   = ["get", "list", "set", "delete", "recover"]
        keys      = ["get", "list", "create", "delete", "recover"]
        certs     = ["get", "list", "create", "delete", "recover"]
        storage   = ["get", "list", "set", "update", "delete", "recover"]
      }
    ],
    [
      for map in var.access_policy : {
        object_id = data.azuread_service_principal.sp[map.name].object_id
        secrets   = map.secrets
        keys      = map.keys
        certs     = map.certs
        storage   = map.storage
      }

      if map.type == "sp"
    ],
    [
      for map in var.access_policy : {
        object_id = data.azuread_user.user[map.name].object_id
        secrets   = map.secrets
        keys      = map.keys
        certs     = map.certs
        storage   = map.storage
      }

      if map.type == "user"
    ],
    [
      for map in var.access_policy : {
        object_id = data.azuread_group.group[map.name].object_id
        secrets   = map.secrets
        keys      = map.keys
        certs     = map.certs
        storage   = map.storage
      }

      if map.type == "group"
    ],
    [
      for map in var.access_policy : {
        object_id = data.azuread_application.app[map.name].object_id
        secrets   = map.secrets
        keys      = map.keys
        certs     = map.certs
        storage   = map.storage
      }

      if map.type == "app"
    ]
  )
}

data azuread_service_principal sp {
  for_each = {
    for index, map in var.access_policy : map.name => map if map.type == "sp"
  }

  display_name = each.value.name
}

data azuread_user user {
  for_each = {
    for index, map in var.access_policy : map.name => map if map.type == "user"
  }

  user_principal_name = each.value.name
}

data azuread_group group {
  for_each = {
    for index, map in var.access_policy : map.name => map if map.type == "group"
  }

  name = each.value.name
}

data azuread_application app {
  for_each = {
    for index, map in var.access_policy : map.name => map if map.type == "app"
  }

  name = each.value.name
}

resource azurerm_key_vault_access_policy access_policy {
  for_each = {
    for index, map in var.access_policy : index => map
  }

  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.azure.tenant_id
  object_id = local.access_policy[each.value.name].object_id

  secret_permissions      = each.value.secrets
  key_permissions         = each.value.keys
  certificate_permissions = each.value.certs
  storage_permissions     = each.value.storage
}
