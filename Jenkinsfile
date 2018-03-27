node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        def customImage = docker.build("dvitali/jenkins-alpine:latest")
        withCredentials([usernamePassword(
            credentialsId: "docker-hub-dvitali",
            usernameVariable: "USER",
            passwordVariable: "PASS"
        )]) {
            sh "docker login -u $USER -p $PASS"
        }

        sh "docker tag dvitali/jenkins-alpine:latest dvitali/jenkins-alpine:$BUILD_NUMBER"
        
        sh "docker push dvitali/jenkins-alpine:latest"
        sh "docker push dvitali/jenkins-alpine:$BUILD_NUMBER"
    }
}