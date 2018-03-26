node {
    def customImage;

    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        customImage = docker.build("dvitali/jenkins-alpine:${env.BUILD_ID}")
    }

    stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-dvitali') {
            customImage.push("${env.BUILD_NUMBER}")
            customImage.push("latest")
        }
    }
}