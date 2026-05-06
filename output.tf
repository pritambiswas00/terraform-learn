
output "vpc_id" {
  value = aws_vpc.demo-vpc.id
}

output "instance_id" {
  value = aws_instance.demo-instance.id
}
