node {
    def customImage;

    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        customImage = docker.build("dvitali/jenkins-alpine:${env.BUILD_ID}")
    }

    stage('Push image') {
        withDockerRegistry([credentialsId: '74698836-d9b1-4490-a19a-cfd7af96dab8', url: 'https://index.docker.io/v1/']) {
            customImage.push("${env.BUILD_NUMBER}")
            customImage.push("latest")
        }
    }
}