resource "aws_opsworks_application" "application" {
  name        = "${var.name}"
  short_name  = "${var.short_name}"
  stack_id    = "${var.stack_id}"
  type        = "${var.type}"

  environment {
    key    = "key"
    value  = "value"
    secure = false
  }

  app_source {
    type     = "git"
    revision = "${var.branch}"
    url      = "${var.repo_url_app}"
  }
}