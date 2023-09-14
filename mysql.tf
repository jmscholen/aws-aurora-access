data "ns_connection" "mysql" {
  name     = "mysql"
  type     = "mysql/aws"
  contract = "datastore/aws/mysql:*"
}

locals {
  db_endpoint          = data.ns_connection.mysql.outputs.cluster_endpoint
  db_port              = data.ns_connection.mysql.outputs.cluster_port
  db_security_group_id = data.ns_connection.mysql.outputs.db_security_group_id
  db_admin_func_name   = data.ns_connection.mysql.outputs.db_admin_function_name
}
