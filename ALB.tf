resource "aws_lb" "front_end" {
  name               = "AddX-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [<mySecurityGroupId>]
  subnets            = <myPublicSubnetIds>
}

resource "aws_lb_target_group" "front_end" {
  name     = "AddX-tg"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = <myvpcid>
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::<myaccountid>:server-certificate/<mySSLcertificate>"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}
