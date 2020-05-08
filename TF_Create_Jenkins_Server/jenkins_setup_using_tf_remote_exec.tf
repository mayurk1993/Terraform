provider "google" {
  zone = "us-central1-a"
  credentials = file("cred.json")
  project = "self-study-270218"
}

resource "google_compute_instance" "jenkins_server" {
  machine_type = "n1-standard-2"
  name = "jenkinserver"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      type = "pd-ssd"
      size = "100"
    }
  }

  network_interface {
    network = <ref to your network or create new network and provide ref to it>
    access_config {
      nat_ip = ""
    }
  }

  tags = ["allow-tcp-8080","http-server","https-server"] // create firewall rules and provide tags here

  provisioner "remote-exec" {
    inline = [
      "sudo yum install java-1.8.0-openjdk-devel -y",
      "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
      "sudo yum install jenkins -y",
      "sudo systemctl start jenkins",
      "systemctl status jenkins",
    ]

    connection {
        user = "***"
        host = google_compute_instance.jenkins_server.network_interface[0].access_config[0].nat_ip
        private_key = file("path to private key")
}
}
}
