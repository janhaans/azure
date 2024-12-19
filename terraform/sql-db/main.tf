resource "azurerm_resource_group" "west-rg" {
    name     = "west-rg"
    location = "West Europe"
}

resource "azurerm_mssql_server" "west-db-server" {
    name                         = "west-jh-db-server"
    resource_group_name          = azurerm_resource_group.west-rg.name
    location                     = azurerm_resource_group.west-rg.location
    version                      = "12.0"
    administrator_login          = var.db_admin_username
    administrator_login_password = var.db_admin_password
}

resource "azurerm_mssql_database" "west-db" {
    name                = "west-jh-db"
    server_id           = azurerm_mssql_server.west-db-server.id
    sku_name            = "S0"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
}

resource "azurerm_mssql_firewall_rule" "west-db-server-firewall" {
    name                = "west-db-server-firewall-rule"
    server_id           = azurerm_mssql_server.west-db-server.id
    start_ip_address    = var.ip_address
    end_ip_address      = var.ip_address
}