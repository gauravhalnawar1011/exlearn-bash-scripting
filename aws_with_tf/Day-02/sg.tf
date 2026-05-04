resource "aws_security_group" "tf-sg" {
    name = "tf-sg"
    description = "this first sg using tf"
    vpc_id = "vpc-0a8444136090ba2f4"
    
  tags = {
    Name = "tf-sg-day3"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
    security_group_id = aws_security_group.tf-sg.id
    description = "this for the https rule"
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = "443"
    to_port = "443"


    tags = {
        Name = "allow-https"
    }
  
}


resource "aws_vpc_security_group_egress_rule" "allow-outbound" {

  security_group_id = aws_security_group.tf-sg.id
  description = "this for the outbound acces to the sg"
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name = "outbound-acess"
  }

}