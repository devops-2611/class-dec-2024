pipeline {
    agent { label 'vishal' }

    stages {
        stage('clear WS') {
            steps {
                cleanWs()
            }
        }

        stage('check terraform vishal or not') {
            steps {
                sh '''
                if terraform --version > /dev/null 2>&1; then
                    echo "Terraform is installed."
                    terraform -v
                else
                    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
                    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
                    sudo apt update && sudo apt install terraform
                fi
                '''
            }
        }

        stage('check az installed or not') {
            steps {
                sh '''
                if az --version > /dev/null 2>&1; then
                    echo "azure is already installed."
                    az --version
                else
                    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
                fi
                '''
            }
        }

        stage('az login ') {
            steps {
                withCredentials([azureServicePrincipal('azure_sp')]) {
                    sh '''
                    az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
                    echo "az login successfully"

                    '''
                }
            }
        }
        stage('git clone ') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_cred', url: 'https://github.com/devops-2611/class-terraform-codes.git']])
            }
        }
        stage('terraform commnads ') {
            steps {
                dir('ENV_SA') {
                    sh '''
                    terraform init 
                    terraform validate
                    terraform fmt
                    terraform plan
                    terraform apply -auto-approve

                    '''
                    }
            }
        }


    }
}
