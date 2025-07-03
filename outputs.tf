data "aws_caller_identity" "default" {

}


data "aws_caller_identity" "primary" {
  provider = aws.primary
}

data "aws_caller_identity" "alternate" {
  provider = aws.alternate
}

locals {
  identity_parts_primary   = split("/", data.aws_caller_identity.primary.arn)
  identity_parts_alternate = split("/", data.aws_caller_identity.alternate.arn)
}

output "caller_identity_arn_without_the_dynamic_part" {
  value = "${local.identity_parts_primary[0]}/${local.identity_parts_primary[1]}"
}

output "caller_identity_alternate" {
  value = "${local.identity_parts_alternate[0]}/${local.identity_parts_alternate[1]}"
}

output "caller_identity_alternate_full" {
  value = data.aws_caller_identity.alternate
}

output "caller_identity_default_full" {
  value = data.aws_caller_identity.default
}
