provider "google" {
  credentials = "${file("../gcp_acc.json")}"
  project     = "terraform-practice-232212"
  region      = "europe-west3"
}

provider "aws" {
  region = "eu-central-1"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tennant_id}"
}
