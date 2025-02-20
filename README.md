**Install Terraform on Linux (Ubuntu)**
```sh
# Add HashiCorp GPG key
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the HashiCorp repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
sudo apt update && sudo apt install terraform

# Verify installation
terraform --version
```

**Install Azure CLI on Linux (Ubuntu)**

```sh
# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Verify installation
az --version
```


**Terraform Basic Commands**

```sh
# Logout from Azure CLI
az logout

# Show current account details
az account show

# Set a specific subscription
az account set --subscription e4017399-a8f8-47ab-b5cb-54fc05394426

# List available subscriptions
az account list

# List Azure resource groups in table format
az group list --output table

# Initialize Terraform
terraform init

# Validate Terraform configuration
terraform validate

# Format Terraform code
terraform fmt

# Plan the Terraform deployment
terraform plan

# Apply the Terraform configuration
terraform apply -auto-approve
```


**Azure CLI Login Methods**

```sh
# Login using username and password
az login --user <username> --password <password>

# Login using a service principal
az login --service-principal --username <app-id> --password <password> --tenant <tenant-id>

# Example of service principal login
az login --service-principal --username 3414d373-1d96-443e-af46-7daa8cfa89e1 \
  --password mOx8Q~RoeNbCr9rMKhAtQFp95ILnacqMuncDaddR \
  --tenant d55a431a-c0e3-4193-b60c-04b399af4148

# Login using a device code (useful for interactive login)
az login --use-device-code
```


**Install Java on Ubuntu**

```sh
# Update package lists
sudo apt update

# Install OpenJDK 17
sudo apt install fontconfig openjdk-17-jre

# Verify Java installation
java -version
```


**Expected Output:**
```
openjdk version "17.0.13" 2024-10-15
OpenJDK Runtime Environment (build 17.0.13+11-Debian-2)
OpenJDK 64-Bit Server VM (build 17.0.13+11-Debian-2, mixed mode, sharing)
```

**Install Jenkins on Ubuntu**

```sh
# Add the Jenkins GPG key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add the Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists and install Jenkins
sudo apt-get update
sudo apt-get install jenkins
dpkg -l | grep jenkins



cd /etc
nano /etc/sudoers   or sudo visudo
cat /etc/sudoers
%sudo   ALL=(ALL:ALL) ALL
jenkins ALL=(ALL) NOPASSWD:ALL  

```

