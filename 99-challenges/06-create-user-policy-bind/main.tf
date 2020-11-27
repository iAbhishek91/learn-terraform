provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "user" {
  name = "terraform-06"
}

resource "aws_iam_policy" "policy" {
  name = "GlacierEFS"
  policy =<<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:DescribeBackupPolicy",
                "elasticfilesystem:DescribeMountTargets",
                "glacier:GetVaultAccessPolicy",
                "elasticfilesystem:ListTagsForResource",
                "glacier:ListTagsForVault",
                "glacier:DescribeVault",
                "glacier:GetJobOutput",
                "glacier:ListParts",
                "glacier:GetVaultNotifications",
                "glacier:DescribeJob",
                "glacier:GetDataRetrievalPolicy",
                "glacier:ListJobs",
                "elasticfilesystem:DescribeTags",
                "glacier:ListMultipartUploads",
                "elasticfilesystem:DescribeLifecycleConfiguration",
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:DescribeFileSystemPolicy",
                "glacier:GetVaultLock",
                "glacier:ListVaults",
                "glacier:ListProvisionedCapacity",
                "elasticfilesystem:DescribeMountTargetSecurityGroups"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "policy-bind" {
  user = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}