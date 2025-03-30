pipeline {
    agent any

    stages {
        stage('clear WS') {
            steps {
                cleanWs()
                }
        }
        stage('git clone') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/devops-2611/class-codes.git']])
            }
        }
        stage('az login ') {
            steps {
                withCredentials([azureServicePrincipal('azure_sp')]) {
                    bat '''
                    az login --service-principal -u %AZURE_CLIENT_ID% -p %AZURE_CLIENT_SECRET% -t %AZURE_TENANT_ID%
                    '''
                }
            }
        }
        stage('terraform init plan apply ') {
            steps {

                    bat '''
                    cd ENV-git
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
