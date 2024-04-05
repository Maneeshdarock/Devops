resource "azurerm_resource_group" "rg-block" {
  name     = "maneesh-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage-block" {
    depends_on = [ azurerm_resource_group.rg-block ]
  name                     = "maneesh-sa"
  resource_group_name      = "maneesh-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "c-block" {
depends_on = [ azurerm_storage_account.storage-block ]
  name                  = "maneesh-container"
  storage_account_name  = "maneesh-sa"
  container_access_type = "private"
}