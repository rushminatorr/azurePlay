variable "auth_token"   {}
variable "location"     {}

# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.auth_token}"
}

locals {
  project_id = "880125b9-d7b6-43c3-99f5-abd1af3ce879"
}

resource "packet_device" "edgy" {
  hostname          = "edgy"
  plan              = "t1.small.x86"
  operating_system  = "ubuntu_16_04"
  billing_cycle     = "hourly"
  project_id        = "${local.project_id}"
  facility          = "${var.location}"
}

resource "packet_device" "edgy_agent" {
  hostname          = "edgy-agent"
  plan              = "t1.small.x86"
  operating_system  = "ubuntu_16_04"
  billing_cycle     = "hourly"
  project_id        = "${local.project_id}"
  facility          = "${var.location}"
}