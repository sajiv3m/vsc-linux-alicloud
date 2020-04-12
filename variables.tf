

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Environment = "Development"
    Purpose   = "Host Visual Studio Code"
  }
}
variable "alicloud_access_key" {}
variable "alicloud_secret_key" {}
variable "alicloud_region" {}

variable "alicloud_az" {}

variable "vsc_vpc_name" {}
variable "vsc_vpc_cidr" {}

variable "vsc_vswitch_name" {}
variable "vsc_vswitch_cidr" {}


variable "vsc_sg_name" {}




variable "vsc_server_user" {}
variable "vsc_server_password" {}
variable "path_to_private_key" {}

variable "public_key" {}

