variable "ports" {
  type    = list(number)
  default = [22, 80, 443, 3306]
}

variable "image_id" {
  default = "ami-0b5eea76982371e91"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "name" {
  default = "first-tf-instance"
}