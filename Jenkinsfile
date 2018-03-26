node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        def customImage = docker.build("dvitali/jenkins-alpine:${env.BUILD_ID}")
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', '74698836-d9b1-4490-a19a-cfd7af96dab8') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}