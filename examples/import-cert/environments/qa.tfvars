info = {
  project     = "Gemini"
  environment = "QA"
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
    name    = "adf-gemini-qa-001"
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

cert_file_list = [
  {
    name     = "example"
    file     = "certs/example.pem"
    password = null
    type     = "pem"

    key = {
      exportable = true
      size       = 4096
      type       = "RSA"
      reusable   = false
    }
  }
]
