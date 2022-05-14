resource "azurerm_storage_account" "fsa_sa" {
  name                     = "monkosfsainfrastor"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # tfsec warning
  min_tls_version = "TLS1_2"
  # tfsec warning
}

resource "azurerm_storage_share" "fsa_share" {
  name                 = "monkosfsainfrashare"
  storage_account_name = azurerm_storage_account.fsa_sa.name
  quota                = 50
}