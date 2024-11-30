resource "aws_iam_role" "app_role" {
  name = var.aws_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "sid01"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    Name = var.aws_role_name
  }
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = var.aws_policy_name
  description = var.aws_policy_description
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
                "s3:Get*",
                "s3:List*",
                "s3:Describe*",
                "s3-object-lambda:Get*",
                "s3-object-lambda:List*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy01" {
  role       = aws_iam_role.app_role.name
  policy_arn = var.aws_role_SSM_policy_arn
}

resource "aws_iam_role_policy_attachment" "attach_policy02" {
  role       = aws_iam_role.app_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_instance_profile" "app_profile" {
  name = "flask_app_profile"
  role = aws_iam_role.app_role.name
}