pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t dvitali/jenkins-alpine:latest .'
            }
        }
        stage('Push to dockerhub') {
            steps {
                sh 'docker push dvitali/jenkins-alpine:latest'
            }
        }
    }
}
