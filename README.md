# terraform-aws-opsworks

##Description
This AWS Terraform module setup a OpsWorks Stack with NodeJs layer and a sample application. You can manage the instance, layer and configuration according to the requirements by using this module. 

##Modules Covered
- AWS OpsWorks Application
- AWS OpsWorks Instance
- AWS OpsWorks Stack

##Usage
Example of creating a stack
```bash
module "opsworks_stack" {
  source = "../modules/opsworks_stack"
  name   = "hello-word-opsworks"
  region = "2"
  service_role = ""
  instance_profile = ""
  vpc = ""
  subnet = ""
  json = ""
  default_os = "Ubuntu 12.04 LTS"
  use_custom_cookbooks = true
  repo_type = "git"
  repo_url = ""
  default_root_device_type = "ebs"
  version = "11.10"
}
```

For instance provisioning:
```bash
module "opsworks_instance" {
  source = "../modules/opsworks_instance"
  stack_id = ""
  layer_id = ""
  instance_type = "t2.micro"
  instance_os = "Ubuntu 12.04 LTS"
  state = "running"
}
```

##Attributes
| Name | Description | Type | Mandatory | 
| :---: | ---------- | :---: | :------: |
| name | Name of stack | string | yes |
| region | Region of stack | string | yes |
| service_role | iam role for the stack | string | yes |
| instance_profile | instance profile that will attach to instance | string | yes |
| vpc | VPC for stack | string | yes |
| subnet | subnet for stack | string | yes |
| default_os | Name of OS that will be installed on instances by default | string | yes |
| use_custom_cookbooks | Boolean value controlling whether the custom cookbook settings are enabled. | boolean | no |
| repo_type | The type of source to use. For example, "archive" | string | yes |
| repo_url | The URL where the cookbooks resource can be found | string | yes |
| version | chef version | string | yes |

This can be deploy with standard Terraform Commands:
```bash
terraform init
terraform plan --out ./build.plan
terraform apply ./build.plan

```

