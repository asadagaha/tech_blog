resource "aws_iam_role" "rds_monitoring_role" {
  name               = "${var.app}-rds-monitoring-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_for_rds_monitoring_role.json
}
data "aws_iam_policy_document" "assume_role_for_rds_monitoring_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}
resource "aws_iam_role_policy_attachment" "rds_monitoring_role_policy" {
  role       = aws_iam_role.rds_monitoring_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}