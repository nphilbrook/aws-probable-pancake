terraform {
  cloud {
    organization = "philbrook"

    workspaces {
      name    = "aws-probable-pancake"
      project = "SB Vault Lab"
    }
  }
}
