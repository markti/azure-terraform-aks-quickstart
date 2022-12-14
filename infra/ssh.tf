resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "azurerm_key_vault_secret" "ssh_public" {

  key_vault_id = azurerm_key_vault.main.id

  name         = "ssh-public"
  value        = tls_private_key.ssh.public_key_openssh

}

resource "azurerm_key_vault_secret" "ssh_private" {

  key_vault_id = azurerm_key_vault.main.id

  name         = "ssh-private"
  value        = trimspace(tls_private_key.ssh.private_key_pem)

}
