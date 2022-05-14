resource "azurerm_container_group" "jenkins" {
  name                = "${var.resource_group}-jenkins-server"
  location            = var.location
  resource_group_name = var.resource_group
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label
  os_type             = "Linux"

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.container_cpu
    memory = var.container_ram

    ports {
      port     = 8080
      protocol = "TCP"
    }


    volume {
      name                 = "jenkins-home"
      mount_path           = "/var/jenkins_home"
      read_only            = false
      share_name = azurerm_storage_share.fsa_share.name
      storage_account_name = azurerm_storage_account.fsa_sa.name
      storage_account_key  = azurerm_storage_account.fsa_sa.primary_access_key
    }
  }


  tags = {
    environment = var.environment
  }
}