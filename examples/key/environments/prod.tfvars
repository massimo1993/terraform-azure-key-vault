info = {
  project     = "Gemini"
  environment = "Prod"
  sequence    = "001"
}

tags = {
  source  = "Terraform"
  owner   = "Massimo Cannavo"
}

region = "South Central US"

access_policy = [
  {
    type    = "sp"
    name    = "adf-gemini-prod-001"
    secrets = ["list", "get"]
    keys    = []
    certs   = []
    storage = []
  },
  {
    type    = "user"
    name    = "massimo5cannavo@gmail.com"
    secrets = ["list", "get", "set", "delete"]
    keys    = ["list", "get", "create", "delete"]
    certs   = ["list", "get", "create", "delete"]
    storage = []
  }
]

key_list = [
  {
    name            = "rsa-key"
    start_date      = "2020-11-28T23:34:02Z"
    expiration_date = "2022-11-28T23:34:02Z"

    key = {
      type     = "RSA"
      size     = 4096
      opts     = ["encrypt", "decrypt", "sign", "verify", "wrapKey", "unwrapKey"]
      ec_curve = null
    }
  }
]
