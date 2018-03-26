node {
    def customImage;

    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        customImage = docker.build("dvitali/jenkins-alpine:build-${env.BUILD_ID}")
    }

    stage('Push image') {
         docker.withRegistry('https://index.docker.io/v1/', 'denvit-docker-hub') {
            customImage.push("build-${env.BUILD_ID}")
            customImage.push("latest")
        }
    }
}