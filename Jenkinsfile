pipeline {

    agent any

    stages{
        stage('display'){
            steps{
                sh 'echo hello world'
            }
        }
        stage('version'){
            steps{
                sh 'cat /etc/os-release'
            }
        }
        stage('file'){
            steps{
                sh 'touch faith'
            }
        }
        stage('test'){
            speps{
                sh 'touch text-$BUILD_ID'
            }

        }
        stage('display'){
            steps{
                sh 'ls'
            }
        }
    }
}