provider "aws" {
  region = "us-east-1"
}

#Resource configuration
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "10.0.1.0/24"
}

module "mighty_trousers" {
  source    = "./modules/application"
  vpc_id    = "${aws_vpc.terraform_vpc.id}"
  subnet_id = "${aws_subnet.public.id}"
  name      = "MightyTrousers"
}
