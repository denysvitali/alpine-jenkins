node {
    def customImage;

    environment {
        REGISTRY_AUTH = credentials("74698836-d9b1-4490-a19a-cfd7af96dab8")
    }

    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        sh "docker build . -t dvitali/jenkins-alpine:${env.BUILD_ID}"
        sh "docker build . -t dvitali/jenkins-alpine:latest"
    }

    stage('Push image') {
        sh "docker login -u=$REGISTRY_AUTH_USR -p=$REGISTRY_AUTH_PSW ${env.REGISTRY_ADDRESS}"
        sh "docker push dvitali/jenkins-alpine:latest"
        sh "docker push dvitali/jenkins-alpine:${env.BUILD_ID}"
    }
}