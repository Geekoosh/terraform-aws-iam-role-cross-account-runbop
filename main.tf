# ----- IAM ROLE -----
resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.tags
}

# ----- ATTACH THE INLINE POLICY -----
resource "aws_iam_role_policy" "inline_policy_attachment" {
  name   = "${var.role_name}-inline"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.inline_policy.json
}