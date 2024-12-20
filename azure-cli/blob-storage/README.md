# Deploy Blob Storage with CLI

First, we create our storage account. We use the following command:

```bash
az storage account create \
 --name helloworld12345 \
 --resource-group resource-group-west \
 --location westus2
```

The storage will default to general-purpose V2 and the access tier cannot be set, so it will default to hot.

Then we create our container.

```bash
az storage container create \
 --account-name helloworld12345 \
 --name images \
 --auth-mode login \
 --public-access container
```

You can go to the portal to check that the storage account and container have been created. You can then upload an image through the portal.
