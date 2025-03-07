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
            steps{
                sh 'touch text-$BUILD_ID'
            }

        }
        stage('display2'){
            steps{
                sh 'ls'
            }
        }
        stage('inventory'){
            steps{
                sh 'lsblk'
            }
        }
    }
}