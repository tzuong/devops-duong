
pipeline {
    agent any

    stages {
        stage('Checkout source') {
            steps {
                checkout scm
            }
        }

        stage('Build project') {
            steps {
                sh '''
                    test -f Dockerfile
                    test -f site/index.html
                    docker build -t devops-duong:latest .
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f devops-duong-web || true
                    docker run -d --name devops-duong-web --restart unless-stopped -p 8081:80 devops-duong:latest
                '''
            }
        }
    }
}
