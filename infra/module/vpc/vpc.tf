resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.app}-vpc-${var.env}"
  }
}

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


resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.app}-igw-${var.env}"
  }
}

#resource "aws_vpc_endpoint" "s3" {
#  vpc_id              = aws_vpc.main.id
#  service_name      = "com.amazonaws.ap-northeast-1.s3"
#  vpc_endpoint_type = "Gateway"
#}
#resource "aws_vpc_endpoint" "ecr_dkr" {
#  vpc_id              = aws_vpc.main.id
#  service_name        = "com.amazonaws.ap-northeast-1.ecr.dkr"
#  vpc_endpoint_type   = "Interface"
#  subnet_ids          = [aws_subnet.public_1a.id,  aws_subnet.public_1c.id]
#  security_group_ids  = [var.vpc_endpoint_sg_id]
#}
#resource "aws_vpc_endpoint" "ecr_api" {
#  vpc_id              = aws_vpc.main.id
#  service_name        = "com.amazonaws.ap-northeast-1.ecr.api"
#  vpc_endpoint_type   = "Interface"
#  subnet_ids          = [aws_subnet.public_1a.id,  aws_subnet.public_1c.id]
#  security_group_ids  = [var.vpc_endpoint_sg_id]
#}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.app}-public-${var.env}"
  }
}
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_main_route_table_association" "vpc" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}
#resource "aws_vpc_endpoint_route_table_association" "s3" {
#  vpc_endpoint_id = aws_vpc_endpoint.s3.id
#  route_table_id = aws_route_table.public.id
#}