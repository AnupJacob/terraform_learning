resource "aws_internet_gateway" "develop-internet_gateway_1" {
  vpc_id = "${aws_vpc.develop_vpc.id}"
  depends_on = [aws_vpc.develop_vpc]
}