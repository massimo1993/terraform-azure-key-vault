# Azure Key Vault

Terraform module that provisions a Key Vault on Azure.

![Key Vault](img/key-vault.png)

**Azure Key Vault** is a cloud service for securely storing and accessing
secrets. A secret is anything that you want to tightly control access to, such
as API keys, passwords, certificates, or cryptographic keys. Key Vault service
supports two types of containers: vaults and managed HSM pools. Vaults support
storing software and HSM-backed keys, secrets, and certificates.

![Key Vault Architecture](img/architecture.png)

# Usage

You can find an example on how to incorporate this module in your project under
[examples](examples/).

The examples folder consist of the following examples:

- `cert`: example creating a certificate inside of a key vault.
- `import-cert`: example importing a certificate inside of a key vault.
- `key`: example creating a RSA key inside of a key vault.
- `secret`: example creating a secret inside of a key vault.
- `subnet-whitelist`: example creating a key vault with a subnet whitelist.

# License

This repository is licensed under the **GNU General Public License v3.0** - see
the [LICENSE](LICENSE) file for details.

# Acknowledgments

[Azure Key Vault Basic Concepts](https://tinyurl.com/y2tm9qqm)
