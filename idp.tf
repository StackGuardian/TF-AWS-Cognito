resource "aws_cognito_identity_provider" "idp" {
  count = length(var.identity_providers) ? length(var.identity_providers) : 0

  user_pool_id  = join("", aws_cognito_user_pool.pool.*.id)
  idp_name = lookup(element(var.identity_providers, count.index), "idp_name")
  idp_type = lookup(element(var.identity_providers, count.index), "idp_type")

 
  attribute_mapping = lookup(element(var.identity_providers, count.index), "attribute_mapping", {})
  idp_identifiers   = lookup(element(var.identity_providers, count.index), "idp_identifiers", [])
  provider_details  = lookup(element(var.identity_providers, count.index), "provider_details", {})
  
}