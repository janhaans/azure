# Deploy a web application on Azure App Service with Azure CLI

- Login to Azure subscription

```bash
az login
```

- Clone the web application

```bash
git clone git@github.com:janhaans/hello-world-azure-web-app.git
```

- Go to the web application

```bash
cd hello-world-azure-web-app
```

- Deploy the web application

```bash
az webapp up \
    --resource-group hello-world-rg \
    --location westeurope
    --sku F1 \
    --verbose
```

- Destroy the web application

```bash
az group delete -n hello-world-rg
```
