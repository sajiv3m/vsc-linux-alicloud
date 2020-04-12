# Definition file for the cloud provider - Alibaba Cloud
# Access keys are in the terraform.tfvars file

provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = var.alicloud_region
  version = "1.50.0" # supports Terraform 0.12.x
}