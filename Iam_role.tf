resource "aws_iam_role" "test_role" {
  assume_role_policy = data.aws_iam_policy_document.iam_role_trust_policy.json
  name = "test_role"

  tags = {
    tag-key = "dev"
  }
}


data "aws_iam_policy_document" "iam_role_trust_policy" {
  
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.test_role.name
  policy_arn = aws_iam_policy.policy.arn
}
