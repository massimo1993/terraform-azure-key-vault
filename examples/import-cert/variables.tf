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

variable cert_file_list {
  type = list(object({
    name     = string
    file     = string
    password = string
    type     = string

    key = object({
      exportable = bool
      size       = number
      type       = string
      reusable   = bool
    })
  }))
}
