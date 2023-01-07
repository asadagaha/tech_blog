resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = "${var.app}-identity-pool-${var.env}"
  allow_unauthenticated_identities = true
}
