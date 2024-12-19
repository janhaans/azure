# Deploy web application on Azure App Service with Terraform

The Terraform template will:

- Create a Resource Group
- Create a Azure App Service Plan
- Create a Azure App Service
- Deploy a simple Python web application (Flask) from GitHub [hello-world-azure-app-service](https://github.com/janhaans/hello-world-azure-web-app)

**Note**: In this example Terraform will deploy the Python web application. This is possible because the GitHub repo is public. However, usually the application will be deployed by the CI/CD pipeline (GitHub Actions)

```bash
# Login in to your Azure subscription with Azure CLI
az login

# Terraform commands
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform show
terraform destroy -auto-approve
```

Terraform outputs the URL of the Azure App Service.

## Deploy
