# azure-terraform-aks-quickstart
Using Terraform to provision an AKS cluster and deploy to it

I am using the standard prefix abbreviations for Azure resources that can be found here.
https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

## Docker

Build the Container Image locally:
`docker build -t snap-user-api:v1 .`

Run the Container
`docker run --rm --name snap-user-api2 -d -p 8080:80 snap-user-api:v1`

Call the API on the local container:
`curl localhost:8080/WeatherForecast`
