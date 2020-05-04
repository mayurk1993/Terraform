# Terraform

#Jenkins setup using Terraform

The terraform file jenkins_setup_using_tf_remote_exec.tf will do following tasks :
1. Create a centos-7 server in GCP project.
2. Attach a boot disk of type pd-ssd and size 100GB.
3. Attach tags for allowing traffic on 8080.
4. Install Java and Jenkins on the server.
5. Start Jenkins service.

#Pre-requisites
1. Get service account details from GCP project in JSON format and fill in cred.json. This file will be used for authentication to GCP.
2. Get network URI details to create this jenkins server in existing network. Network URI can be found using below command:
  a) gcloud compute networks list --uri
3. Create firewall rules and put network tags in tags block in terraform script.
4. Create a ssh key pair. Put value of public key in GCP metadata and use path to private key in terraform script.
5. Username used in key pair should be used for user in terraform script.
