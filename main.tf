########################################
# POSTGRES SQL SERVER
########################################

module "azure_psql_server" {
  source = "git::git@bitbucket.org:contournetworkdelivery/azure-postgressql-server-module?ref=master"

  public_network_access_enabled= var.public_network_access_enabled
  resource_group_name          = var.resource_group_name
  location                     = var.azure_regions_map["az1"]
  server_name                  = var.server_name
  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  admin_login                  = var.admin_login
  admin_password               = var.admin_password
  server_version               = var.server_version
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled
  db_names                     = var.db_names
  db_charset                   = var.db_charset
  db_collation                 = var.db_collation
  tags                         = var.resource_tags

  virtual_net_id               =  "/subscriptions/b3f72110-ee35-4c84-ab6a-5189f3744372/resourceGroups/rg-stg-sapapp01/providers/Microsoft.Network/virtualNetworks/vnet-stg-sapapp01"
  pvt_endpoint_name            =  "psql-nonprodstg01-pvtendpoint"
  pvt_endpoint_subnet_id       =  "/subscriptions/b3f72110-ee35-4c84-ab6a-5189f3744372/resourceGroups/rg-stg-sapapp01/providers/Microsoft.Network/virtualNetworks/vnet-stg-sapapp01/subnets/snet-non-prod-stg01-PvtApp128"

  postgresql_configurations = {
    backslash_quote = "on",
  }
}

module "azure_psql_server_monitoring" {
  source = "git::git@bitbucket.org:contournetworkdelivery/azure-postgresql-server-monitor?ref=master"

  resource_group_name          = var.resource_group_name
  resource_group_id = var.resource_group_id
    
  email_receiver_name        = var.email_receiver_name
  email_receiver_address     = var.email_receiver_address
  azurerm_monitor_metric_alert_name = var.azurerm_monitor_metric_alert_name
  azurerm_monitor_action_rule_action_group_name = var.azurerm_monitor_action_rule_action_group_name
  azurerm_monitor_action_group_short_name = var.azurerm_monitor_action_group_short_name
  azurerm_monitor_action_group_name = var.azurerm_monitor_action_group_name
  use_common_alert_schema = var.use_common_alert_schema
  azurerm_postgresql_server_id = "${module.azure_psql_server.psql_server_id}"

  monitor_metric_alert_criteria = var.monitor_metric_alert_criteria

}