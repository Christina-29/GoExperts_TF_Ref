output "load_balancer_dns" {
  description = "Accessible load balancer DNS"
  value       = "${module.aws_backend.load_balancer_dns}"
}
