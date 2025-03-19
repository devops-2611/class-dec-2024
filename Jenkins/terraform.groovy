pipeline {
    agent any

    stages {
        stage('clean work space') {
            steps {
                cleanWs()
            }
        }
        
        stage('git clone') {
            steps {
                withCredentials([gitUsernamePassword(credentialsId: 'github', gitToolName: 'Default')]) {
                bat '''
                git clone https://github.com/devops-2611/Terraform.git
                
                '''
    
                }
                
            }
        }        
    }
}
