variable info {
  type = object({
    project     = string
    environment = string
    sequence    = string
  })
}

variable tags {
  type = map(string)
}

variable region {
  type = string
}

variable access_policy {
  type = list(object({
    type    = string
    name    = string
    secrets = list(string)
    keys    = list(string)
    certs   = list(string)
    storage = list(string)
  }))
}

variable cert_list {
  type = list(object({
    key = object({
      exportable = bool
      size       = number
      type       = string
      reusable   = bool
    })

    name = string
    type = string

    days_before_expiry = number
    extended_key_usage = list(string)
    key_usage          = list(string)

    subject         = string
    validity_months = number

    subject_alternative_names = list(string)
  }))
}
