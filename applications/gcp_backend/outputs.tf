output "region" {
  value       = module.gke_backend.region
}

output "project_id" {
  value       = module.gke_backend.project_id
}

output "kubernetes_cluster_name" {
  value       = module.gke_backend.kubernetes_cluster_name
}

output "kubernetes_cluster_host" {
  value       = module.gke_backend.kubernetes_cluster_host
}
