data "terraform_remote_state" "state_network" {
	backend = "gcs"
	config = {
		bucket = "tf-state-buck"
		credentials = "/root/terraform_study/cred.json"
    		prefix = "my_network.tfstate"
	}
}
