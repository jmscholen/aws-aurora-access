output "env" {
  value = [
    {
      name  = "MYSQL_HOST"
      value = local.cluster_endpoint
    },
    {
      name  = "MYSQL_USER"
      value = local.username
    },
    {
      name  = "MYSQL_DB"
      value = local.database_name
    }
  ]
}

output "secrets" {
  value = [
    {
      name  = "MYSQL_PASSWORD"
      value = random_password.this.result
    },
    {
      name  = "MYSQL_URL"
      value = "mysql2://${urlencode(local.username)}:${urlencode(random_password.this.result)}@${local.cluster_endpoint}/${urlencode(local.database_name)}"
    }
  ]
}
