# Fetch the current AWS account ID
data "aws_caller_identity" "current" {}

# ----- TRUST POLICY (who can assume the role) -----
data "aws_iam_policy_document" "assume_role" {
  statement {
    sid    = "AllowCrossAccountAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::108782091555:root",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.runbop_account]
    }
  }
}

# ----- INLINE POLICY -----
data "aws_iam_policy_document" "inline_policy" {
  statement {
    sid     = "AllowRunInstancesInLocalAccount"
    effect  = "Allow"
    actions = [
      "ec2:RunInstances",
    ]
    resources = concat(
      [for arn in var.subnets : replace(arn, "<account_id>", data.aws_caller_identity.current.account_id)],
      [for arn in var.network_interfaces : replace(arn, "<account_id>", data.aws_caller_identity.current.account_id)],
      [for arn in var.volumes : replace(arn, "<account_id>", data.aws_caller_identity.current.account_id)],
      [for arn in var.key_pairs : replace(arn, "<account_id>", data.aws_caller_identity.current.account_id)],
      [for arn in var.security_groups : replace(arn, "<account_id>", data.aws_caller_identity.current.account_id)]
    )
  }

  statement {
    sid      = "AllowRunInstancesForImagesTaggedManagedByRunbop"
    effect   = "Allow"
    actions  = [
      "ec2:RunInstances",
    ]
    resources = [
      "arn:aws:ec2:*::image/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/ManagedByRunbop"
      values   = ["true"]
    }
  }

  statement {
    sid      = "AllowRunInstancesForImagesWithSpecificOwner"
    effect   = "Allow"
    actions  = [
      "ec2:RunInstances",
    ]
    resources = [
      "arn:aws:ec2:*::image/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "ec2:Owner"
      values   = ["199891268013"]
    }
  }

  statement {
    sid      = "AllowCreateTagsAndRunInstancesWithRequestTagManagedByRunbop"
    effect   = "Allow"
    actions  = [
      "ec2:CreateTags",
      "ec2:RunInstances",
    ]
    resources = [
      "arn:aws:ec2:*:${data.aws_caller_identity.current.account_id}:instance/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/ManagedByRunbop"
      values   = ["true"]
    }
  }

  statement {
    sid      = "AllowInstanceControlForManagedInstances"
    effect   = "Allow"
    actions  = [
      "ec2:TerminateInstances",
      "ec2:StopInstances",
      "ec2:StartInstances",
      "ec2:DeregisterImage",
      "ec2:ModifyInstanceAttribute",
    ]
    resources = [
      "*",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/ManagedByRunbop"
      values   = ["true"]
    }
  }

  statement {
    sid     = "AllowDescribeInstances"
    effect  = "Allow"
    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceStatus",
    ]
    resources = ["*"]
  }

  statement {
    sid      = "AllowPassRoleToEC2"
    effect   = "Allow"
    actions  = [
      "iam:PassRole",
    ]
    resources = ["*"]
    condition {
      test     = "StringEqualsIfExists"
      variable = "iam:PassedToService"
      values   = ["ec2.amazonaws.com"]
    }
  }
}
