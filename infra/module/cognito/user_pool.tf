resource "aws_cognito_user_pool" "main" {
  name                     = "${var.app}-auth-${var.env}"
  auto_verified_attributes = ["email"]
  password_policy {
    minimum_length                   = 6
    require_lowercase                = false
    require_numbers                  = false
    require_symbols                  = false
    require_uppercase                = false
    temporary_password_validity_days = 30
  }
  tags = {
    Name = "${var.app}-auth-${var.env}"
  }
}

resource "aws_cognito_user_pool_client" "main" {
  name         = "${var.app}-user-pool-client-${var.env}"
  user_pool_id = aws_cognito_user_pool.main.id
}

