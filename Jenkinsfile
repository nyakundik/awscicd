pipeline {

    agent any

    environment{
        AWS_REGION = 'us-east-1'
        ECR_REPO = '650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo'
        BRANCH_NAME = 'main'
        GIT_URL = 'https://github.com/nyakundik/awscicd.git'

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
         stage('dockerimagebuild'){
            steps{
                sh 'docker build -t jenkins-repo .'
                sh 'docker build -t imageversion .'
            }
         }
        stage('DockerImageTag'){
            steps{
                sh 'docker tag jenkins-repo:latest 650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo:latest'
                sh 'docker tag imageversion 650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo:v1.$BUILD_NUMBER'
            }
        }
       
        
        stage('PushImage'){
            steps{
                sh 'docker push 650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo:latest'
                sh 'docker push 650251701803.dkr.ecr.us-east-1.amazonaws.com/jenkins-repo:v1.$BUILD_NUMBER'
            }
        }
        stage('Dockerps'){
            steps{
                sh 'docker ps'
            }
        }
        stage('images'){
            steps{
                sh 'docker images'
            }
        }

        stage('git chekout'){
            steps{
                git branch: "${BRANCH_NAME}", url: "${GIT_URL}"
        }
        
    }

    stage('os-version'){
        steps{
            sh 'cat /etc/os-release'
        }
    }


}

}