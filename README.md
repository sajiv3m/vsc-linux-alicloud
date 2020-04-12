# Terraform files to deploy Linux server in AliCloud

## Follow the steps below to deploy the Linux server with essential tools

1. Clone the repository to your local system
   `git clone https://github.com/sajiv3m/vsc-linux-alicloud.git`
2. [Download latest version of Terraform >= v0.12.24](https://www.terraform.io/downloads.html)
3. Generate AccessKey from the AliCloud console 
   * Login to AliCloud console
   * Select user at the rop right hand corner
   * Select AccessKey
   * Generat AccessKey - to create a new one

4. Copy AccessKey ID and AccessKey Secret to `secret.tfvars` file
```
# Contents of secret.tfvars file
alicloud_access_key = "your AccessKey ID"
alicloud_secret_key = "your AccessKey Secret"
```
5. Generate SSH key pair which will be used to login to Linux server
   `ssh-keygen -m PEM -f vsc-linux-alicloud`
6. Update `terraform.tfvars` file with details of network, server, storage, location, ssh key pair (copy contents of public key file `vsc-linux-alicloud.pub`)
7. Initialize terraform by executing `terraform init`
8. Confirm there are no errors by executing `terraform plan -var-file="secret.tfvars"`
9. Execute `terraform apply -var-file="secret.tfvars"` to build the server.
10. Login and test access to server `ssh -i vsc-linux-alicloud root@ip-address of server`

