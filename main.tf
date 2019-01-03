provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  profile    = "terraform"
}

resource "aws_instance" "terratest" {
  ami           = "ami-001e1c1159ccfe992"
  key_name      = "terr"
  instance_type = "t2.micro"

  tags = {
    Name = "Wordpress"
  }

  vpc_security_group_ids = ["${aws_security_group.wp_sg.id}"]

}
