resource "aws_route_table" "develop-route_table" {
  vpc_id = aws_vpc.develop_vpc.id

  route = []

  tags = {
    Name = "route table for development"
  }
}

resource "aws_route_table_association" "route_table_association_1" {
  route_table_id = aws_route_table.develop-route_table.id
  gateway_id = aws_internet_gateway.develop-internet_gateway_1.id
}