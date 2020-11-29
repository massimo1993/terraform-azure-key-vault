# Azure Key Vault

Terraform module that provisions a Key Vault on Azure.

![Key Vault](https://tinyurl.com/y6gnrb5w)

**Azure Key Vault** is a cloud service for securely storing and accessing
secrets. A secret is anything that you want to tightly control access to, such
as API keys, passwords, certificates, or cryptographic keys. Key Vault service
supports two types of containers: vaults and managed HSM pools. Vaults support
storing software and HSM-backed keys, secrets, and certificates.

![Key Vault Architecture](https://tinyurl.com/yy9jqova)

# Usage

You can find an example on how to incorporate this module in your project under
[examples](https://tinyurl.com/y52m6fdp).

The examples folder consist of the following examples:

- `cert`: example creating a certificate inside of a key vault.
- `import-cert`: example importing a certificate inside of a key vault.
- `key`: example creating a RSA key inside of a key vault.
- `secret`: example creating a secret inside of a key vault.
- `subnet-whitelist`: example creating a key vault with a subnet whitelist.

**Note**: Key Vault at the moment only supports importing **PKCS #8** PEM
certificates, PKCS #1 will not work. PFX certificates are also supported.

You can easily convert to PKCS #8 using the following command:

```
$ openssl pkcs8 \
    -in cert.pem \
    -topk8 \
    -nocrypt \
    -out cert-pk8.pem
```

# License

This repository is licensed under the **GNU General Public License v3.0** - see
the [LICENSE](https://tinyurl.com/yyp4l35t) file for details.

# Acknowledgments

[Azure Key Vault Basic Concepts](https://tinyurl.com/y2tm9qqm)
