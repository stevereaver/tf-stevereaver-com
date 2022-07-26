module "gomarkets_cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.4"
  project = var.project_id
  name    = "stevereaver-cloud-router"
  network = var.network
  region  = var.region
  nats = [{
    name                                = "stevereaver-nat-gateway",
    enable_endpoint_independent_mapping = true,
    icmp_idle_timeout_sec               = 30,
    min_ports_per_vm                    = var.min_ports_per_vm,
    max_ports_per_vm                    = var.max_ports_per_vm,
    nat_ip_allocate_option              = "AUTO_ONLY",
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES",
    tcp_established_idle_timeout_sec    = 1200,
    tcp_transitory_idle_timeout_sec     = 30,
    udp_idle_timeout_sec                = 30,
  }]
}