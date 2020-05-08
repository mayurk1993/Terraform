resource "google_compute_network" "my_network" {
	name = "mynetwork"
  	auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnet" {
	name = "mysubnet"
	region = "us-east1"
	ip_cidr_range = "10.130.0.0/20"
	network = google_compute_network.my_network.self_link
	private_ip_google_access = false
}

output "net_name" {
  value = google_compute_network.my_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.my_subnet.name
}
