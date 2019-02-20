resource "google_compute_network" "our_development_network" {
    name = "devnetwork"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-subnet" {
    ip_cidr_range = "10.0.1.0/24"
    name = "devsubnet"
    network = "${google_compute_network.our_development_network.self_link}"
    region = "europe-west3"
}

resource "aws_vpc" "environment-example-two" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags {
        Name = "terraformaws-vpc-example-two"
    }
}

resource "aws_subnet" "subnet_1" {
    cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)}"
    vpc_id = "${aws_vpc.environment-example-two.id}"
    tags {
        Name = "Subnet_1"
    }
}

resource "aws_subnet" "subnet_2" {
    cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 2, 2)}"
    vpc_id = "${aws_vpc.environment-example-two.id}"
    availability_zone = "eu-central-1b"
    tags {
        Name = "Subnet_2"
    }
}

resource "aws_security_group" "subnet_security" {
    vpc_id = "${aws_vpc.environment-example-two.id}"
    ingress {
        cidr_blocks = [
            "${aws_vpc.environment-example-two.cidr_block}"
        ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
}

resource "azurerm_resource_group" "azure_network" {
    location = "West Europe"
    name = "devresgrp"
}

resource "azurerm_virtual_network" "blue_vr_network" {
    address_space = ["10.0.0.0/16"]
    location = "West Europe"
    name = "bluevrnetwork"
    resource_group_name = "${azurerm_resource_group.azure_network.name}"
    dns_servers = ["10.0.0.4","10.0.0.5"]

    subnet {
        name = "subnet1"
        address_prefix = "10.0.1.0/24"
    }

    subnet {
        name = "subnet2"
        address_prefix = "10.0.2.0/24"
    }

    tags {
        environment = "blue-world-finder"
    }
} 