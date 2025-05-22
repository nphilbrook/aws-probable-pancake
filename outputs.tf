data "aws_caller_identity" "current" {}
data "aws_caller_identity" "doormat" {
  provider = aws.doormat
}

locals {
  identity_parts         = split("/", data.aws_caller_identity.current.arn)
  identity_parts_doormat = split("/", data.aws_caller_identity.doormat.arn)
}

output "caller_identity_arn_without_the_dynamic_part" {
  value = "${local.identity_parts[0]}/${local.identity_parts[1]}"
}

output "caller_identity_doormat" {
  value = "${local.identity_parts_doormat[0]}/${local.identity_parts_doormat[1]}"
}

output "caller_identity_doormat_full" {
  value = data.aws_caller_identity.doormat
}
