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

secret_list = [
  {
    name            = "super-secret"
    value           = "morpheus"
    start_date      = null
    expiration_date = null
  }
]
