# Definition for VPC, vSwitch, Security group and secuirty / firewall rules

# Define VPC
resource "alicloud_vpc" "vsc-linux" {
  name = var.vsc_vpc_name
  cidr_block = var.vsc_vpc_cidr
}

# Define vSwitch
resource "alicloud_vswitch" "vsc-linux" {
  name              = var.vsc_vswitch_name
  availability_zone = var.alicloud_az
  cidr_block        = var.vsc_vswitch_cidr
  vpc_id            = alicloud_vpc.vsc-linux.id
}

# Define Security group
resource "alicloud_security_group" "vsc-linux" {
  name        = var.vsc_sg_name
  description = "VSC Security Group"
  vpc_id = alicloud_vpc.vsc-linux.id
}

# Define security / firewall rules
resource "alicloud_security_group_rule" "ssh-in" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.vsc-linux.id
  cidr_ip           = "0.0.0.0/0"
  
}

resource "alicloud_security_group_rule" "vsc-linux" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "8080/8080"
  priority          = 2
  security_group_id = alicloud_security_group.vsc-linux.id
  cidr_ip           = "0.0.0.0/0"
  
}
