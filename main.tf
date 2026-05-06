





# Configure the AWS Provider


resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"
  region     = local.region
  tags = {
    Name = local.vpc_name
  }
}

resource "aws_s3_bucket" "demobucket" {
  bucket = local.bucket_name
  
  tags = {
    Name        = local.bucket_name
    Environment = var.Environment
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "demo-instance" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  region        = local.region

  tags = {
    Environment = var.Environment
    Name = "${var.title}-${var.Environment}-Instance"
  }
}

