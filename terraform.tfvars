
resource_group_name = "rg-stg-sapapp01"
server_name = "psqlstgsapapp01"
sku_name  = "MO_Gen5_8"
storage_mb  = 102400
backup_retention_days = 35
geo_redundant_backup_enabled =  false
server_version  = 9.6
ssl_enforcement_enabled = true
db_names  = [ "stgtest1","stgtest2"]
db_charset  = "UTF8"
db_collation = "English_United States.1252"
public_network_access_enabled = false

#### updating values for psql monitor

#azurerm_postgresql_server_id = "/subscriptions/b3f72110-ee35-4c84-ab6a-5189f3744372/resourceGroups/rg-stg-aksapp01/providers/Microsoft.DBforPostgreSQL/servers/psqlstgaksapp01"

resource_group_id = "/subscriptions/b3f72110-ee35-4c84-ab6a-5189f3744372/resourceGroups/rg-stg-sapapp01"
azurerm_monitor_action_group_name = "stgpsqlCriticalAlertsAction"
email_receiver_name = "alerts_stg_opsgenie"
email_receiver_address = "alerts_staging@contour.eu.opsgenie.net"
azurerm_monitor_action_group_short_name = "stgactngrp"
azurerm_monitor_action_rule_action_group_name = "stgpsqlruleactiongrp"
use_common_alert_schema = true 
azurerm_monitor_metric_alert_name = "stgpsqlalert"

monitor_metric_alert_criteria = {
        "cpu_alert"  = { 
            "metric_namespace" = "Microsoft.DBforPostgreSQL/servers"
            "metric_name"      = "CPU_percent"
            "aggregation"      = "Average"
            "operator"         = "GreaterThan"
            "threshold"        = 70
            },
        "connection_alert"  = { 
            "metric_namespace" = "Microsoft.DBforPostgreSQL/servers"
            "metric_name"      = "active_connections"
            "aggregation"      = "Maximum"
            "operator"         = "GreaterThan"
            "threshold"        = 850
        },
        "numberof_connections_failed"  = { 
            "metric_namespace" = "Microsoft.DBforPostgreSQL/servers"
            "metric_name"      = "connections_failed"
            "aggregation"      = "Total"
            "operator"         = "GreaterThan"
            "threshold"        = 0
        },
        "memory_percentage"  = { 
            "metric_namespace" = "Microsoft.DBforPostgreSQL/servers"
            "metric_name"      = "memory_percent"
            "aggregation"      = "Average"
            "operator"         = "GreaterThan"
            "threshold"        = 90
        },
        "storage_percentage"  = { 
            "metric_namespace" = "Microsoft.DBforPostgreSQL/servers"
            "metric_name"      = "storage_percent"
            "aggregation"      = "Average"
            "operator"         = "GreaterThan"
            "threshold"        = 90
        }
}