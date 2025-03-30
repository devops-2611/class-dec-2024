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
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/devops-2611/jens.git']])
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
                    cd ENV
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






#############################################


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
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/devops-2611/jens.git']])
            }
        }
        stage('az login ') {
            steps {
                withCredentials([azureServicePrincipal('azure_sp')]) {
                    bat '''
                    cd ENV
                    az login --service-principal --username 75d461cc-79f9-461a-9903-40ce03137f28  --password 1D98Q~cNoo0EkumEazf6BIng14jbq-KZM2fSsdh3 --tenant 06442773-4112-42a4-a440-05b0566119c5
                    '''
                }
            }
        }
        stage('terraform init plan apply ') {
            steps {

                    bat '''
                    cd ENV
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
