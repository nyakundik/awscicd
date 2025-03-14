pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = '650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo'
        BRANCH_NAME = 'main'
        GIT_URL = 'https://github.com/nyakundik/awscicd.git'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: "${BRANCH_NAME}", url: "${GIT_URL}"
            }
        }

        stage('Code Scan') {
            steps {
                sh 'trivy fs . -o result.html'
                sh 'cat result.html || echo "Scan results generated."'
            }
        }

        stage('Docker Login') {
            steps {
                sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-repo .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh '''
                docker tag jenkins-repo:latest $ECR_REPO:latest
                docker tag jenkins-repo:latest $ECR_REPO:v1.$BUILD_NUMBER
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                docker push $ECR_REPO:latest
                docker push $ECR_REPO:v1.$BUILD_NUMBER
                '''
            }
        }

        stage('List Running Containers') {
            steps {
                sh 'docker ps'
            }
        }

        stage('List Docker Images') {
            steps {
                sh 'docker images'
            }
        }

        stage('Check OS Version') {
            steps {
                sh 'cat /etc/os-release'
            }
        }
    }
}
