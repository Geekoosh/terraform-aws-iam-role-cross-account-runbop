# AWS IAM Role Cross Account Runbop

This Terraform module is used for users of the [Runbop](https://runbop.com) self-hosted runners service to easily configure a cross-account role to be assumed by the [Runbop](https://runbop.com) service. It creates an IAM role that allows cross-account access to run instances in a specified AWS account.

## Usage

### Default Usage

By default, the module uses wildcard ARNs for subnets, network interfaces, volumes, key pairs, and security groups.

```hcl
module "aws_iam_role_cross_account_runbop" {
  source = "path/to/this/module"

  role_name      = "runbop-assume-instance"
  runbop_account = "your-runbop-account-id"
  tags = {
    Environment = "production"
  }
}
```

### Advanced Usage

For a higher degree of security, you can specify specific ARNs for subnets, network interfaces, volumes, key pairs, and security groups.

```hcl
module "aws_iam_role_cross_account_runbop" {
  source = "path/to/this/module"

  role_name      = "runbop-assume-instance"
  runbop_account = "your-runbop-account-id"
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
```

## Variables

| Name               | Type         | Default                                            | Description                                    |
| ------------------ | ------------ | -------------------------------------------------- | ---------------------------------------------- |
| role_name          | string       | "runbop-assume-instance"                           | Name of the IAM role to create.                |
| runbop_account     | string       | n/a                                                | The external ID value for cross-account trust. |
| tags               | map(string)  | {}                                                 | Tags to assign to the IAM role.                |
| subnets            | list(string) | ["arn:aws:ec2:*:<account_id>:subnet/*"]            | List of subnet ARNs.                           |
| network_interfaces | list(string) | ["arn:aws:ec2:*:<account_id>:network-interface/*"] | List of network interface ARNs.                |
| volumes            | list(string) | ["arn:aws:ec2:*:<account_id>:volume/*"]            | List of volume ARNs.                           |
| key_pairs          | list(string) | ["arn:aws:ec2:*:<account_id>:key-pair/*"]          | List of key pair ARNs.                         |
| security_groups    | list(string) | ["arn:aws:ec2:*:<account_id>:security-group/*"]    | List of security group ARNs.                   |

## Outputs

| Name      | Description               |
| --------- | ------------------------- |
| role_arn  | The ARN of the IAM role.  |
| role_name | The name of the IAM role. |
