resource "aws_lb" "app_lb" {
  name               = "production-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets
}