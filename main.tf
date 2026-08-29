resource "aws_instance" "vm1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.ec2_sg]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_s3_bucket" "nks-storage" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_ebs_volume" "extra_volume" {
  availability_zone = aws_instance.vm1.availability_zone
  size              = var.ebs_size

  tags = {
    Name = var.ebs_name
  }
}
