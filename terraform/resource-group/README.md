# Deploy an Azure Resource Group with Terraform

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

# Use  Azure CLI to list the created resource group
az group list --query "[?location == 'westeurope' && name == 'hello-world-rg']"
```

**Note:** [JMESPath](https://jmespath.org/) is used in Azure CLI to query the JSON document
