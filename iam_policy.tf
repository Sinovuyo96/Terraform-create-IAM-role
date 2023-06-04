resource "aws_iam_policy" "policy" {
  policy      = data.aws_iam_policy_document.iam_policy.json
  name        = "test_policy"
  path        = "/"
  description = "My test policy"
}

data "aws_iam_policy_document" "iam_policy" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  }

  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}",
      "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}/*",
    ]
  }
}
