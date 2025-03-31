## Provider's Example

# Conigure the AWS Provider
provider "aws" {
	region = "us-east-1"
	version  = "5.86.1"
}

# Conigure the Microsoft Azure Provider
provider "azurerm" {
	version  = "4.18.0"
	features {}
}