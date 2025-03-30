pipeline {
    agent {label 'vishal'}

    stages {
        stage('create directory') {
            steps {
                sh'''
                cd /home/welcomeuser
                sudo mkdir vishal
                '''
            }
        }
    }
}
