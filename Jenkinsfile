node {
    def customImage;

    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        customImage = docker.build("dvitali/jenkins-alpine:build-${env.BUILD_ID}")
    }

    stage('Push image') {
        customImage.push("build-${env.BUILD_ID}")
        customImage.push("latest")
    }
}