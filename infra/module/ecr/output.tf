output "front_url" {
  value = aws_ecr_repository.frontend.repository_url
}
output "back_url" {
  value = aws_ecr_repository.backend.repository_url
}
