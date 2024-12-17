# Create Azure Resource Group with Azure CLI

```bash
# Login to Azure Subscription
az login

# List all locations in table format
az account list-locations -o table

# Create Resource Group
az group create \
    --name hello-world-rg \
    --location westeurope

# List the created resource group
az group list --query "[?location == 'westeurope' && name == 'hello-world-rg']"
```

**Note:** [JMESPath](https://jmespath.org/) is used in Azure CLI to query the JSON document
