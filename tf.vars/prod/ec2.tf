resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = merge(
        local.common_tags,
        {
          Name = "${local.common_name}-tfvars-multi-env"
        }
  )
}

resource "aws_security_group" "allow_all" {
  name = "${local.common_name}-tfvars-multi-env"
  egress {
    from_port        = var.egress_from_port # from port 0 to to port 0 means all ports
    to_port          = var.egress_to_port
    protocol         = var.protocol # -1 all protocols
    cidr_blocks      = var.cidr # internet
  }
    
  ingress {
    from_port        = var.ingress_from_port # from port 0 to to port 0 means all ports
    to_port          = var.ingress_to_port 
    protocol         = var.protocol # -1 all protocols
    cidr_blocks      = var.cidr # internet
  }

  tags = merge(
         local.common_tags,
         {
          Name = "${local.common_name}-tfvars-multi-env"
         }
  )
}