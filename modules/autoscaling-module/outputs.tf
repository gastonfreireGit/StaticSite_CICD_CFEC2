output "elb_dns_name" {
  value = aws_elb.web_elb.dns_name
}

output "autoscaling_name" {
  value = aws_autoscaling_group.web.name
}