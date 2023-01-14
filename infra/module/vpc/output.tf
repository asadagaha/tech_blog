output "vpc_id" {
  value = aws_vpc.main.id
}
output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}
output "subned_public_1a_id" {
  value = aws_subnet.public_1a.id
}
output "subned_public_1c_id" {
  value = aws_subnet.public_1c.id
}
output "subned_private_1a_id" {
  value = aws_subnet.private_1a.id
}
output "subned_private_1c_id" {
  value = aws_subnet.private_1c.id
}
output "route_table_id" {
  value = aws_route_table.public.id
}
