# Definition for the SSH key pair to use
# Generate the key pair using ssh-keygen and copy public key
resource "alicloud_key_pair" "publickey" {
    key_name = "vsc_alicloud_key"
    public_key = var.public_key
}
