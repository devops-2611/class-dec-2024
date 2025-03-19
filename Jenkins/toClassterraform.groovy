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


#######################################################

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
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'devops-2611_github', url: 'https://github.com/devops-2611/Terraform.git']])
            }
        }        
    }
}




#######################################################

pipeline {
    agent any

    stages {
        stage('repo clone') {
            steps {
                withCredentials([gitUsernamePassword(credentialsId: 'cd_github', gitToolName: 'Default')]) {
                    sh 'git clone https://github.com/careerdeveloper1/feb-2025.git'
                }
            }
        }
        stage('az login') {
            steps {
                sh '''
                az login --service-principal --username 18659d11-11e4-42e5-9b69-638274387bc1  --password ~jH8Q~UvEoLU6ujO0NeXnp1NPBQg5sRIZwbG7csu --tenant a2dcda4c-6820-4a91-a47f-0cec6a622c84
                '''
            }
        }
        stage('terraform init') {
            steps {
                sh '''
                cd feb-2025/220225/ENV
                terraform init

                '''
            }
        }

    }
}


##########################################################
