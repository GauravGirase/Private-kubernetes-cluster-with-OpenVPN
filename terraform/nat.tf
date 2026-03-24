resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${local.env}-nat"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
    vpc_id = aws_vpc.main.id
    subnet_id = aws_subnet.public_zone1.id
    allocation_id = aws_eip.eip.id

    tags = {
        Name = "${local.env}-nat"
    }

    depends_on = [aws_internet_gateway.igw]

}