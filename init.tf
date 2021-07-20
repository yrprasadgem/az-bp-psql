#Values here will go as env variables in th pipeline or passed during run time
provider "azurerm" {
  version = "~> 2.35.0"
  features {}
}

# Define Terraform provider
# all the values will go as env variables
terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "rg-stg-sapapp01"
    storage_account_name = "contourtfprod"
    container_name       = "contour-tfstate-stg"
    key                  = "terraform-nonprod-psql-stg01.tfstate"
  }
}