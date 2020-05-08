provider "google" {
  zone = "us-central1-a"
  credentials = file("/root/terraform_study/cred.json")
  project = "self-study-270218"
}
