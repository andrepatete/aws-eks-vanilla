data "aws_iam_policy_document" "node_termination_handler" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
    }
  }
}

resource "aws_iam_role" "node_termination_handler" {
  name               = format("%s-node_termination_handler", var.project_name)
  assume_role_policy = data.aws_iam_policy_document.node_termination_handler.json
}
