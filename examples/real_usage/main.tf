provider "aws" {
  region = "us-west-2"
}

module "aws_iam_role_cross_account_runbop_real" {
  source = "../../"

  role_name      = "runbop-assume-instance-real"
  runbop_account = "123456789012"
  tags = {
    Environment = "production"
  }
  subnets = [
    "arn:aws:ec2:us-west-2:123456789012:subnet/subnet-0bb1c79de3EXAMPLE"
  ]
  network_interfaces = [
    "arn:aws:ec2:us-west-2:123456789012:network-interface/eni-0a1234567890abcdef"
  ]
  volumes = [
    "arn:aws:ec2:us-west-2:123456789012:volume/vol-0a1234567890abcdef"
  ]
  key_pairs = [
    "arn:aws:ec2:us-west-2:123456789012:key-pair/my-key-pair"
  ]
  security_groups = [
    "arn:aws:ec2:us-west-2:123456789012:security-group/sg-0a1234567890abcdef"
  ]
}
