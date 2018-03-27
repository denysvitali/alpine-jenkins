node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        def customImage = docker.build("dvitali/jenkins-alpine:latest")
    }

    stage('Push Image') {
        def JENKIN_VERSION = sh returnStdout: true, script: "cat Dockerfile | head -n 1 | awk -F ':' '{print \$2}' | awk -F '-' '{print \$1}'"
        withCredentials([usernamePassword(
            credentialsId: "docker-hub-dvitali",
            usernameVariable: "USER",
            passwordVariable: "PASS"
        )]) {
            sh "docker login -u $USER -p $PASS"
        }

        sh "docker tag dvitali/jenkins-alpine:latest dvitali/jenkins-alpine:$BUILD_NUMBER"
        sh "docker tag dvitali/jenkins-alpine:latest dvitali/jenkins-alpine:$JENKINS_VERSION"
        
        sh "docker push dvitali/jenkins-alpine:latest"
        sh "docker push dvitali/jenkins-alpine:$BUILD_NUMBER"
    }
}