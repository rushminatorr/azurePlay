# AzurePipelines
This project is a quick setup to test out Azurepiplines. We use Terraform to deploy an Azure k8s service.

## Prerequisites
You will need following tools. Please install these as per your setup for your terminal configurations. 

- Azure Devops account
- Azure subscription 
- [az cli](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
- [Terraform](https://www.terraform.io/downloads.html)

## Usage
- `terraform init`
- `terraform plan -var-file=vars-dev.tfvars`
- `terraform apply -auto-approve -var-file=vars-dev.tfvars`
- `terraform destroy -auto-approve -var-file=vars-dev.tfvars`

### Authenticating to Azure
We will be using a Service Principle to authenticate for terraform when runing non-interactively.
Please see the [documentation](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_certificate.html) on how to set this up.

### Using Azure Pipeline

## ToDO
- parameterize creds
- Add [TLS](https://www.terraform.io/docs/providers/tls/index.html) for generating and storing certs
- Add [Tests](https://www.terraform.io/docs/extend/testing/index.html)
- Add [Helm](https://www.terraform.io/docs/providers/helm/index.html) to deploy helm chart
- Address separation of concern