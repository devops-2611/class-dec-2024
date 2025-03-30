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
    }
}





