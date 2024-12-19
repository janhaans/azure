# Deploy Azure SQL Database with Azure CLI

## Create SQL Server

```bash
az sql server create \
--admin-user udacityadmin \
--admin-password p@ssword1234 \
--name hello-world-server \
--resource-group resource-group-west \
--location westus2 \
--enable-public-network true \
--verbose
```

## Create Firewall rule

Next, we have to create two firewall rules. These are the same two rules we checked as yes when we used the portal.

The first one is to allow Azure services and resources to access the server we just created.

```bash
az sql server firewall-rule create \
-g resource-group-west \
-s hello-world-server \
-n azureaccess \
--start-ip-address 0.0.0.0 \
--end-ip-address 0.0.0.0 \
--verbose
```

## Create clientIp firewall rule

This second rule is to set your computer's public Ip address to the server's firewall. You'll need to find your computer's public ip address for this part.

I'm using macOS, so I used the command `curl ifconfig.me`; you can use `ipconfig` in the command prompt if you are on Windows.

```bash
az sql server firewall-rule create \
-g resource-group-west \
-s hello-world-server \
-n clientip \
--start-ip-address <PUBLIC-IP-ADDRESS> \
--end-ip-address <PUBLIC_IP_ADDRESS> \
--verbose
```

## Create SQL Database

Finally, to create the database itself, I used the below command.

```bash
az sql db create \
--name hello-world-db \
--resource-group resource-group-west \
--server hello-world-server \
--service-objective S0 \
--verbose
```

## Adding Data

We'll again add data to the database through the portal, as that's the most straightforward method for now (until we connect to an app).

Access Azure Portal and go to the Azure SQL Database and open the Query Editor

**QUERY1**:

```sql
CREATE TABLE ANIMALS(
    id INT NOT NULL IDENTITY(1, 1),
    name VARCHAR(75) NOT NULL,
    scientific_name VARCHAR(75) NOT NULL,
	description VARCHAR(800) NOT NULL,
    image_path VARCHAR(100) NULL,
	PRIMARY KEY (id)
);

INSERT INTO dbo.animals (name, scientific_name, description)
VALUES (
    'Bengal tiger',
    'Panthera tigris tigris',
    'A big orange cat! They like to hunt and usually live alone. Are found largely in India and Bangladesh.'
);

INSERT INTO dbo.animals (name, scientific_name, description)
VALUES (
    'African bush elephant',
    'Loxodonta africana',
    'Huge, incredibly intelligent mammals, with large, distinctive tusks. Found in multiple locations throughout Africa.'
);

INSERT INTO dbo.animals (name, scientific_name, description)
VALUES (
    'Monarch Butterfly',
    'Danaus plexippus',
    'A butterfly typically covered in orange, black and white markings. Can be found throughout the Americas, as well as in many islands in the Pacific and Australia.'
);
```

**QUERY2**

```sql
SELECT * FROM ANIMALS
```

## Cleanup

You can find the CLI commands for cleaning up the SQL resources below.

## Delete DB

```bash
az sql db delete \
--name hello-world-db \
--resource-group resource-group-west \
--server hello-world-server \
--verbose
```

## Delete SQL Server

```bash
az sql server delete \
--name hello-world-server \
--resource-group resource-group-west \
--verbose
```
