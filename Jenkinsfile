node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        def customImage = docker.build("dvitali/jenkins-alpine:latest")
        customImage.push()
        customImage.push("build-${env.BUILD_ID}")
        //customImage.push("latest")
    }
}