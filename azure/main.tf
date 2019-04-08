variable "location"     {}
variable "env"          {}

# Configure the Azure Provider
provider "azurerm" {
  version = "=1.24.0"
}

resource "azurerm_resource_group" "resource_group_edgy" {
  name     = "${var.env}-k8s-resources"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "k8s_edgy" {
  name                = "${var.env}-k8s"
  location            = "${azurerm_resource_group.resource_group_edgy.location}"
  resource_group_name = "${azurerm_resource_group.resource_group_edgy.name}"
  dns_prefix          = "${var.env}-k8s"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "afd40bbd-40cf-46e7-a6e7-65623de48add"
    client_secret = "lalalala"
  }

  tags = {
    Environment = "${var.env}"
  }
}