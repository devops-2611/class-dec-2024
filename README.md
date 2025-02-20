**Install Terrform on Linux (ubuntu)**
1. wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg echo "deb [arch=$(dpkg --print-architecture) signed- by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
2. sudo apt update && sudo apt install terraform
3. terraform --version

**Isntall AZ on Linux(ubuntu)**

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az --version



