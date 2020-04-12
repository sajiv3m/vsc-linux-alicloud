
# Print the IP addresses for Docker UCP and Linux worker hosts

output "vsc_host_ip_address" {
  value = alicloud_instance.vsc-linux.public_ip
}


output "vsc_host_fqdn" {
  value = "https://${alicloud_instance.vsc-linux.public_ip}:8080/"
}


