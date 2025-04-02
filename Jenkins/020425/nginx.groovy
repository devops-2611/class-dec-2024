pipeline {
    agent { label 'vishal' }

    stages {
        stage('clear WS') {
            steps {
                cleanWs()
            }
        }

        stage('check node npm or not') {
            steps {
                sh '''
                if node -v > /dev/null 2>&1; then
                    echo "node is installed."
                    node -v
                else
                    sudo apt-get update
                    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
                    sudo apt-get install -y nodejs
                    sudo apt install npm
                    npm install
                    node -v
                    npm -v

                fi
                '''
            }
        }
    }
}
