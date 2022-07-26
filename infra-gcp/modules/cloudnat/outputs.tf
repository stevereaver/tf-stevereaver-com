output "gomarkets_cloud_router_name" {
  value       = module.gomarkets_cloud_router.router.name
  description = "The name of the created router"
}

output "gomarkets_cloud_router_region" {
  value       = module.gomarkets_cloud_router.router.region
  description = "The region of the created router"
}