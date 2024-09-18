# Microsoft Entra ID

- Identity Management
- Access Management
- SSO
- Federation

Bases on these features other more advanced features (such as Conditional Access, Privileged Identity Management and Identity Protection) are availabe. Access to these advanced features is dependent on Entra ID license model.

Entra ID is used to manage identities and access to Azure subscriptios, Office365 subscriptions and other SAAS subscriptions  
One Entra ID tenant can be associated with zero or more Azure subscriptions  
One Azure subscription is assocated with one Entra ID tenant only

To access Entra ID you must have an Microsoft account (for example an outlook account such as john.doe@outlook.com)  
In Entra ID you can create tenants  
The primary domain name of an Entra ID tenant ends on `onmicrosoft.com`  
Next to primary domain name a custom domain name of the Entra ID tenant can be created

## Entra ID license models:

![Entra ID License models](entra_id_license_models.png)

## Entra ID is not Active Directory Domain Services (AD DS)

Microsoft Entra ID is the new name for Azure Active Directory.  
Microsoft Entra ID is something other than Active Diretcory Domain Services

![Entra ID versus AD DS](entra_id_versus_ad_ds.png)

## Custom Domain

Next to an Entra ID tenant primary domain name that has been created automatically (`.onmicrosoft.com`) you can create a custom domain name that is for users much easier to remember. When you create a custom domain name you must prove to MS you are the owner of the provided domain name. To prove this you have to add a specific TXT or MX record to the DNS registrar (Azure DNS, GoDaddy, AWS Route53). The custom domain can be configured to be the primary domain of the Entra ID tenant.

## User identities

![user identities](user_identities.png)

## Bulk Operations

There are bulk operations to create, invite or delete multiple identities at one. For example, the bulk create operation offers a csv template file you can download, edit (add new identities) and upload.

## Application identities (application registration)

![application identities](application_identities.png)

- An application identy helps to control access to the application and the access the application has to other resources
- The application itself can reside anywhere; inside or outside Azure
- Each application identity has a client ID and client secret or certificate. The application uses these credentials to prove that its identity to the Entra ID tenant. The application has to manage these credentials and store it in a safe place.
- Sometimes the name service principal is used for application identity

## Managed Identity

An application needs to manage the credentials (Client ID and secret or certificate) of the application identity and store it in a secure place. This is difficult. When you are going to run a solution (Azure VM, Azure App Service, Azure Functions) in Azure you do not have to use an application identity. Instead you can create a managed identity and the application does not have to manage the identity credentials any more.

**system-assigned managed identity**: This identity is enabled directly on an Azure resource. When the resource is created the managed identity is automatically created and when the resource is deleted, the managed identity is automatically deleted.

**user-assigned managed identity**: This identity is created as an independent Azure resource and can be assigned to one or more resources. Since it is not tied to a specific resource, it can be shared across different Azure resources and managed separately from the resource lifecycle. Useful when you want to share the same identity across multiple resources for consistent access to Azure services.
