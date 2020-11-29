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

cert_list = [
  {
    key = {
      exportable = true
      size       = 4096
      type       = "RSA"
      reusable   = false
    }

    name = "example"
    type = "pem"

    days_before_expiry = 30
    extended_key_usage = ["1.3.6.1.5.5.7.3.1"]

    key_usage = [
      "digitalSignature",
      "dataEncipherment",
      "keyEncipherment",
      "keyCertSign"
    ]

    subject         = "CN=example.com"
    validity_months = 24

    subject_alternative_names = []
  }
]
