resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  key_name               = aws_key_pair.key-tf.key_name
  tags = {
    Name = var.name
  }

}