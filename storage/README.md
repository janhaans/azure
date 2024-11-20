# Storage

![storage overview](storage-overview.png)

When you want to use one of these storage service you first need to create a **storage account**

## Storage Account

![storage account](storage-account.png)

## Storage Account Properties

![storage account properties](storage-account-properties.png)

The type of redundancy you can choose from depends on the selected performance (standrad, premium) and type (General Purpose, Block Blob, Page Blob, File)

- **LRS**: Local Redundant Storage
- **ZRS**: Zone Redundant Storage
- **GRS**: Geo Redundant Storage (failover to another region)
- **GZRS**: Geo Zone Redundant Storage

## Storage Account Types

![storage account types](storage-account-types.png)

## Blob Storage

- Blob Storage is built for web access
- Blob Storage containers does not have an hierarchy unless you select HNS (Hierarchy Name Space)
- Blob storage is the only storage type that provides public anonymous access
- Public access levels (at container level):
  - Private: no anonymous access
  - Blob: anonymous read access for blobs only (blob level)
  - Container: anonymous read access for containers and blobs) (container level)

![blob storage](blob-storage.png)

![blobs](blobs.png)

### Blob Sub-Types

- **Blob Version**: automatically version blobs
- **Blob Snapshot**: Read-only point-in-time copy of a blob (only store differences (incremental))
- **Soft Deleted Blob**: Deleted blob that will be retained for a specified retention period

## How to control access to the data in Storage Account

3 options control HTTP (or HTTPS) access:

- Access Key bases access (storage account level)
- Entra ID based access (container level)
- SAS (Shared Access Signature) based access (data level)

Note: Blobs can also be accessed with NFS, and Files can also be accessed with SMB,NFS. When using these protocols there are other ways to control access.

![data storage access control](data-storage-access-control.png)

## Access Key

![access key](access-key.png)

## Entra ID Based Access

![entra ID access](entraid-access.png)

## SAS Based Access

### Service SAS

- Token that provides restricted access to a specific individual service (a blob, file, table, queue)
- Permissions for specific IP/ IP range
- Token Expires after some specified time
- CRUD permissions
- Service SAS is signed by Access Key. If the Access Key is rotated the Service SAS is revoked
- The SAS token is given to someone or something.
- A Service SAS is like a ticket given to a client, the server does not control access, access is in the ticket. If you do not like that then you can use **Stored Access Policy** to facilitate service-side control over Service SAS (see picture below)

![service sas](service-sas.png)

### Account SAS

- Account SAS is similar to Service SAS but can provide access to multiple individual services instead of single individual service
- Account SAS is signed by Access Key. If the Access Key is rotated the Account SAS is revoked
- An Account SAS is like a ticket given to a client, the server does not control access, access is in the ticket. If you do not like that then you can use **Stored Access Policy** to facilitate service-side control over Account SAS

### User Delegation SAS

- More secure because User Delegated SAS is associated/created with an EntraID identity
- Only for Blob storage
