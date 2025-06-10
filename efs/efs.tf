
#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#

provider "aws" {
  region = "us-east-1"
}

variable "default_vpc_id" {
 default = "vpc-05708c7d816535c1e"
}

variable "default_subnet_id" {
 default = ["subnet-0520336ae54b912a4", "subnet-0beaceec6afc90394","subnet-00e7491c2e9e7741c", "subnet-087a345359a1d82c0", "subnet-0a9ed68a0a640aa8a", "subnet-0ec3da9ed9176d7ba"]
}

resource "aws_efs_file_system" "wezvatech" {
  creation_token = "jrp"
  encrypted = true

  tags = {
    Name = "jrp"
  }
}

resource "aws_efs_mount_target" "example" {
 for_each = toset(var.default_subnet_id)
 file_system_id = aws_efs_file_system.wezvatech.id
 subnet_id = each.key
}

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#
