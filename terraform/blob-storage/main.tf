resource "azurerm_resource_group" "eu-west-rg" {
    name     = "example-resources"
    location = "West Europe"
}

resource "azurerm_storage_account" "eu-west-sa" {
    name                            = "euwestsa"
    resource_group_name             = azurerm_resource_group.eu-west-rg.name
    location                        = azurerm_resource_group.eu-west-rg.location
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    public_network_access_enabled   = true
}

resource "azurerm_storage_container" "images" {
    name                  = "images"
    storage_account_id    = azurerm_storage_account.eu-west-sa.id
    container_access_type = "container"
}