terraform {
  backend "gcs" {
    bucket = "tf-state-buck"
    credentials = "/root/terraform_study/cred.json"
    prefix = "my_network.tfstate"
  }
}
