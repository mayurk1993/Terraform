resource "google_compute_instance" "my_server" {
  machine_type = "n1-standard-2"
  name = "myserver1"
  zone = "us-east1-b"


  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      type = "pd-ssd"
      size = "100"
    }
  }

  network_interface {
    network = data.terraform_remote_state.state_network.outputs.net_name
    subnetwork = data.terraform_remote_state.state_network.outputs.subnet_name
  }
}

