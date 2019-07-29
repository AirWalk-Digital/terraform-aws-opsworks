resource "aws_opsworks_stack" "main" {
  name                         = "${var.name}"
  region                       = "${var.region}"
  service_role_arn             = "${var.service_role}"
  default_instance_profile_arn = "${var.instance_profile}"
  vpc_id                       = "${var.vpc}"
  default_subnet_id            = "${var.subnet}"
  custom_json                  = "${var.json}"
  default_os                   = "${var.default_os}"
  use_custom_cookbooks         = "${var.use_custom_cookbooks}"
  configuration_manager_version = "${var.version}"
  custom_cookbooks_source {
    type = "${var.repo_type}"
    url  = "${var.repo_url}"
  }
  default_root_device_type    = "${var.default_root_device_type}"
}

output "id" {
  value = "${aws_opsworks_stack.main.id}"
}