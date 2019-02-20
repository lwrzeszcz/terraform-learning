provider "google" {
    credentials = "${file("../gcp_acc.json")}"
    project = "terraform-practice-232212"
    region = "europe-west3-a"
}

provider "aws" {
    region = "eu-central-1"
}

provider "azurerm" {
    subscription_id = "1"
    client_id = "2"
    client_secret = "2"
    tennant_id = "3"
}