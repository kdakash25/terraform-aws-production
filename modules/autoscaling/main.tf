resource "aws_launch_template" "app" {
  name_prefix   = "app-template"
  image_id      = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"
}

resource "aws_autoscaling_group" "asg" {
  min_size         = 2
  max_size         = 4
  desired_capacity = 2
  vpc_zone_identifier = var.subnets

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}
