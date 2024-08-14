# Security Notice: Using Ansible Vault to Protect Sensitive Data (Optional)

## Purpose

To ensure the security of sensitive data, such as certificates, passwords, and keys, it is recommended to use Ansible Vault. This approach keeps sensitive information encrypted and secure, preventing unauthorized access.

## Steps to Use Ansible Vault

### 1. Create a Variables File for Sensitive Data

Rewrite your `ssl_client_key` stored in the file named `vault.yml` in this directory (`group_var`). This file will contain the sensitive data that you want to encrypt. For example:

```yaml
ssl_client_cert: |
  -----BEGIN CERTIFICATE-----
  MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
  IBcNMjQwMTExMTY0MTI5WhgPMjEyMzEyMTgxNjQxMjlaMBMxETAPBgNVBAMMCEdv
  emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAuUSlCZ4ZzXGQ
  FLlL5PgMicwNHu0Xh7QjnT7CF2vq0VeyNqQo7v7tY5EhtGNJKAXdtbIOEUQoD9An
  w4JKw0nLgDPMavlBYVyfvqqcz38r3Mf/w7SC+Fk0SY7dGhMZkkQAcHPgA0sC9BYX
  k3F8dggIRnJnZXfwkB+XZwPuVGas8y/8VWidlk7agYg2bhVsmhFqCQbYpA6oXAT7
  B2wUn12uFz/svwby6jiMn9J6jhy19dTOhK7K6VvVbfA4sCREoZ2K2zjsOizc7Amx
  aEbZpUI5F2so20k2LMZiWjhOTfTENX73F4APhCf5M0smugEptCi1vRr6jkvIxc9N
  9Ic5OV8FH/4QAhgDw+1s3KQy1vF3bkM9UjBMkX3ffGN+lwyn0+El2uTvPcUkgJ6d
  W0Ft49yzy+31+V/0YBwbEEF903xMXfV8ekAX5BLe2bbbyDxsu2Dw7x0/fn8tSNWy
  H6JuNgSyLvFjZPIpNm/Nl6ldU7eJH7WIPsGqlae6wYB5OtA15QNXgy9J1HeORRid
  juc32HDCLzQ6iPkzX+fkwpLpMx0khDxo6k1iSjYR3+WgoFsq4q+tgfGPM84ojKbr
  agHe6/ErFyxPQsPrbeSq/lHtswXYPEAF1lEeL/9D4f2p+1+CRmCo9Ba1u4VFTJNw
  veL/UCchZqiTS4mt/nAQoR/cDykzP8ECAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
  aXK0aXk/QBf/fXvaE0BsJwAwWwavDFC6Tao5k1epUfZkz2n2mYHTgBjURacJlQrV
  uv0381teBJV3Agex80HNIFSl0YwcwGm7sgo1rksWpyiynGbBJhKfLLW/c0r78Azz
  VrnrKnlVRpHfIhSaPO1Q+Re5dpuLNzjbyc1Y7yuXKNaMzuVHQI1QbyBi0wYq2swG
  Vc4x+ExxH6ZSD4GOs8zunsFA7IFMjtFpoJSrpqajnUCfdRQjiZBchfza4SxxJLmq
  2vIe3+67ZVV7v1MMRP1ewtnERSF4Hfx3ljCaVlhvHVvkcWxSIXGKQKAGptPDCqUA
  0HjZi+qaFjLXtuUtmd1OjQvc/4BBp7Gl2cken6XS60Ur0sgd5HpvZZ76ZXldD+o0
  bRG93SvAkooIoTBL7+w7AWV/LOG3d0EOIQqRHF1RyoXbsHaAfTg3ASXOQRVRDEgm
  WVwsLgQJog0D2GZIHtpm9c9OpjZfjPX6L73H7NABikAWgMdNcX8hx8ANsZGfnmni
  e6SfQzsrMocPn8T+lEzZgH68ZPprpwWDVTR0wKc1YQW+0fUvh9hg0hGEcotoZZ9X
  kWA/Zrn5bRF7YLv2XkKymU2YguEDxlfn4omNE5xB9EoJUBpD3ymqLXRC8Mdl4lTP
  +3VQvDvQnMiwso3Szod/JbuiCMTTONj/uNWgslitBvY=
  -----END CERTIFICATE-----
```

### 2. Encrypt the Variables File

Encrypt the `vault.yml` file using the following command:

```sh
ansible-vault encrypt group_vars/vault.yml
```

You will be prompted to enter a password. Make sure to remember this password, as you will need it to decrypt the file later.

### 3. Run the Playbook with Ansible Vault

When running the playbook, provide the vault password to decrypt the variables file:

```sh
ansible-playbook playbooks/site.yml --ask-vault-pass
```

You will be prompted to enter the password you used to encrypt the `vault.yml` file.
