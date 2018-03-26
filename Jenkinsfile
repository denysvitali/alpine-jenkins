node {
    def customImage;

    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        customImage = docker.build("dvitali/jenkins-alpine")
    }

    stage('Push image') {
        customImage.push("build-${env.BUILD_ID}")
        customImage.push("latest")
    }
}