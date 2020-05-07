provider "google" {
  zone = "us-central1-a"
  credentials = file("/root/terraform_study/cred.json")
  project = "self-study-270218"
}

resource "google_compute_instance" "jenkins_server" {
  machine_type = "n1-standard-2"
  name = "myserver"
  zone = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      type = "pd-ssd"
      size = "100"
    }
  }

  network_interface {
    network = "https://www.googleapis.com/compute/v1/projects/self-study-270218/global/networks/default"
  }
}
