node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        def customImage = docker.build("dvitalitest/jenkins-alpine:latest")
        withCredentials([usernamePassword(
            credentialsId: "docker-hub-dvitalitest",
            usernameVariable: "USER",
            passwordVariable: "PASS"
        )]) {
            sh "docker login -u $USER -p $PASS"
        }
        
        sh "docker push dvitalitest/jenkins-alpine:latest"
    }
}