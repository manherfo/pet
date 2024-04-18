provider "aws" {
  region = var.region
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  permissions_boundary =         "arn:aws:iam::123456789012:policy/oxy-secpol-liteadmin-sandbox-permissions-boundary"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role" "test_role1" {
  name = "test_role1"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  permissions_boundary =         "arn:aws:iam::123456789012:policy/oxy-secpol-required-permission-boundary"

  tags = {
    tag-key = "tag-value"
  }
}
