pipeline {

    agent any

    stages{

        stage('CodeScan'){
            steps{
                sh 'trivy fs . -o result.html'
                sh 'cat result.html'

            }

        }
        stage('Dockerlogin'){
            steps{
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username \
                 AWS --password-stdin 650251701803.dkr.ecr.us-east-1.amazonaws.com'

            }
        }
        stage('DockerImageTag'){
            steps{
                sh 'docker tag jenkins-repo:latest 650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo:latest'
            }
        }
        stage('dockerimagebuild'){
            steps{
                sh 'docker build -t jenkins-repo .'
            }
        }
        stage('PushImage'){
            steps{
                sh 'docker push 650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo:latest'
            }
        }
    }
    
}