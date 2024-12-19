variable "subscription_id" {
  description = "The Azure subscription ID"
  type = string
}   

variable "db_admin_username" {
  description = "The SQL Server admin username"
  type = string
}

variable "db_admin_password" {
  description = "The SQL Server admin password"
  type = string
}

variable "ip_address" {
  description = "The IP address to allow access to the SQL Server"
  type = string
}