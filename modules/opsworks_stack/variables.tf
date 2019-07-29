variable "name" {}
variable "region" {}
variable "service_role" {}
variable "instance_profile" {}
variable "json" {}
variable "vpc" {}
variable "subnet" {}
variable "default_os" {}
variable "use_custom_cookbooks" {
  default = false
}
variable "repo_type" {
  default = ""
}
variable "repo_url" {
  default = ""
}
variable "default_root_device_type" {}
variable "version" {}