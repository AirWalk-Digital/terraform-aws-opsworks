module "opsworks_stack" {
  source = "../modules/opsworks_stack"
  name   = "hello-word-opsworks"
  region = "us-west-2"
  service_role = "arn:aws:iam:::role/aws-opsworks-service-role"
  instance_profile = "arn:aws:iam:::instance-profile/aws-opsworks-ec2-role"
  vpc = "vpc-"
  subnet = "subnet-"
  json = <<EOT
{
 "foobar": {
    "version": "1.0.0"
  }
}
EOT
  default_os = "Ubuntu 12.04 LTS"
  use_custom_cookbooks = true
  repo_type = "git"
  repo_url = "https://github.com/aws-samples/opsworks-first-cookbook"
  default_root_device_type = "ebs"
  version = "11.10"
}

module "opsworks_instance" {
  source = "../modules/opsworks_instance"
  stack_id = "${module.opsworks_stack.id}"
  layer_id = "${aws_opsworks_nodejs_app_layer.app.id}"
  instance_type = "t2.micro"
  instance_os = "Ubuntu 12.04 LTS"
  state = "running"
}

module "opsworks_application" {
  source = "../modules/opsworks_application"
  name = "hello-word-app"
  short_name = "hello-word-app"
  stack_id = "${module.opsworks_stack.id}"
  type = "Node.js"
  branch = "master"
  repo_url_app = "https://github.com/AirWalk-Digital/terraform-aws-opsworks.git//hello-word-opsworks"
}

resource "aws_opsworks_nodejs_app_layer" "app" {
  stack_id = "${module.opsworks_stack.id}"
}