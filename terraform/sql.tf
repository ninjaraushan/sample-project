resource "azurerm_sql_server" "example" {
  name                         = "mytestsqlserver123"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "azureadmin"
  administrator_login_password = "Raushan@2020!"

  tags = {
    environment = "production"
  }
}

resource "azurerm_sql_firewall_rule" "allowAzureServices" {
  name                = "Allow_Azure_Services"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


resource "azurerm_sql_database" "appdb01" {
  depends_on                       = [azurerm_sql_firewall_rule.allowAzureServices]
  name                             = "sqldb"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  server_name                      = azurerm_sql_server.example.name
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  requested_service_objective_name = "BC_Gen5_2"
  max_size_gb    = 4
  read_scale     = true
  zone_redundant = true
  

}
