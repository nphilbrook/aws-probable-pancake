data "aws_caller_identity" "current" {}

locals {
  identity_parts = split("/", data.aws_caller_identity.current.arn)
}

output "caller_identity_arn_without_the_dynamic_part" {
  value = "${local.identity_parts[0]}/${local.identity_parts[1]}"
}
