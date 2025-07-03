data "aws_caller_identity" "default" {

}


data "aws_caller_identity" "current" {
  provider = aws.primary
}

data "aws_caller_identity" "alternate" {
  provider = aws.alternate
}

locals {
  identity_parts           = split("/", data.aws_caller_identity.current.arn)
  identity_parts_alternate = split("/", data.aws_caller_identity.alternate.arn)
}

output "caller_identity_arn_without_the_dynamic_part" {
  value = "${local.identity_parts[0]}/${local.identity_parts[1]}"
}

output "caller_identity_alternate" {
  value = "${local.identity_parts_alternate[0]}/${local.identity_parts_alternate[1]}"
}

output "caller_identity_alternate_full" {
  value = data.aws_caller_identity.alternate
}
