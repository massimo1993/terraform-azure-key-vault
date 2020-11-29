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

variable key_list {
  type = list(object({
    name            = string
    start_date      = string
    expiration_date = string

    key = object({
      type     = string
      size     = number
      opts     = list(string)
      ec_curve = string
    })
  }))
}
