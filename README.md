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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.inline_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_pairs"></a> [key\_pairs](#input\_key\_pairs) | List of key pair ARNs | `list(string)` | <pre>[<br/>  "arn:aws:ec2:*:<account_id>:key-pair/*"<br/>]</pre> | no |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | List of network interface ARNs | `list(string)` | <pre>[<br/>  "arn:aws:ec2:*:<account_id>:network-interface/*"<br/>]</pre> | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the IAM role to create. Defaults to runbop-assume-instance. | `string` | `"runbop-assume-instance"` | no |
| <a name="input_runbop_account"></a> [runbop\_account](#input\_runbop\_account) | The external ID value for cross-account trust. | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group ARNs | `list(string)` | <pre>[<br/>  "arn:aws:ec2:*:<account_id>:security-group/*"<br/>]</pre> | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnet ARNs | `list(string)` | <pre>[<br/>  "arn:aws:ec2:*:<account_id>:subnet/*"<br/>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to assign to the IAM role. | `map(string)` | `{}` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | List of volume ARNs | `list(string)` | <pre>[<br/>  "arn:aws:ec2:*:<account_id>:volume/*"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The ARN of the created IAM role. |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | The name of the created IAM role. |
<!-- END_TF_DOCS -->
