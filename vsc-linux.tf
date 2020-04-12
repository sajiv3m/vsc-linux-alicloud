

# Definition for the Linux server to host VSC

resource "alicloud_instance" "vsc-linux" {
  instance_name     = "vsc-linux"
  host_name         = "vsc-linux"
  image_id          = "ubuntu_18_04_x64_20G_alibase_20200329.vhd"
  instance_type     = "ecs.t5-c1m4.xlarge"
  vswitch_id        = alicloud_vswitch.vsc-linux.id
  security_groups   = [alicloud_security_group.vsc-linux.id]
  instance_charge_type = "PostPaid"
  internet_max_bandwidth_out = 100
  key_name          = alicloud_key_pair.publickey.key_name
  system_disk_category = "cloud_efficiency"
  


# Copy scripts and files for linux hosts from lin-files folder to /tmp on target VM
  provisioner "file" {
    source = "lin-files"
    destination = "/tmp"
  } 

/*  Installing apps using remote-exec */
    provisioner "remote-exec" {
        inline = [
#   Installing other apps
        "chmod +x /tmp/lin-files/install*.sh",
        "echo Installing applications...",
        "/tmp/lin-files/install_other_apps.sh",
#   changing all files to read-only by root        
        "sudo chmod 600 /tmp/lin-files/install*.sh"
        ]
    }



# Connection details for all the remote-exec and remote file copy (provisioner - file) mentioned above
  connection {
    host = alicloud_instance.vsc-linux.public_ip
    private_key = file(var.path_to_private_key)
  }

  tags = local.common_tags

}




