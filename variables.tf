
variable "resource_group_name"{
  type     = string
  default  = ""
}

variable "azure_regions_map" {
  type = map(any)

  default = {
    az1 = "southeast asia"
    az2 = "east asia"
  }
}

variable "resource_tags" {
  type = map(any)

  default = {
    tag_business_unit = "contour-sg"
    tag_env           = "stg"
    tag_app_name      = "postgres"
    tag_app_owner     = "luke@contour.network"
  }
}

variable "server_name" {
  type = string
}

variable "sku_name" {
  type  = string
}


variable "admin_login" {
  type  = string

}

variable "admin_password" {
  type  = string
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  type        = number
  default     = 102400
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  type        = bool
  default     = false
}

variable "server_version" {
  description = "Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, and 10.0. Changing this forces a new resource to be created."
  type        = string
  default     = "9.5"
}

variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
  type        = bool
  default     = true
}

variable "db_names" {
  description = "The list of names of the PostgreSQL Database, which needs to be a valid PostgreSQL identifier. Changing this forces a new resource to be created."
  type        = list(string)
  default     = []
}

variable "db_charset" {
  description = "Specifies the Charset for the PostgreSQL Database, which needs to be a valid PostgreSQL Charset. Changing this forces a new resource to be created."
  type        = string
  default     = "UTF8"
}

variable "db_collation" {
  description = "Specifies the Collation for the PostgreSQL Database, which needs to be a valid PostgreSQL Collation. Note that Microsoft uses different notation - en-US instead of en_US. Changing this forces a new resource to be created."
  type        = string
  default     = "English_United States.1252"
}

variable "public_network_access_enabled" {
  type  = bool
}

variable "email_receiver_name" {
  type        = string
}
variable "email_receiver_address" {
  type        = string
}
variable "azurerm_monitor_action_group_name" {
  type        = string
}
variable "azurerm_monitor_action_group_short_name" {
  type        = string
}
variable "azurerm_monitor_action_rule_action_group_name" {
  type        = string
}
variable "azurerm_monitor_metric_alert_name" {
  type        = string
} 

variable "use_common_alert_schema" {
  type = bool
}
variable "monitor_metric_alert_name" {
  description = "For each monitor_metric_alert_name, create an object that contain fields"
  default     = {}
}

variable "resource_group_id"{
  type     = string
}

variable "monitor_metric_alert_criteria" {
  
    type = map(object({
      # criteria.*.aggregation to be one of [Average Count Minimum Maximum Total]
      aggregation = string
      metric_name = string
      # criteria.0.operator to be one of [Equals NotEquals GreaterThan GreaterThanOrEqual LessThan LessThanOrEqual]
      operator  = string
      threshold = number
      }))
}
