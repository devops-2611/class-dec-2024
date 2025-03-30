pipeline {
    agent any

    stages {
        stage('clear work space') {
            steps {
                cleanWs()
            }
        }

        stage('git clone') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/devops-2611/class-terraform-codes.git']])
            }
        }
        stage('az login') {
            steps {
                withCredentials([azureServicePrincipal('azure_sp')]) {
                    bat'''
                    az login --service-principal -u %AZURE_CLIENT_ID% -p %AZURE_CLIENT_SECRET% -t %AZURE_TENANT_ID%
                    '''
                }
            }
        }
        stage('terraform init') {
            steps {
                dir('ENV') {
                    bat '''
                    terraform init

                    '''
                }
            }
        }
        stage('terraform plan') {
            steps {
                dir('ENV') {
                    bat '''
                    terraform plan
                    '''
                }
            }
        }
        stage('terraform apply') {
            steps {
                dir('ENV') {
                    bat '''
                    terraform apply -auto-approve
                    '''
                }
            }
        }




    }
}


bat 'az login --service-principal -u %AZURE_CLIENT_ID% -p %AZURE_CLIENT_SECRET% -t %AZURE_TENANT_ID%'

sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'

cloudops-- cloud
decops
finops

solution archtitect






##############################################################################################