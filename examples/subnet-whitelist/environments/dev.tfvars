info = {
  project     = "Gemini"
  environment = "Dev"
  sequence    = "001"
}

tags = {
  source  = "Terraform"
  owner   = "Massimo Cannavo"
}

region = "South Central US"

subnet_whitelist = [
  {
    resource_group  = "rgVnetD01"
    virtual_network = "vnetD01"
    subnet_name     = "snetD066"
  }
]

access_policy = [
  {
    type    = "sp"
    name    = "adf-gemini-dev-001"
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
