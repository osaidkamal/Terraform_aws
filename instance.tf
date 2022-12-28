resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}



resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}


# resource "aws_instance" "web" {
#   ami                    = var.image_id
#   instance_type          = var.instance_type
#   vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
#   key_name               = aws_key_pair.key-tf.key_name
#   tags = {
#     Name = var.name
#   }

# }
module "ec2-instance" {
    source = "./modules/web-server"
    image_id="fsfsdgds"
    instance_type="t2.small"
}