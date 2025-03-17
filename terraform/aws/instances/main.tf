provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name  = "k8s-node"
  ami_id         = "ami-0b0ea68c435eb488d"
  instance_type  = "t2.medium"
  key_name       = "techiescamp" # make sure you type in here the key pair you have in your aws 
  subnet_ids     = ["subnet-07ea2df86f305e3fa", "subnet-071e2c73c46a8042a", "subnet-0516af1847fe7e172"]
  instance_count = 3

  inbound_from_port  = ["0", "6443", "22", "30000"]
  inbound_to_port    = ["65000", "6443", "22", "32768"]
  inbound_protocol   = ["TCP", "TCP", "TCP", "TCP"]
  inbound_cidr       = ["172.31.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
  outbound_from_port = ["0"]
  outbound_to_port   = ["0"]
  outbound_protocol  = ["-1"]
  outbound_cidr      = ["0.0.0.0/0"]
}
