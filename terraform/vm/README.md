# Create an Azure VM with Terraform

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

# Login with SSH
ssh -i ~/.ssh/id_ed25519.pub adminuser@[VM public IP]
```

# Deploy application on VM

- After creating the VM, clone the GitHub repository:

```bash
git clone https://github.com/udacity/nd081-c1-exercises
```

- Navigate to the `/L2. Azure Compute Services/Creating_a_Virtual_Machine/` path in the cloned repo.

```bash
cd "L2. Azure Compute Services/Creating_a_Virtual_Machine/"
```

- Copy the application to the VM

```bash
scp -i ~/.ssh/id_ed25519.pub -r ./web adminuser@[VM public IP]:/home/adminuser
```

- Connect to the VM and check the application is deployed on the VM

```bash
scp -i ~/.ssh/id_ed25519.pub adminuser@[VM public IP]
cd /home/adminuser
ls -l ./web
```

- Install `python3-env` and `nginx`

```bash
sudo apt-get -y update && sudo apt-get -y install nginx python3-venv
```

- Configure nginx to listen for incoming traffic on port 80 and set port 3000 as the proxy.

  - Navigate to `/etc/nginx/sites-avaiable`
  - Remove the `default` file
  - Replace it with a file containing:

```bash
server {
  listen 80;
  location / {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection keep-alive;
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}
```

- Change to `web` directory and create and activate a virtual env and update `pip`

```bash
cd /home/adminuser/web
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
```

- Install dependencies in `requirements.txt`

```bash
pip install -r requirements.txt
```

- Run the application

```bash
python3 app.py
```

- Access the application in the browser: `http://[VM IP address]`

- Destroy the VM

```bash
terraform destroy auto-approve
```
