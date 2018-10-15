resource "aws_dynamodb_table" "banking" {
  name           = "Account"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "CustomerId"
  range_key      = "City"

  attribute {
    name = "CustomerId"
    type = "N"
  }

  attribute {
    name = "Account_number"
    type = "N"
  }

  attribute {
    name = "City"
    type = "S"
  }
    global_secondary_index {
    name               = "CityIndex"
    hash_key           = "City"
    range_key          = "Account_number"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["CustomerId"]
  }
  tags {
    Name        = "banking"
    Environment = "production"
  }
}
