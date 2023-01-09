resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "${var.app}-public-1a-${var.env}"
  }
}
resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}c"
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name = "${var.app}-public-1c-${var.env}"
  }
}
resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}a"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "${var.app}-private-1a-${var.env}"
  }
}
resource "aws_subnet" "private_1c" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}c"
  cidr_block        = "10.0.4.0/24"
  tags = {
    Name = "${var.app}-private-1c-${var.env}"
  }
}
