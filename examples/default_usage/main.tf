provider "aws" {
  region = "us-west-2"
}

module "aws_iam_role_cross_account_runbop" {
  source = "../../"

  role_name      = "runbop-assume-instance"
  runbop_account = "your-runbop-account-id"
  tags = {
    Environment = "production"
  }
}
