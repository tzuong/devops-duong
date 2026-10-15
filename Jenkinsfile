
def telegramNotify(String message) {
    withCredentials([
        string(credentialsId: 'telegram-bot-token', variable: 'TELEGRAM_TOKEN'),
        string(credentialsId: 'telegram-chat-id', variable: 'TELEGRAM_CHAT_ID')
    ]) {
        withEnv(["TG_MESSAGE=${message}"]) {
            sh '''
                curl -fsS -X POST \
                  "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
                  --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
                  --data-urlencode "text=${TG_MESSAGE}"
            '''
        }
    }
}

pipeline {
    agent any

    stages {
        stage('Telegram - Deploy Started') {
            steps {
                script {
                    telegramNotify(
                        "🚀 DEPLOY STARTED\n\nProject: devops-test\nBranch: main"
                    )
                }
            }
        }

        stage('Checkout source') {
            steps {
                checkout scm
            }
        }

        stage('Install dependencies') {
            steps {
                echo 'Website tinh khong can cai dependencies.'
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
                    docker run -d \
                      --name devops-duong-web \
                      --restart unless-stopped \
                      -p 8081:80 \
                      devops-duong:latest
                '''
            }
        }
    }

    post {
        success {
            script {
                telegramNotify(
                    "✅ DEPLOY SUCCESS NHÉ\n\nProject: devops-test\nBranch: main\nURL: https://example.com"
                )
            }
        }

        failure {
            script {
                telegramNotify(
                    "❌ DEPLOY FAILED RỒI\n\nProject: devops-test\nBranch: main\nPlease check Jenkins."
                )
            }
        }
    }
}
