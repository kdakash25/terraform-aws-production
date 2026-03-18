resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "public" {
  count = 2

  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)

  availability_zone = element(
    ["ap-south-1a", "ap-south-1b"],
    count.index
  )

  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + 10)

  availability_zone = element(
    ["ap-south-1a", "ap-south-1b"],
    count.index
  )
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
}
resource "aws_route_table_association" "public" {
  count = 2

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
