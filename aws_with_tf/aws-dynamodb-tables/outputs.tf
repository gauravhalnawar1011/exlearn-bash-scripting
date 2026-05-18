output "table_name" {
  description = "this for the dynamodb table name"
  value = aws_dynamodb_table.basic-dynamodb-table.name
}