//Test Variables
variable "stringtype" {
  type    = "string"
  default = "variablevalue"
}

variable "maptype" {
  type = "map"

  default = {
    item1 = "ItemOne"
    item2 = "ItemTwo"
  }
}

variable "listtype" {
  type    = "list"
  default = ["item1", "item2"]
}

//Azure connection variables
variable "subscription_id" {}

variable "client_id" {}
variable "client_secret" {}
variable "tennant_id" {}

//Google Compute Variables
variable network_name {
  type        = "string"
  default     = "devnetwork"
  description = "Network name for Google Cloud Platform infrastructure"
}

variable gcp_ip_cidr_range {
  type        = "string"
  default     = "10.0.0.0/16"
  description = "IP CIDR Range for GCP VPC"
}

//AWS variables
variable aws_ip_cidr_range {
  type        = "string"
  default     = "10.0.1.0/24"
  description = "IP CIDR Range for AWS VPC"
}

variable subnet_names {
  type = "map"

  default = {
    subnet1 = "firstsubnet"
    subnet2 = "secondsubnet"
    subnet3 = "thirdsubnet"
  }
}
// Output variables
output "output_variable" {
    value = "this is the value of output variable"
}

output "aws_cidr_subnet_1" {
    value = "${aws_subnet.subnet_1.cidr_block}"
}
