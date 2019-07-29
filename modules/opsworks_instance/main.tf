resource "aws_opsworks_instance" "instance" {
  stack_id = "${var.stack_id}"

  layer_ids = [
    "${var.layer_id}",
  ]

  instance_type = "${var.instance_type}"
  os            = "${var.instance_os}"
  state         = "${var.state}"
}