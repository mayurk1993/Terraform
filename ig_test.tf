provider "google" {
	credentials = file("cred.json")
	project = "self-study-270218"
	region = "us-central1"
}

resource "google_compute_instance_group" "test" {
  name        = "terraform-test"
  description = "Terraform test instance group"
  zone        = "us-central1-a"
  network     = "https://www.googleapis.com/compute/v1/projects/self-study-270218/global/networks/default"
  instances = [
    "https://www.googleapis.com/compute/v1/projects/self-study-270218/zones/us-central1-a/instances/dev-instance"
  ]
}


