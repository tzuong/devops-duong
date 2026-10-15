pipeline {
    agent any
    stages {
        stage('Checkout source') {
            steps { checkout scm }
        }
        stage('Build project') {
            steps { sh 'test -f Dockerfile && test -f site/index.html' }
        }
    }
}
