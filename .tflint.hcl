plugin "terraform" {
    enabled = true
    preset = "recommended"
}

plugin "aws" {
  enabled = true
  version = "0.37.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "aws_iam_group_policy_too_long" {
  enabled = true
}

rule "aws_iam_policy_too_long_policy" {
  enabled = true
}

rule "aws_iam_access_key_invalid_status" {
  enabled = true
}

rule "aws_iam_access_key_invalid_user" {
  enabled = true
}

rule "aws_iam_group_invalid_name" {
  enabled = true
}

rule "aws_iam_group_invalid_path" {
  enabled = true
}

rule "aws_iam_group_membership_invalid_group" {
  enabled = true
}

rule "aws_iam_group_policy_attachment_invalid_group" {
  enabled = true
}

rule "aws_iam_group_policy_attachment_invalid_policy_arn" {
  enabled = true
}

rule "aws_iam_group_policy_invalid_group" {
  enabled = true
}

rule "aws_iam_group_policy_invalid_name" {
  enabled = true
}

rule "aws_iam_group_policy_invalid_policy" {
  enabled = true
}

rule "aws_iam_instance_profile_invalid_name" {
  enabled = true
}

rule "aws_iam_instance_profile_invalid_path" {
  enabled = true
}

rule "aws_iam_instance_profile_invalid_role" {
  enabled = true
}

rule "aws_iam_openid_connect_provider_invalid_url" {
  enabled = true
}

rule "aws_iam_policy_attachment_invalid_policy_arn" {
  enabled = true
}

rule "aws_iam_policy_invalid_description" {
  enabled = true
}

rule "aws_iam_policy_invalid_name" {
  enabled = true
}

rule "aws_iam_policy_invalid_path" {
  enabled = true
}

rule "aws_iam_policy_invalid_policy" {
  enabled = true
}

rule "aws_iam_role_invalid_assume_role_policy" {
  enabled = true
}

rule "aws_iam_role_invalid_description" {
  enabled = true
}

rule "aws_iam_role_invalid_name" {
  enabled = true
}

rule "aws_iam_role_invalid_path" {
  enabled = true
}

rule "aws_iam_role_invalid_permissions_boundary" {
  enabled = true
}

rule "aws_iam_role_policy_attachment_invalid_policy_arn" {
  enabled = true
}

rule "aws_iam_role_policy_attachment_invalid_role" {
  enabled = true
}

rule "aws_iam_role_policy_invalid_name" {
  enabled = true
}

rule "aws_iam_role_policy_invalid_policy" {
  enabled = true
}

rule "aws_iam_role_policy_invalid_role" {
  enabled = true
}

rule "aws_iam_saml_provider_invalid_name" {
  enabled = true
}

rule "aws_iam_saml_provider_invalid_saml_metadata_document" {
  enabled = true
}

rule "aws_iam_server_certificate_invalid_certificate_body" {
  enabled = true
}

rule "aws_iam_server_certificate_invalid_certificate_chain" {
  enabled = true
}

rule "aws_iam_server_certificate_invalid_name" {
  enabled = true
}

rule "aws_iam_server_certificate_invalid_path" {
  enabled = true
}

rule "aws_iam_server_certificate_invalid_private_key" {
  enabled = true
}

rule "aws_iam_service_linked_role_invalid_aws_service_name" {
  enabled = true
}

rule "aws_iam_service_linked_role_invalid_custom_suffix" {
  enabled = true
}

rule "aws_iam_service_linked_role_invalid_description" {
  enabled = true
}

rule "aws_iam_user_group_membership_invalid_user" {
  enabled = true
}

rule "aws_iam_user_invalid_name" {
  enabled = true
}

rule "aws_iam_user_invalid_path" {
  enabled = true
}

rule "aws_iam_user_invalid_permissions_boundary" {
  enabled = true
}

rule "aws_iam_user_login_profile_invalid_user" {
  enabled = true
}

rule "aws_iam_user_policy_attachment_invalid_policy_arn" {
  enabled = true
}

rule "aws_iam_user_policy_attachment_invalid_user" {
  enabled = true
}

rule "aws_iam_user_policy_invalid_name" {
  enabled = true
}

rule "aws_iam_user_policy_invalid_policy" {
  enabled = true
}

rule "aws_iam_user_policy_invalid_user" {
  enabled = true
}

rule "aws_iam_user_ssh_key_invalid_encoding" {
  enabled = true
}

rule "aws_iam_user_ssh_key_invalid_public_key" {
  enabled = true
}

rule "aws_iam_user_ssh_key_invalid_status" {
  enabled = true
}